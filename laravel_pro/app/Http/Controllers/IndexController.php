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
                $req['order_item'] = 'order_by';
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
                $req['order_item'] = 'order_by';
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
                $req['order_item'] = 'order_by';
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

    public function getProListInBrand()
    {
        try {
            $rules = [
                'page_index' => 'required|int',
                'page_size' => 'required|int',
                'order_item' => 'string', // sale_count,present_price
                'order_type' => 'string', // asc desc
                'brand_id' => 'int|exists:pro_brand,id',
                'class_id' => 'int|exists:pro_class,id',
                'low' => 'numeric',
                'high' => 'numeric'
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            if (!isset($req['order_item'])) {
                $req['order_item'] = 'order_by';
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

    public function getNewProList()
    {
        try {
            $new_pro_group = ProInfoServices::getNewList();
            return $this->RemoteApiResponse($new_pro_group, self::SUCCESS_CODE, '查询成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

}