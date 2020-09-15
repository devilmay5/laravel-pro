<?php

namespace App\Modules;


use Encore\Admin\Traits\ModelTree;

class ProClass extends BaseModel
{
    use ModelTree;
    //
    protected $table = "pro_class";
    protected $fillable = [
        'created_at',
        'updated_at',
        'label_id',
        'brand_id',
        'class_name',
        'status',
        'order_by',
        'parent_id',
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

        $this->setParentColumn('parent_id');
        $this->setOrderColumn('order_by');
        $this->setTitleColumn('class_name');
    }

    public function scopeOfBrandId($query, $brand_id)
    {
        if ($brand_id) {
            $query = $query->where('brand_id', $brand_id);
        }
        return $query;
    }

    public function scopeOfParentId($query, $parent_id)
    {
        if ($parent_id !== false) {
            $query = $query->where('parent_id', $parent_id);
        }
        return $query;
    }
}
