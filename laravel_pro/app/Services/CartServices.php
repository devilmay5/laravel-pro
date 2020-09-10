<?php


namespace App\Services;


use App\Modules\Cart;

class CartServices
{
    /**
     * @param array $req
     * @return array
     */
    public static function addCart(array $req): array
    {
        CartServices::checkHasAdd($req['customer_id'], $req['pro_id'], json_decode($req['pro_sku_param'], true));
        exit;
        return Cart::create($req)->toArray();
    }

    public static function checkHasAdd(int $customer_id, int $pro_id, array $pro_sku_param)
    {
        $is_check = false;
        $cart_group = Cart::query()->ofProId($pro_id)
            ->ofCustomerId($customer_id)
            ->get();

        if ($cart_group->isNotEmpty()) {
            foreach ($cart_group as $item) {
                //TODO 比较除了 pic price  stock 之外的 N个Key的值是否一样
                print_r($item['pro_sku_param']);
                print_r($pro_sku_param);
                exit;
            }
            $is_check = true;
        }
        return $is_check;
    }
}
