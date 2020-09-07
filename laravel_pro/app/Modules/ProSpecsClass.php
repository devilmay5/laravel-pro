<?php

namespace App\Modules;


class ProSpecsClass extends BaseModel
{
    //
    protected $table = 'pro_specs_class';
    protected $fillable = [
        'created_at',
        'updated_at',
        'brand_id',
        'class_id',
        'specs_name',
        'order_by',
        'status',
    ];
}
