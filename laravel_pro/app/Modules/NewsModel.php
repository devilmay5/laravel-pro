<?php

namespace App\Modules;


class NewsModel extends BaseModel
{
    //
    protected $table = 'news';
    protected $fillable = [
        'created_at',
        'updated_at',
        'title',
        'content',
        'class_id',
        'status',
        'order_by',
    ];
}
