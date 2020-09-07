<?php

namespace App\Http\Controllers;


use App\Services\ProBrandServices;
use Illuminate\Support\Arr;

class ProBrandController extends BaseController
{
    //
    public function __construct()
    {
        parent::__construct();
    }

    public function GetBrandSelect()
    {
        try {
            $rules = [
                'q' => 'required'
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            [$pro_brand_group, $count] = ProBrandServices::getBrandList($req['q'] ?? 0);

            $return = [];
            foreach ($pro_brand_group as $key => $item) {
                $return[$key]['id'] = $item['id'];
                $return[$key]['text'] = $item['brand_name'];
            }

            return response()->json($return);

        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function GetBrandList()
    {
        try {
            $rules = [
                'label_id' => 'int',
                'page_index' => 'int',
                'page_size' => 'int',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            [$pro_brand_group, $count] = ProBrandServices::getBrandList(
                $req['label_id'] ?? 0,
                $req['page_index'] ?? 0,
                $req['page_size'] ?? 0
            );
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
