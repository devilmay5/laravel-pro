<?php


namespace App\Http\Controllers;


use App\Services\AskServices;

class CustomerAskController extends BaseController
{
    public function __construct()
    {
        parent::__construct();
    }

    public function AddAsk()
    {
        try {
            $rules = [
                'retail_order_line_id' => 'int|exists:retail_order_line,id',
                'customer_id' => 'required|int|exists:customer,id',
                'pro_id' => 'int|exists:pro_info,id',
                'ask_id' => 'int|exists:customer_ask,id',
                'ask_content'=>'',
                'ask_img'=>'',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            if ($this->request->hasFile('ask_img')) {
                $req['ask_img'] = $this->request->file('ask_img');
            }

            $res = AskServices::addAsk($req);
            return $this->RemoteApiResponse($res->toArray(), self::SUCCESS_CODE, '新增成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function GetAskList()
    {
        try {
            $rules = [
                'customer_id' => 'required',
                'page_index' => 'required',
                'page_size' => 'required',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            [$ask_list, $count] = AskServices::getAskList($req);
            return $this->RemoteApiResponse($ask_list, self::SUCCESS_CODE, '查询成功', $count);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function GetAskItem()
    {
        try {
            $rules = [
                'ask_id' => 'required',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            $ask_list = AskServices::getAskItem($req);
            return $this->RemoteApiResponse($ask_list->toArray(), self::SUCCESS_CODE, '查询成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function GetAskItemByProId()
    {
        try {
            $rules = [
                'customer_id' => 'required',
                'pro_id' => 'required',
                'page_index' => 'required',
                'page_size' => 'required',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            [$ask_list, $count] = AskServices::getAskByProId($req);
            return $this->RemoteApiResponse($ask_list, self::SUCCESS_CODE, '查询成功', $count);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }
}
