<?php


namespace App\Http\Controllers;


use App\Services\NewsServices;

class NewsController extends BaseController
{
    public function __construct()
    {
        parent::__construct();
    }

    public function GetNewsList()
    {
        try {
            $res = NewsServices::getNewsList();
            return $this->RemoteApiResponse($res);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function GetNewsInfo()
    {
        try {
            $rules = [
                'id' => 'required|exists:news,id'
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            $info = NewsServices::getNewsInfo($req['id']);
            return $this->RemoteApiResponse($info);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }
}
