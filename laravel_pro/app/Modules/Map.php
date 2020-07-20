<?php

namespace App\Modules;

use Illuminate\Database\Eloquent\Model;

class Map extends Model
{
    //
    protected $table = 'map';

    public static function getInfoByCode($code)
    {
        return self::query()->where('code', $code)->first();
    }
}
