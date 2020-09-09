<?php

namespace App\Modules;

use Illuminate\Database\Eloquent\Model;

class Map extends Model
{
    //
    protected $table = 'map';

    const COUNTRY_CODE = [
        ['KEY' => 0, 'NAME' => '其他'],
        ['KEY' => 1, 'NAME' => '中国'],
    ];

    public function scopeOfCountry($query, $country)
    {
        if($country){
            $query = $query->where('country',$country);
        }
        return $query;
    }

    public function scopeOfParent($query,$parent){
        $query = $query->where('parent_code',$parent);
        return $query;
    }


    public static function getInfoByCode($code)
    {
        return self::query()->where('code', $code)->first();
    }
}
