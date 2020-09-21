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
                'pro_id' => 'required|int|exists:pro_info,id',
                'ask_id' => 'int|exists:customer_ask,id',
                'ask_content',
                'ask_img',
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
}