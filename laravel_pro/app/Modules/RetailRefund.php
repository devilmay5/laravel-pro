<?php

namespace App\Modules;


class RetailRefund extends BaseModel
{
    //
    protected $table = 'retail_refund';
    protected $fillable = [
        'retail_order_line_id',
        'refuse_content',
        'refuse_image_url',
        'status',
        'created_at',
        'updated_at',
        'submit_time',
        'accept_time',
        'exam_time',
        'refund_time',
        'customer_id'
    ];

    const STATUS_CODE = [
        'SUBMIT' => 1,
        'ACCEPT' => 2,
        'EXAM' => 3,
        'REFUND' => 4,
    ];

    public function scopeOfCustomerId($query, $customer_id)
    {
        if ($customer_id) {
            $query = $query->where('retail_refund.customer_id', $customer_id);
        }
        return $query;
    }
}
