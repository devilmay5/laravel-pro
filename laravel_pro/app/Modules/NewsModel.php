<?php

namespace App\Modules;


class NewsModel extends BaseModel
{
    //
    protected $table = 'news';
    protected $fillable = [
        'created_at',
        'updated_at',
        'title',
        'content',
        'class_id',
        'status',
        'order_by',
    ];

    public function scopeOfStatus($query, $status)
    {
        if ($status) {
            $query = $query->where($this->table . '.status', $status);
        }

        return $query;
    }
}
