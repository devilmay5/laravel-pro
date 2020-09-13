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

    const BAOYOU = 1;

    public function getDefaultTemplateAttribute($default_template)
    {
        return json_decode($default_template, true) ?: [];
    }

    public function setDefaultTemplateAttribute($default_template)
    {
        $this->attributes['default_template'] = json_encode($default_template);
    }

    public function getOtherTemplateAttribute($other_template)
    {
        return array_values(json_decode($other_template, true) ?: []);
    }

    public function setOtherTemplateAttribute($other_template)
    {
        $this->attributes['other_template'] = json_encode(array_values($other_template));
    }

}
