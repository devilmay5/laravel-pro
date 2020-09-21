<?php


namespace App\Modules;


class CustomerAsk extends BaseModel
{
    protected $table = 'customer_ask';
    protected $fillable = [
        'created_at',
        'updated_at',
        'retail_order_line_id',
        'customer_id',
        'ask_id',
        'ask_content',
        'ask_img',
        'reply_content',
    ];
}