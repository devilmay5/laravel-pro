<?php

namespace App\Modules;


class Address extends BaseModel
{
    //
    protected $table = "address";
    protected $fillable = [
        'created_at',
        'updated_at',
        'customer_id',
        'province',
        'city',
        'area',
        'address',
        'consignee_name',
        'consignee_mobile',
        'is_default',
    ];

    const STATUS = [
        'NOT_DEFAULT' => 0,
        'IS_DEFAULT' => 1,
    ];

    public function scopeOfCustomerId($query, $customer_id)
    {
        if ($customer_id) {
            $query = $query->where('customer_id', $customer_id);
        }

        return $query;
    }

    public function scopeOfIsDefault($query, $is_default)
    {
        if ($is_default) {
            $query = $query->where('is_default', $is_default);
        }
        return $query;
    }
}
