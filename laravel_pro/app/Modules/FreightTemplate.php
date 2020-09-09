<?php

namespace App\Modules;


class FreightTemplate extends BaseModel
{
    //
    protected $table = 'freight_template';
    protected $casts = [
        'default_template' => 'json',
        'other_template' => 'json',
    ];

    protected $fillable = [
        'template_name',
        'pro_country',
        'pro_province',
        'pro_city',
        'pro_area',
        'delivery_time',
        'is_free_shipping',
        'default_template',
        'other_template',
        'status',
        'created_at',
        'updated_at',
    ];

    public function getDefaultTemplateAttribute($value)
    {
        return array_values(json_decode($value, true) ?: []);
    }

    public function setDefaultTemplateAttribute($value)
    {
        $this->attributes['default_template'] = json_encode(array_values($value));
    }
    public function getOtherTemplateAttribute($value)
    {
        return array_values(json_decode($value, true) ?: []);
    }

    public function setOtherTemplateAttribute($value)
    {
        $this->attributes['other_template'] = json_encode(array_values($value));
    }

}
