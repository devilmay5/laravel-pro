<?php


namespace App\Http\Controllers;


use App\Services\RetailRefundServices;

class RetailRefundController extends BaseController
{
    public function __construct()
    {
        parent::__construct();
    }

    public function CreateRetailRefund()
    {
        try {
            $rules = [
                'retail_order_line_id' => 'required|exists:retail_order_line,id',
                'refuse_content' => 'required',
                'customer_id' => 'required',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            if ($this->request->hasFile('refuse_image_url')) {
                $req['refuse_image_url'] = $this->request->file('refuse_image_url');
            }

            $res = RetailRefundServices::addRetailRefund($req);
            return $this->RemoteApiResponse($res->toArray(), self::SUCCESS_CODE, '新增成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function GetRetailRefundList()
    {
        try {
            $rules = [
                'customer_id' => 'required',
                'page_index' => 'required',
                'page_size' => 'required',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            [$refund_group, $count] = RetailRefundServices::getRetailRefundList($req);

            $refund_group = collect($refund_group)->map(function ($item) {
                $item['pro_sku'] = json_decode($item['pro_sku'], true);
                return $item;
            })->toArray();

            return $this->RemoteApiResponse($refund_group, self::SUCCESS_CODE, '查询成功', $count);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function GetRetailRefundInfo()
    {
        try {
            $rules = [
                'retail_refund_id' => 'required|exists:retail_refund,id'
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            $res = RetailRefundServices::getRetailRefundInfo($req['retail_refund_id']);
            return $this->RemoteApiResponse($res->toArray(), self::SUCCESS_CODE, '查询成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }
}