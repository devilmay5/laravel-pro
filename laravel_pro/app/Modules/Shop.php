<?php

namespace App\Modules;

use Illuminate\Database\Eloquent\Model;

class Shop extends Model
{
    //
    protected $table = "shop";
    protected $fillable = [
        "id",
        "created_at",
        "updated_at",
        "name",
        "business_status",
        "business_timezone",
        "province",
        "city",
        "area",
        "address",
        "phone",
        "attention",
        "is_branch",
        "parent_branch",
        "extention",
    ];
    const BUSSINESS_STATUS_DISABLE = 0;
    const BUSSINESS_STATUS_ENABLE = 1;

    const NOT_BRANCH = 0;
    const IS_BRANCH = 1;

    protected $casts = [
        'extention' => 'json',
    ];

    public function getExtentionAttribute($value)
    {
        return array_values(json_decode($value, true) ?: []);
    }

    public function setExtentionAttribute($value)
    {
        $this->attributes['extention'] = json_encode(array_values($value));
    }

    public static function getParentBranch()
    {
        $select = [
            "id",
            "name as text",
        ];
        return self::query()->select($select)->where("is_branch", self::NOT_BRANCH)->get();
    }
}
