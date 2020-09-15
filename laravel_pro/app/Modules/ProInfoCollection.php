<?php


namespace App\Modules;


class ProInfoCollection extends BaseModel
{
    protected $table = 'pro_info_collection';
    protected $fillable = [
        'created_at',
        'updated_at',
        'customer_id',
        'pro_id'
    ];

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
