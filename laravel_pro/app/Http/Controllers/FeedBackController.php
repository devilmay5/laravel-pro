<?php


namespace App\Http\Controllers;


use App\Services\FeedBackServices;

class FeedBackController extends BaseController
{
    public function __construct()
    {
        parent::__construct();
    }

    public function AddFeedBack()
    {
        try {
            $rules = [
                'customer_id' => 'required|exists:customer,id',
                "content" => 'required',
                'mobile' => 'required'
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            $res = FeedBackServices::addFeedback($req);
            return $this->RemoteApiResponse($res->toArray(), self::SUCCESS_CODE, '新增成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }
}