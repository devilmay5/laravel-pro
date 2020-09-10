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
        pro_id:1
        pro_sku_param:{"颜色":"红色","尺码":"42","pic":"/upload/images/05pPX5pqP9GnEgpOnx90rYeWagLp9ETqtJiCZLhv.jpeg","price":"100","stock":"10"}
        pro_count:2
        pro_unit_price:100
        pro_total_price:200
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

            $cart = CartServices::addCart($req);
            return $this->RemoteApiResponse($cart,self::SUCCESS_CODE,'添加购物车成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }
}
