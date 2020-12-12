<?php


namespace App\Services;


use App\Modules\NewsClassModel;

class NewClassServices
{
    /**
     * @param int $class_id
     * @return mixed
     */
    public static function getInfo(int $class_id)
    {
        return NewsClassModel::find($class_id);
    }

    /**
     * @return mixed
     */
    public static function getEnableList()
    {
        $select = [
            'id as id',
            'class_name as text'
        ];
        return NewsClassModel::query()->select($select)
            ->orderBy('order_by', 'desc')
            ->get();
    }
}
