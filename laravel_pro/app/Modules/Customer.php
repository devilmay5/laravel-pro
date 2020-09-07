<?php

namespace App\Modules;

class Customer extends BaseModel
{
    //
    protected $table = 'customer';
    protected $fillable = [
        'created_at',
        'updated_at',
        'nickname',
        'mobile',
        'wechat_openid',
        'head_img_url',
        'status',
    ];
}
