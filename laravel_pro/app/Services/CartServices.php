<?php


namespace App\Services;

use App\Modules\FreightTemplate;
use App\Modules\ProInfo;
use Illuminate\Support\Arr;
use App\Modules\Cart;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class CartServices
{

    /**
     * @param array $req
     * @throws \Exception
     */
    public static function checkStock(array $req)
    {
        $proInfo = ProInfo::query()->where('id', $req['pro_id'])->lockForUpdate()->first();

        $sku_arr = json_decode($proInfo->sku_params, true);
        $req_sku_param = json_decode($req['pro_sku_param'], true);

        if (in_array($req_sku_param, $sku_arr['sku'])) {
            //如果请求的数量大于
            if ($req['pro_count'] > $req_sku_param['stock']) {
                throw new \Exception('购买数量不得大于规格限定数量！');
            }

        } else {
            throw new \Exception('规格参数无效，请核实！');
        }

    }

    /**
     * @param array $req
     * @return bool
     */
    public static function addCart(array $req): bool
    {
        DB::transaction(function () use ($req) {
            //验证提交数量与库存对比
            self::checkStock($req);
            //获取这个客户买的产品的购物车信息列表
            [$cart_group, $count] = self::getCartList($req['customer_id'], $req['pro_id']);
            if ($cart_group) {
                $different_num = 0; // 当前购物车数量遍历次数
                foreach ($cart_group as $item) {
                    //比较除了 pic price  stock 之外的 N个Key的值是否一样,如果都一样，说明就是一个sku属性
                    $tmp_item = Arr::except($item['pro_sku_param'], ['pic', 'price', 'stock']);
                    $tmp_pro_sku_param = Arr::except(
                        json_decode($req['pro_sku_param'], true),
                        ['pic', 'price', 'stock']
                    );

                    if (!array_diff($tmp_item, $tmp_pro_sku_param)) {
                        // 如果sku都一样的话，则改数量和总价就行
                        $item->pro_count += $req['pro_count'];
                        $item->pro_total_price = $item->pro_count * $item->pro_unit_price;
                        $item->save();
                    } else {
                        $different_num++;
                    }
                }
                //如果这个客户关于这个产品的整个购物车列表都跑了一遍了，发现还是没有相同的sku，则直接新增
                if ($different_num == $count) {
                    Cart::create($req)->toArray();
                }

            } else {
                // 这个客户压根就没对这个产品加过购物车，则直接新增
                Cart::create($req)->toArray();
            }
        });
        return true;
    }


    /**
     * @param int $customer_id
     * @param int $pro_id
     * @param int $page_index
     * @param int $page_size
     * @return array
     */
    public static function getCartList(int $customer_id, int $pro_id = 0, int $page_index = 1, int $page_size = 20): array
    {
        $select = [
            'cart.id as cart_id',
            'customer_id',
            'pro_id',
            'pro_sku_param',
            'pro_count',
            'pro_unit_price',
            'pro_total_price',
            'pro_info.pro_name as pro_name',
            'pro_brand.brand_name as brand_name',
            'pro_brand.brand_image as brand_image'
        ];
        $query = Cart::query()->select($select)
            ->join('pro_info', 'pro_info.id', '=', 'cart.pro_id')
            ->join('pro_brand','pro_info.brand_id', '=', 'pro_brand.id')
            ->ofCustomerId($customer_id)
            ->ofProId($pro_id)
            ->orderBy('cart_id', 'desc');

        $count = $query->count();

        if ($page_index && $page_size) {
            $query = $query->offset(($page_index - 1) * $page_size)->limit($page_size);
        }

        $return_cart = $query->get();

//        if ($return_cart->isEmpty()) {
//            $return_cart = (object)[];
//        }

        return [$return_cart, $count];
    }

    /**
     * @param array $req
     * @return mixed
     */
    public static function updateCart(array $req)
    {
        $cart = Cart::find($req['cart_id']);
        $cart->pro_count = $req['pro_count'];
        $cart->pro_total_price = $cart->pro_count * $cart->pro_unit_price;
        $cart->save();

        return $cart->toArray();
    }

    /**
     * @param int $cart_id
     * @return int
     */
    public static function delCart(int $cart_id)
    {
        return Cart::destroy($cart_id);
    }

    /**
     * @param int $pro_id
     * @param $pro_sku
     */
    public static function checkSkuIsEnable(int $pro_id, $pro_sku)
    {
        DB::transaction(function () use ($pro_sku, $pro_id) {
            $pro_sku = json_decode($pro_sku, true);
            $cart_group = Cart::query()->ofProId($pro_id)->get();
            if ($cart_group) {
                foreach ($cart_group as $item) {
                    $cart_pro_sku_param = $item->pro_sku_param;
                    $tmp_cart_pro_sku_param = Arr::except($cart_pro_sku_param, ['pic', 'price', 'stock']);
                    $different = 0;
                    //遍历即将保存的sku参数，判断除了'pic', 'price', 'stock'这三个字段的其他所有字段是否和当前购物车中的产品sku字段一致
                    foreach ($pro_sku['sku'] as $item_sku) {
                        $tmp_pro_sku_param = Arr::except($item_sku, ['pic', 'price', 'stock']);
                        if ($tmp_cart_pro_sku_param == $tmp_pro_sku_param) {
                            $cart_pro_sku_param['price'] = $item_sku['price'];
                            $cart_pro_sku_param['stock'] = $item_sku['stock'];
                            $item->pro_sku_param = json_encode($cart_pro_sku_param);
                            $item->pro_unit_price = $item_sku['price'];
                            $item->pro_total_price = $item->pro_unit_price * $item->pro_count;
                            $item->save();
                        } else {
                            $different++;
                        }
                    }
                    //都没有则删掉这条购物车信息
                    if ($different == count($pro_sku['sku'])) {
                        $item->delete();
                    }
                }
            }
        });
    }
}
