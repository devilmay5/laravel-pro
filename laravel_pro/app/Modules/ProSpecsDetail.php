<?php

namespace App\Modules;


class ProSpecsDetail extends BaseModel
{
    //
    protected $table = 'pro_specs_detail';
    protected $fillable = [
        'created_at',
        'updated_at',
        'brand_id',
        'class_id',
        'specs_class_id',
        'detail_name',
        'order_by',
        'status',
    ];
}
