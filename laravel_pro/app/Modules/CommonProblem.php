<?php

namespace App\Modules;


class CommonProblem extends BaseModel
{
    //
    protected $table = 'common_problem';
    protected $fillable = [
        'created_at',
        'updated_at',
        'title',
        'content',
        'order_by',
        'status'
    ];
}
