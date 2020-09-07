<?php

namespace App\Modules;


class ProLabel extends BaseModel
{
    protected $table = "pro_label";
    protected $fillable = [
        'created_at',
        'updated_at',
        'label_name',
        'order_by',
        'status',
    ];


}
