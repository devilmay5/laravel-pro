<?php

namespace App\Modules;


class Address extends BaseModel
{
    //
    protected $table = "address";
    protected $fillable = [
        'created_at',
        'updated_at',
        'customer_id',
        'province',
        'city',
        'area',
        'address',
        'consignee_name',
        'consignee_mobile',
        'is_default',
    ];

    const STATUS = [
        'NOT_DEFAULT' => 0,
        'IS_DEFAULT' => 1,
    ];



}
