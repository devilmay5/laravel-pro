<?php


namespace App\Modules;


class ProBrandCollection extends BaseModel
{
    protected $table = 'pro_brand_collection';
    protected $fillable = [
        'created_at',
        'updated_at',
        'customer_id',
        'brand_id'
    ];

    public function scopeOfCustomerId($query, $customer_id)
    {
        if ($customer_id) {
            $query = $query->where('customer_id', $customer_id);
        }
        return $query;
    }

    public function scopeOfBrandId($query, $brand_id)
    {
        if ($brand_id) {
            $query = $query->where('brand_id', $brand_id);
        }
        return $query;
    }
}
