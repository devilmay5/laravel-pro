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
        'status'
    ];

    const  STATUS_CODE = [
        'ENABLE' => 1,
        'DISABLE' => 0,
    ];
}
