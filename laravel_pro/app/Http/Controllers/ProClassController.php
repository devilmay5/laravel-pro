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

    public function GetClassSelect()
    {
        try {
            $rules = [
                'q' => '',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            $return = [];
            if (isset($req['q']) && $req['q'] != "") {
                [$pro_class_group, $count] = ProClassServices::getClassList($req['q']);
                foreach ($pro_class_group as $key => $item) {
                    $return[$key]['id'] = $item['class_id'];
                    $return[$key]['text'] = $item['class_name'];
                }
            }

            return response()->json($return);

        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function GetClassList()
    {
        try {
            $rules = [
                'brand_id' => 'int|exists:pro_brand,id',
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

    public function GetRootClass()
    {
        try {
            $res = ProClassServices::getRootClass();
            return response()->json($res);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function GetChildClass()
    {
        try {
            $rules = [
                'q' => '',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            if ($req['q'] != "") {
                $res = ProClassServices::getRootClass($req['q']);
            } else {
                $res = [];
            }

            return response()->json($res);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function GetAllClass()
    {
        try {
            $res = ProClassServices::getRootClass(false);
            return response()->json($res);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }
}
