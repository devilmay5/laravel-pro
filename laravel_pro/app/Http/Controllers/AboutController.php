<?php


namespace App\Http\Controllers;


use App\Services\AboutService;

class AboutController extends BaseController
{
    public function __construct()
    {
        parent::__construct();
    }

    public function GetAboutList()
    {
        try {
            $result = AboutService::getAboutList();
            return $this->RemoteApiResponse($result, self::SUCCESS_CODE, '查询成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }
}