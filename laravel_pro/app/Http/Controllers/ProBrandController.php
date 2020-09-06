<?php

namespace App\Http\Controllers;


use App\Services\ProBrandServices;

class ProBrandController extends BaseController
{
    //
    public function __construct()
    {
        parent::__construct();
    }

    public function GetBrandList()
    {
        try {
            $rules = [
                'label_id' => 'int'
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            [$pro_brand_group, $count] = ProBrandServices::getBrandList($req['label_id'] ?? 0);
            return $this->RemoteApiResponse($pro_brand_group, self::SUCCESS_CODE, '查询成功', $count);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function GetBrandInfo()
    {
        try {
            $rules = [
                'brand_id' => 'required|int'
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            $pro_brand = ProBrandServices::getBrandInfo($req['brand_id']);
            return $this->RemoteApiResponse($pro_brand, self::SUCCESS_CODE, '查询成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }
}
