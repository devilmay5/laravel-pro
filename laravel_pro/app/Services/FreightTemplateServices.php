<?php


namespace App\Services;


use App\Modules\FreightTemplate;

class FreightTemplateServices
{
    /**
     * @return array
     */
    public static function getTemplateSelect(): array
    {
        $select = [
            'id',
            'template_name as text'
        ];
        $freight_template_group = FreightTemplate::query()->select($select)
            ->ofStatus(FreightTemplate::STATUS_CODE['ENABLE'])
            ->get();

        if ($freight_template_group->isNotEmpty()) {
            $freight_template_group = $freight_template_group->toArray();
        } else {
            $freight_template_group = [];
        }
        return $freight_template_group;
    }

    /**
     * @param int $tpl_id
     * @return mixed
     */
    public static function getTplInfo(int $tpl_id)
    {
        return FreightTemplate::find($tpl_id);
    }
}
