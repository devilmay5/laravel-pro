<?php

namespace App\Modules;


class Advertisement extends BaseModel
{
    protected $table = 'advertisement';
    protected $fillable = [
        'created_at',
        'updated_at',
        'description',
        'name',
        'image_url',
        'image_list',
        'is_muti'
    ];
    const IS_MUTI = 1;
    const NOT_MUTI = 2;

    const banner_name = 'banner';
    const index_advert = 'Indexadvert';
    const new_pro = 'NewPro';

    public $casts = [
        'image_list' => 'array',
    ];

    public function setImageListAttribute($image_list)
    {
        if (is_array($image_list)) {
            $this->attributes['image_list'] = json_encode($image_list);
        }
    }

    public function getImageListsAttribute($image_list)
    {
        return json_decode($image_list, true);
    }

    public function scopeOfName($query, $name)
    {
        if ($name) {
            $query = $query->where('name', $name);
        }
        return $query;
    }
}
