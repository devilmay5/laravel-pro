<?php

namespace App\Http\Controllers;

use App\Modules\Cart;
use App\Services\CartServices;
use Illuminate\Http\Request;

class CartController extends BaseController
{
    //
    public function __construct()
    {
        parent::__construct();
    }

    /**
     *  customer_id:1
     * pro_id:1
     * pro_sku_param:{"颜色":"红色","尺码":"42","pic":"/upload/images/05pPX5pqP9GnEgpOnx90rYeWagLp9ETqtJiCZLhv.jpeg","price":"100","stock":"10"}
     * pro_count:2
     * pro_unit_price:100
     * pro_total_price:200
     */
    public function CreateCart()
    {
        try {
            $rules = [
                'customer_id' => 'required|exists:customer,id',
                'pro_id' => 'required|exists:pro_info,id',
                'pro_sku_param' => 'required|json',
                'pro_count' => 'required|int',
                'pro_unit_price' => 'required',
                'pro_total_price' => 'required'
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);


            CartServices::addCart($req);
            return $this->RemoteApiResponse([], self::SUCCESS_CODE, '添加购物车成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function GetCart()
    {
        try {
            $rules = [
                'customer_id' => 'required|exists:customer,id',
                'page_index' => 'int',
                'page_size' => 'int',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            [$cart_list, $count] = CartServices::getCartList($req['customer_id'], 0, $req['page_index'], $req['page_size']);
            return $this->RemoteApiResponse($cart_list, self::SUCCESS_CODE, '查询成功', $count);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function UpdateCart()
    {
        try {
            $rules = [
                'cart_id' => 'required|exists:cart,id',
                'pro_count' => 'required',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            $cart = CartServices::updateCart($req);
            return $this->RemoteApiResponse($cart, self::SUCCESS_CODE, '更新成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function DeleteCart()
    {
        try {
            $rules = [
                'cart_id' => 'required|exists:cart,id',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            CartServices::delCart($req['cart_id']);
            return $this->RemoteApiResponse([], self::SUCCESS_CODE, '删除成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

}
