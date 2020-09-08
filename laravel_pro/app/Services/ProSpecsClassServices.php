<?php


namespace App\Services;


use App\Modules\ProSpecsClass;

class ProSpecsClassServices
{
    public static function getProSpecsClassSelect(int $class_id = 0)
    {
        $select = [
            'id',
            'specs_name as text'
        ];

        $pro_class_specs_group = ProSpecsClass::query()->select($select)
            ->ofStatus(ProSpecsClass::STATUS_CODE['ENABLE'])
            ->ofClassId($class_id)
            ->get();

        if ($pro_class_specs_group) {
            $pro_class_specs_group = $pro_class_specs_group->toArray();
        } else {
            $pro_class_specs_group = [];
        }
        return $pro_class_specs_group;
    }
}
