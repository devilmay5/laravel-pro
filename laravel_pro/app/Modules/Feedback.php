<?php

namespace App\Modules;


class Feedback extends BaseModel
{
    //
    protected $table = 'feedback';
    protected $fillable = [
        'customer_id',
        'created_at',
        'updated_at',
        'content',
        'mobile'
    ];
}
