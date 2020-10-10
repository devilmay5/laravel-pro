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

    public function getAskImgAttribute($ask_img)
    {
        $ask_img = $ask_img ? 'upload/' . $ask_img : "";
        return $ask_img;
    }

    public function scopeOfCustomerId($query, $customer_id)
    {
        if ($customer_id) {
            $query = $query->where('customer_id', $customer_id);
        }
        return $query;
    }

    public function scopeOfAskId($query, $ask_id)
    {
        if ($ask_id) {
            $query = $query->where('ask_id', $ask_id);
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
