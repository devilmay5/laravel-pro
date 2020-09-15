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
        'second_class_id',
        'third_class_id',
        'pro_name',
        'original_price',
        'present_price',
        'cover_image_url',
        'detail_image_url',
        'description',
        'detail_params',
        'sku_params',
        'total_count',
        'sale_count',
        'status',
        'order_by',
        'is_recommend',
        'freight_template_id',
    ];

    protected $casts = [
        'detail_params' => 'json',
    ];

    const IS_RECOMMEND = [
        'ENABLE' => 1,
        'DISABLE' => 0
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


    public function scopeOfBrandId($query, $brand_id)
    {
        if ($brand_id) {
            $query = $query->where('brand_id', $brand_id);
        }
        return $query;
    }

    public function scopeOfClassId($query, $class_id)
    {
        if ($class_id) {
            $query = $query->where('class_id', $class_id);
        }
        return $query;
    }

    public function scopeOfSecondClassId($query, $second_class_id)
    {
        if ($second_class_id) {
            $query = $query->where('second_class_id', $second_class_id);
        }
        return $query;
    }

    public function scopeOfThirdClassId($query, $third_class_id)
    {
        if ($third_class_id) {
            $query = $query->where('third_class_id', $third_class_id);
        }
        return $query;
    }

    public function scopeOfIsRecommend($query, $is_recommend)
    {
        if ($is_recommend) {
            $query = $query->where('is_recommend', $is_recommend);
        }
        return $query;
    }
}
