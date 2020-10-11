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
        'pro_name',
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
        'sign_time',
        'logistics_number'
    ];

    const PAY_TYPE = [
        'NO_PAY' => 0,
        'ALIPAY' => 1,
        'WEIXIN' => 2,
        'OTHER' => 3,
    ];

    const PAY_STATUS = [
        'TO_BE_PAY' => 0,
        'TO_BE_DELIVERY' => 1,
        'TO_BE_SIGNED' => 2,
        'RETURN_EXCHANGE' => 3,
        'SIGNED' => 4,
        'CHANNEL' => 5,
    ];

    protected $casts = [
        'pro_sku' => 'json',
    ];

    public function retail_order()
    {
        return $this->belongsTo(RetailOrder::class, 'retail_order_id');
    }

    public function setProSkuAttribute($pro_sku)
    {
        $this->attributes['pro_sku'] = json_encode($pro_sku);
    }

    public function scopeOfId($query, $id)
    {
        if ($id) {
            $query = $query->where('id', $id);
        }
        return $query;
    }

    public function scopeOfCustomerId($query, $customer_id)
    {
        if ($customer_id) {
            $query = $query->where('customer_id', $customer_id);
        }
        return $query;
    }

    public function scopeOfPayStatus($query, $pay_status)
    {
        if ($pay_status !== false) {
            $query = $query->where('pay_status', $pay_status);
        }
        return $query;
    }

    public function scopeOfRetailName($query, $retail_name)
    {
        if ($retail_name) {
            $query = $query->where('retail_name', $retail_name);
        }
        return $query;
    }
}
