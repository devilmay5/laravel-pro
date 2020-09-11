<?php


namespace App\Http\Controllers;


class RetailOrderController extends BaseController
{
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * 1.新增订单主题
     * 2.新增订单详情
     *  2.1 获取地址
     *  2.2 遍历计算运费
     *  2.3 写入详情
     * 3.删cart_ids
     * @return \Illuminate\Http\JsonResponse
     */
    public function AddRetailFromCart()
    {
        try {
            $rules = [
                'cart_ids' => 'required',
                'address_id' => 'required|exists:address,id',
                'customer_id' => 'required|exists:customer,id',
                'total_original_price' => '',
                'total_actual_price' => '',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);


        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function AddRetailFromPro()
    {

    }

}
