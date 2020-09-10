<?php

namespace App\Modules;


class RetailOrder extends BaseModel
{
    protected $table = 'retail_order';
    protected $fillable = [
        'created_at',
        'updated_at',
        'retail_name',
        'customer_id',
        'address_id',
        'total_original_price',
        'total_actual_price'
    ];

    public function retail_order_line()
    {
        return $this->hasMany(RetailOrderLine::class, 'retail_order_id');
    }
}
