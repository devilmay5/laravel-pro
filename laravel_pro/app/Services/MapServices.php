<?php

namespace App\Services;


use App\Modules\Map;

class MapServices
{
    /**
     * @param $code
     * @return Map|\Illuminate\Database\Eloquent\Model|object|null
     */
    public static function getInfoByCode($code)
    {
        return Map::getInfoByCode($code);
    }

    /**
     * @param $country
     * @return array|\Illuminate\Database\Eloquent\Builder[]|\Illuminate\Database\Eloquent\Collection
     */
    public static function getProvince($country)
    {
        $select = [
            'code as id',
            'name as text'
        ];
        $province = Map::query()->select($select)
            ->ofCountry($country)
            ->ofParent(0)
            ->get();
        if ($province->isNotEmpty()) {
            $province = $province->toArray();
        } else {
            $province = [['id' => 0, 'text' => '其他']];
        }
        return $province;
    }
}