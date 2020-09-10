<?php

namespace App\Modules;


class Cart extends BaseModel
{
    protected $table = 'cart';
    protected $fillable = [
        'created_at',
        'updated_at',
        'customer_id',
        'pro_id',
        'pro_sku_param',
        'pro_count',
        'pro_unit_price',
        'pro_total_price',
    ];


    public function getProSkuParamAttribute($pro_sku_param)
    {
        return json_decode($pro_sku_param, true);
    }

    public function scopeOfCustomerId($query, $customer_id)
    {
        if ($customer_id) {
            $query = $query->where('customer_id', $customer_id);
        }
        return $query;
    }

    public function scopeOfProId($query, $pro_id)
    {
        if ($pro_id) {
            $query = $query->where('pro_id', $pro_id);
        }
        return $query;
    }
}
