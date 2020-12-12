<?php

namespace App\Modules;


class NewsClassModel extends BaseModel
{
    //
    protected $table = 'news_class';
    protected $fillable = [
        'created_at',
        'updated_at',
        'class_name',
        'status',
        'order_by'
    ];
}
