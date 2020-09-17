<?php

namespace App\Modules;


use App\Services\ProBrandServices;

class ProBrand extends BaseModel
{
    //
    protected $table = "pro_brand";
    protected $fillable = [
        'created_at',
        'updated_at',
        'label_id',
        'brand_name',
        'description',
        'brand_image',
        'status',
        'order_by'
    ];


    public function scopeOfLabelId($query, $label_id)
    {
        if ($label_id) {
            $query = $query->where('label_id', $label_id);
        }
        return $query;
    }


    //删除回调
    public static function boot()
    {
        parent::boot();
        static::deleted(function ($model) {
            $obj = json_decode($model, true);
            ProBrandServices::delClass($obj['id']);
        });
    }
}
