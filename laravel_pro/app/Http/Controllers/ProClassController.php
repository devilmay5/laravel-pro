<?php

namespace App\Http\Controllers;

use App\Services\ProClassServices;
use Illuminate\Http\Request;

class ProClassController extends BaseController
{
    //
    public function __construct()
    {
        parent::__construct();
    }

    public function GetClassList()
    {
        try {
            $rules = [
                'brand_id' => 'required',
                'page_index' => 'int',
                'page_size' => 'int',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            [$pro_class_group, $count] = ProClassServices::getClassList(
                $req['brand_id'] ?? 0,
                $req['page_index'] ?? 0,
                $req['page_size'] ?? 0
            );

            return $this->RemoteApiResponse($pro_class_group, self::SUCCESS_CODE, '查询成功', $count);

        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }
}
