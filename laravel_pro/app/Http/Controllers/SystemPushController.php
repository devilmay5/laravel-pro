<?php


namespace App\Http\Controllers;


use App\Services\SystemPushServices;

class SystemPushController extends BaseController
{
    public function __construct()
    {
        parent::__construct();
    }

    public function GetSystemPushList()
    {
        try {
            $rules = [
                'page_index' => 'required|int',
                'page_size' => 'required|int',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            [$push_list, $count] = SystemPushServices::getSystemPushList($req);
            return $this->RemoteApiResponse($push_list, self::SUCCESS_CODE, '查询成功', $count);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }
}