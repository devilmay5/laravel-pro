<?php

namespace App\Modules;

use Illuminate\Database\Eloquent\Model;

class RetailOrderLine extends BaseModel
{
    protected $table = 'retail_order_line';
    protected $fillable = [
        'created_at',
        'updated_at',
        'retail_order_id',
        'retail_name',
        'customer_id',
        'pro_id',
        'brand_id',
        'pro_sku',
        'unit_price',
        'unit_count',
        'freight',
        'pay_type',
        'pay_status',
        'pay_serial_number',
        'pay_time',
        'delivery_time',
        'sign_time'
    ];

    public function retail_order()
    {
        return $this->belongsTo(RetailOrder::class, 'retail_order_id');
    }
}
