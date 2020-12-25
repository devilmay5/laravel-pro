<?php


namespace App\Modules;


class ExpressDictionary extends BaseModel
{
    protected $table = 'express_dictionary';
    public $timestamps = false;

    public function scopeOfCode($query, $code)
    {
        if ($code) {
            $query = $query->where('code', $code);
        }
        return $query;
    }
}
