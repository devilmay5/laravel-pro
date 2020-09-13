<?php

namespace App\Http\Controllers;


use App\Modules\ProInfo;
use App\Services\ProInfoServices;

class ProInfoController extends BaseController
{

    //
    public function __construct()
    {
        parent::__construct();
    }

    public function GetProList()
    {
        try {
            $rules = [
                'page_index' => 'int',
                'page_size' => 'int',
                'brand_id' => 'int',
                'class_id' => 'int'
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            [$pro_info_group, $count] = ProInfoServices::getProList(
                $req['brand_id'] ?? 0,
                $req['class_id'] ?? 0,
                $req['page_index'] ?? 0,
                $req['page_size'] ?? 0
            );

            return $this->RemoteApiResponse($pro_info_group, self::SUCCESS_CODE, '查询成功', $count);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function GetProInfo()
    {
        try {
            $rules = [
                'pro_id' => 'required|exists:pro_info,id'
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            $proInfo = ProInfoServices::getProInfo($req['pro_id']);
            if ($proInfo['status'] == ProInfo::STATUS_CODE['DISABLE']) {
                throw new \Exception('此商品已下架！');
            }
            $proInfo['sku_params'] = json_decode($proInfo['sku_params'], true);
            return $this->RemoteApiResponse($proInfo, self::SUCCESS_CODE, '查询成功', 1);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function GetRecommendList()
    {
        try {
            $rules = [
                'page_index' => 'int',
                'page_size' => 'int',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            [$recommend_group, $count] = ProInfoServices::getRecommendList(
                $req['page_index'] ?? 0,
                $req['page_size'] ?? 0
            );
            return $this->RemoteApiResponse($recommend_group, self::SUCCESS_CODE, '查询成功', $count);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }
}
