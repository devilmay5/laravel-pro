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

        return Cart::create($req)->toArray();
    }
}
