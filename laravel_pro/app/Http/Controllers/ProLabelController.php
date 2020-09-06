<?php

namespace App\Http\Controllers;

use App\Services\ProLabelServices;

class ProLabelController extends BaseController
{
    public function __construct()
    {
        parent::__construct();
    }

    public function GetProLabelSelect()
    {
        try {
            $label_group = ProLabelServices::getProLabelSelect();
            return response()->json($label_group);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function GetProLabelList()
    {
        try {
            $label_group = ProLabelServices::getEnableList();
            return $this->RemoteApiResponse($label_group, self::SUCCESS_CODE, '查询成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }
}
