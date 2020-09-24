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
        'sex'
    ];

    const SEX_MAN = 1;
    const SEX_WOMAN = 2;


    public function scopeOfMobile($query, $mobile)
    {
        if ($mobile) {
            $query = $query->where('mobile', $mobile);
        }
        return $query;
    }
}
