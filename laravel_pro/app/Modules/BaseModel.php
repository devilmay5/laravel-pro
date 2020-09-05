<?php

namespace App\Modules;

use Illuminate\Database\Eloquent\Model;

class BaseModel extends Model
{
    //

    public function scopeOfStatus($query, $status)
    {
        if ($status) {
            $query = $query->where('status', $status);
        }

        return $query;
    }
}
