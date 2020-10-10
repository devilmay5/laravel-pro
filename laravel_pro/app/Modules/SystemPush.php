<?php


namespace App\Modules;


class SystemPush extends BaseModel
{
    protected $table = 'system_push';
    protected $fillable = [
        'created_at',
        'updated_at',
        'title',
        'content',
        'order_by',
        'status'
    ];

}