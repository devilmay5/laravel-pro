<?php

namespace App\Http\Controllers;

use App\Services\ProCollectionServices;
use Illuminate\Http\Request;

class ProCollectionController extends BaseController
{
    //
    public function __construct()
    {
        parent::__construct();
    }

    public function addProInfoCollection()
    {
        try {
            $rules = [
                'customer_id' => 'required|exists:customer,id',
                'pro_id' => 'required|exists:pro_info,id',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            $pro_collection = ProCollectionServices::addProCollection($req);

            return $this->RemoteApiResponse($pro_collection->toArray(), self::SUCCESS_CODE, '添加成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function addBrandCollection()
    {
        try {
            $rules = [
                'customer_id' => 'required|exists:customer,id',
                'brand_id' => 'required|exists:pro_brand,id',
            ];

            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            $brand_collection = ProCollectionServices::addBrandCollection($req);
            return $this->RemoteApiResponse($brand_collection->toArray(), self::SUCCESS_CODE, '添加成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function delProInfoCollection()
    {
        try {
            $rules = [
                'customer_id' => 'required|exists:customer,id',
                'pro_id' => 'required|exists:pro_info,id',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            ProCollectionServices::delProCollection($req);

            return $this->RemoteApiResponse([], self::SUCCESS_CODE, '取消成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function delBrandCollection()
    {
        try {
            $rules = [
                'customer_id' => 'required|exists:customer,id',
                'brand_id' => 'required|exists:pro_brand,id',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            ProCollectionServices::delBrandCollection($req);

            return $this->RemoteApiResponse([], self::SUCCESS_CODE, '取消成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }


    public function getProInfoCollection()
    {
        try {
            $rules = [
                'customer_id' => 'required|exists:customer,id',
                'pro_id' => 'exists:pro_info,id',
                'page_size' => 'required',
                'page_index' => 'required',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            [$res, $count] = ProCollectionServices::getProCollection($req);
            return $this->RemoteApiResponse($res, self::SUCCESS_CODE, '查询成功', $count);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function getBrandCollection()
    {
        try {
            $rules = [
                'customer_id' => 'required|exists:customer,id',
                'brand_id' => 'exists:pro_brand,id',
                'page_size' => 'required',
                'page_index' => 'required',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            [$res, $count] = ProCollectionServices::getBrandCollection($req);
            return $this->RemoteApiResponse($res, self::SUCCESS_CODE, '查询成功', $count);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

}
