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

    public function GetRetailList()
    {
        try {
            $rules = [
                'customer_id' => 'required|exists:customer,id',
                'page_index' => 'int',
                'page_size' => 'int',
                'pay_status' => 'int',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            [$res, $count] = RetailOrderServices::getRetailOrderLineList($req);
            return $this->RemoteApiResponse($res, self::SUCCESS_CODE, '查询成功', $count);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function GetRetailInfo()
    {
        try {
            $rules = [
                'retail_order_line_id' => 'required|exists:retail_order_line,id',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            $retail = RetailOrderServices::getRetailOrderLineInfo($req);
            return $this->RemoteApiResponse($retail, self::SUCCESS_CODE, '查询成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function UpdateRetailStatus()
    {
        try {
            $rules = [
                'retail_order_line_id' => 'required|exists:retail_order_line,id',
                'pay_status' => 'required',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            $res = RetailOrderServices::updateRetailStatus($req);
            return $this->RemoteApiResponse([$res], self::SUCCESS_CODE, '更新成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function RetailPayBack()
    {
        try {
            $rules = [
                'customer_id' => 'required',
                'retail_name' => 'exists:retail_order,retail_name',
                'retail_order_line_id' => 'exists:retail_order_line,id',
                'pay_serial_number' => 'required',
                'pay_type' => 'required'
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            $res = RetailOrderServices::payBack($req);
            return $this->RemoteApiResponse($res->toArray(), self::SUCCESS_CODE, '回调成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }
}
