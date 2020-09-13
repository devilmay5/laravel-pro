<?php


namespace App\Http\Controllers;


use App\Services\RetailOrderServices;

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
                'cart_ids' => 'required|json',
                'address_id' => 'required|exists:address,id',
                'customer_id' => 'required|exists:customer,id',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            $obj_retail_order = RetailOrderServices::addRetailOrderFromCart($req);
            return $this->RemoteApiResponse($obj_retail_order->toArray(), self::SUCCESS_CODE, '提交订单成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function AddRetailFromPro()
    {
        try {
            $rules = [
                'pro_id' => 'required|exists:pro_info,id',
                'address_id' => 'required|exists:address,id',
                'customer_id' => 'required|exists:customer,id',
                'pro_sku_param' => 'required|json',
                'pro_unit_price' => 'required',
                'pro_count' => 'required',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            $obj_retail_order = RetailOrderServices::addRetailOrderFromPro($req);
            return $this->RemoteApiResponse($obj_retail_order->toArray(), self::SUCCESS_CODE, '提交订单成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

}
