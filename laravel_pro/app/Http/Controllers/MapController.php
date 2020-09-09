<?php

namespace App\Http\Controllers;

use App\Modules\Map;
use App\Services\MapServices;
use Illuminate\Http\Request;

class MapController extends BaseController
{
    //
    public function __construct()
    {
        parent::__construct();
    }

    public function GetCountrySelect()
    {
        try {
            $country_group = Map::COUNTRY_CODE;
            $return = [];
            foreach ($country_group as $key => $item) {
                $return[$key]['id'] = $item['KEY'];
                $return[$key]['text'] = $item['NAME'];
            }

            return response()->json($return);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function GetProvinceSelect()
    {
        try {
            $rules = [
                'q' => ''
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            $province = MapServices::getProvince($req['q'] ?? 0);

            return response()->json($province);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }
}
