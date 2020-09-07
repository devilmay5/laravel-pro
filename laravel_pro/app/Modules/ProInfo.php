<?php

namespace App\Modules;


class ProInfo extends BaseModel
{
    //
    protected $table = "pro_info";
    protected $fillable = [
        'created_at',
        'updated_at',
        'label_id',
        'brand_id',
        'class_id',
        'pro_name',
        'original_price',
        'present_price',
        'cover_image_url',
        'detail_image_url',
        'description',
        'detail_params',
        'total_count',
        'sale_count',
        'status',
        'order_by'
    ];

    protected $casts = [
        'detail_params' => 'json',
    ];


    public function setDetailImageUrlAttribute($detail_image_url)
    {
        if (is_array($detail_image_url)) {
            $this->attributes['detail_image_url'] = json_encode($detail_image_url);
        }
    }

    public function getDetailImageUrlAttribute($detail_image_url)
    {
        return json_decode($detail_image_url, true);

    }
}
