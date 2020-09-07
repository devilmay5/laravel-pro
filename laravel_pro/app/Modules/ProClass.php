<?php

namespace App\Modules;


class ProClass extends BaseModel
{
    //
    protected $table = "pro_class";
    protected $fillable = [
        'created_at',
        'updated_at',
        'label_id',
        'brand_id',
        'class_name',
        'status',
        'order_by'
    ];

    public function scopeOfBrandId($query, $brand_id)
    {
        if ($brand_id) {
            $query = $query->where('brand_id', $brand_id);
        }
        return $query;
    }
}
