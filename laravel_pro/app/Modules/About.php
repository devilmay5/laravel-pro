<?php

namespace App\Modules;

class About extends BaseModel
{
    //
    protected $table = 'about';
    protected $fillable = [
        'created_at',
        'updated_at',
        'name',
        'description',
        'text'
    ];
}
