<?php


namespace App\Services;


use App\Modules\Address;
use App\Modules\Cart;
use App\Modules\FreightTemplate;
use App\Modules\ProInfo;
use App\Modules\RetailOrder;
use App\Modules\RetailOrderLine;
use Illuminate\Support\Facades\DB;

class RetailOrderServices
{
    public static function getRetailOrderLineInfo(array $req)
    {
        $select = [
            'id as retail_order_line_id',
            'created_at',
            'retail_order_id',
            'retail_name',
            'customer_id',
            'pro_id',
            'pro_name',
            'pro_sku',
            'unit_price',
            'unit_count',
            'freight',
            'pay_type',
            'pay_status',
            'pay_serial_number',
            'pay_time',
            'delivery_time',
            'sign_time',
            'logistics_number'
        ];

        $retail_order_line = RetailOrderLine::select($select)->find($req['retail_order_line_id'])->toArray();

        $retail_order = RetailOrder::find($retail_order_line['retail_order_id']);
        $retail_order_line['address'] = Address::find($retail_order['address_id'])->toArray();

        $province = MapServices::getInfoByCode($retail_order_line['address']['province']);
        $retail_order_line['address']['province'] = $province['name'];

        $city = MapServices::getInfoByCode($retail_order_line['address']['city']);
        $retail_order_line['address']['city'] = $city['name'];

        $area = MapServices::getInfoByCode($retail_order_line['address']['area']);
        $retail_order_line['address']['area'] = $area['name'];

        return $retail_order_line;
    }

    /**
     * @param array $req
     * @return array
     */
    public static function getRetailOrderLineList(array $req): array
    {
        $select = [
            'id as retail_order_line_id',
            'retail_order_id',
            'retail_name',
            'customer_id',
            'pro_id',
            'pro_name',
            'pro_sku',
            'unit_price',
            'unit_count',
            'freight',
            'pay_type',
            'pay_status',
            'pay_serial_number',
            'pay_time',
            'delivery_time',
            'sign_time',
            'logistics_number'
        ];
        $query = RetailOrderLine::query()->select($select)
            ->ofCustomerId($req['customer_id'])
            ->ofPayStatus($req['pay_status'] ?? false);

        $query = $query->orderBy("id", "desc");
        $count = $query->count();

        if (isset($req['page_index']) && isset($req['page_size'])) {
            $query = $query->offset(($req['page_index'] - 1) * $req['page_size'])->limit($req['page_size']);
        }

        $res = $query->get();
        if ($res->isNotEmpty()) {
            $res = $res->toArray();
        } else {
            $res = [];
        }
        return [$res, $count];
    }

    /**
     * @param array $req
     * @return mixed
     */
    public static function addRetailOrderFromPro(array $req)
    {
        $obj_retail_order = DB::transaction(function () use ($req) {
            $total_actual_price = 0;
            $obj_retail_order = self::createRetailOrder($req);
            $retail_order_line = self::createRetailOrderLine($obj_retail_order, $req, $req['pro_id'], $req['pro_unit_price'], $req['pro_count'], ['pro_count' => $req['pro_count']], $req['pro_sku_param']);
            $total_actual_price += $retail_order_line['unit_price'] * $retail_order_line['unit_count'] + $retail_order_line['freight'];
            $obj_retail_order->save();
            return $obj_retail_order;
        });
        return $obj_retail_order;
    }

    /**
     * @param array $req
     * @return mixed
     */
    public static function addRetailOrderFromCart(array $req)
    {
        $obj_retail_order = DB::transaction(function () use ($req) {
            $req['cart_ids'] = json_decode($req['cart_ids'], true);

            if ($req['cart_ids']) {
                $obj_retail_order = self::createRetailOrder($req);
                $cart_group = Cart::query()->whereIn('id', $req['cart_ids'])->get();
                if ($cart_group->isNotEmpty()) {
                    $total_actual_price = 0;
                    foreach ($cart_group as $item) {
                        $retail_order_line = self::createRetailOrderLine($obj_retail_order, $req, $item['pro_id'], $item->pro_unit_price, $item->pro_count, $item, $item['pro_sku_param']);
                        $total_actual_price += $retail_order_line['unit_price'] * $retail_order_line['unit_count'] + $retail_order_line['freight'];
                    }
                    $obj_retail_order->total_actual_price = $total_actual_price;
                    $obj_retail_order->save();
                    Cart::query()->whereIn('id', $req['cart_ids'])->delete();
                    return $obj_retail_order;
                } else {
                    throw new \Exception('添加购物车失败！');
                }
            } else {
                throw new \Exception('提交的购物车不得为空');
            }
        });
        return $obj_retail_order;
    }

    /**
     * @param array $req
     * @return mixed
     * @throws \Exception
     */
    public static function createRetailOrder(array $req)
    {
        $retail_order = [];
        $retail_order['retail_name'] = self::createRetailName($req['customer_id']);
        $retail_order['customer_id'] = $req['customer_id'];
        $retail_order['address_id'] = $req['address_id'];
        $obj_retail_order = RetailOrder::create($retail_order);
        return $obj_retail_order;
    }

    /**
     * @param $obj_retail_order
     * @param $req
     * @param $pro_id
     * @param $pro_unit_price
     * @param $pro_count
     * @param $feight
     * @param $pro_sku_param
     * @return mixed
     */
    public static function createRetailOrderLine($obj_retail_order, $req, $pro_id, $pro_unit_price, $pro_count, $feight, $pro_sku_param)
    {
        $retail_order_line = [];
        $retail_order_line['retail_order_id'] = $obj_retail_order->id;
        $retail_order_line['retail_name'] = $obj_retail_order->retail_name;
        $retail_order_line['customer_id'] = $req['customer_id'];

        $proInfo = ProInfo::find($pro_id);
        $retail_order_line['pro_id'] = $pro_id;
        $retail_order_line['brand_id'] = $proInfo['brand_id'];
        $retail_order_line['pro_name'] = $proInfo['pro_name'];
        $retail_order_line['pro_sku'] = $pro_sku_param;

        $retail_order_line['unit_price'] = $pro_unit_price;
        $retail_order_line['unit_count'] = $pro_count;

        $retail_order_line['freight'] = self::executeFreight($feight, $proInfo['freight_template_id'], $obj_retail_order->address_id);

        $retail_order_line['pay_type'] = RetailOrderLine::PAY_TYPE['NO_PAY'];
        $retail_order_line['pay_status'] = RetailOrderLine::PAY_STATUS['TO_BE_PAY'];
        $retail_order_line = RetailOrderLine::create($retail_order_line);

        return $retail_order_line;
    }

    /**
     * @param $customer_id
     * @return string
     * @throws \Exception
     */
    public
    static function createRetailName($customer_id)
    {
        return date('YmdHis', time()) . str_pad($customer_id, 10, '0', STR_PAD_LEFT) . random_int(0, 9999);
    }

    /**
     * @param $cart
     * @param int $freight_template_id
     * @param int $address_id
     * @return float|int
     */
    public
    static function executeFreight($cart, int $freight_template_id, int $address_id)
    {
        $freight = FreightTemplate::find($freight_template_id);
        $address = Address::find($address_id);

        //包邮则直接返回0
        if ($freight->is_free_shipping == FreightTemplate::BAOYOU) {
            return 0;
        }

        if ($freight->other_template) {  //判断是否特殊地区是否有值
            $other_address_code = array_column($freight->other_template, 'text');
            $other_template = array_combine($other_address_code, $freight->other_template);
            if (isset($other_template[$address['province']])) {
                if ($cart['pro_count'] <= $other_template[$address['province']]['default_piece']) {
                    $price = $cart['pro_count'] * $other_template[$address['province']]['default_price'];
                } else {
                    $price = $other_template[$address['province']]['default_piece'] * $other_template[$address['province']]['default_price'];

                    $price += (($cart['pro_count'] - $other_template[$address['province']]['default_piece']) % $other_template[$address['province']]['incr_piece']) * $other_template[$address['province']]['incr_price'];
                }
                return $price;
            }
        }

        if ($freight->default_template) {
            if ($cart['pro_count'] <= $freight->default_template['default_piece']) {
                $price = $cart['pro_count'] * $freight->default_template['default_price'];
            } else {
                $price = $freight->default_template['default_piece'] * $freight->default_template['default_price'];

                $price += (($cart['pro_count'] - $freight->default_template['default_piece']) % $freight->default_template['incr_piece']) * $freight->default_template['incr_price'];
            }
            return $price;
        }
    }
}