<?php


namespace App\Http\Controllers;


use App\Modules\ProInfo;
use App\Services\ProInfoServices;

class IndexController extends BaseController
{
    public function __construct()
    {
        parent::__construct();
    }

    public function GetIndexProSearch()
    {
        try {
            $rules = [
                'pro_name' => 'required',
                'page_index' => 'required|int',
                'page_size' => 'required|int',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            if (!isset($req['order_item'])) {
                $req['order_item'] = 'id';
            }

            if (!isset($req['order_type'])) {
                $req['order_type'] = 'desc';
            }

            [$pro_group, $count] = ProInfoServices::getSearchList($req);
            return $this->RemoteApiResponse($pro_group, self::SUCCESS_CODE, '查询成功', $count);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function GetRecommendList()
    {
        try {
            $rules = [
                'page_index' => 'required|int',
                'page_size' => 'required|int',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            if (!isset($req['order_item'])) {
                $req['order_item'] = 'id';
            }

            if (!isset($req['order_type'])) {
                $req['order_type'] = 'desc';
            }
            $req['is_recommend'] = ProInfo::IS_RECOMMEND['ENABLE'];
            [$pro_group, $count] = ProInfoServices::getSearchList($req);
            return $this->RemoteApiResponse($pro_group, self::SUCCESS_CODE, '查询成功', $count);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function GetProList()
    {
        try {
            $rules = [
                'page_index' => 'required|int',
                'page_size' => 'required|int',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            if (!isset($req['order_item'])) {
                $req['order_item'] = 'id';
            }

            if (!isset($req['order_type'])) {
                $req['order_type'] = 'desc';
            }
            [$pro_group, $count] = ProInfoServices::getSearchList($req);
            return $this->RemoteApiResponse($pro_group, self::SUCCESS_CODE, '查询成功', $count);

        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }
}