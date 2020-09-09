<?php

namespace App\Http\Controllers;


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
            //这个sku的扩展使得 sku_params字段被json_encode两次才入库，在设置属性那里反解一次，这里根据前端需要 看看是否还需要二次反解 彻底转为json数组
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
