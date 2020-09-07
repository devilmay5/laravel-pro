<?php

namespace App\Modules;


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
}
