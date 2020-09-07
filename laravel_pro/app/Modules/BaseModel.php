<?php

namespace App\Modules;

use Illuminate\Database\Eloquent\Model;

class BaseModel extends Model
{
    //
    const  STATUS_CODE = [
        'ENABLE' => 1,
        'DISABLE' => 0,
    ];

    public function scopeOfStatus($query, $status)
    {
        if ($status) {
            $query = $query->where('status', $status);
        }

        return $query;
    }
}
