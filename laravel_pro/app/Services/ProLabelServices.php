<?php


namespace App\Services;


use App\Modules\ProLabel;

class ProLabelServices
{
    /**
     * @return array|\Illuminate\Database\Eloquent\Builder[]|\Illuminate\Database\Eloquent\Collection
     */
    public static function getProLabelSelect()
    {
        $select = [
            'id',
            'label_name as text'
        ];
        $label_group = ProLabel::query()->select($select)->where('status', ProLabel::STATUS_CODE['ENABLE'])->get();

        if ($label_group) {
            $label_group = $label_group->toArray();
        } else {
            $label_group = [];
        }
        return $label_group;
    }

    /**
     * @param int $label_id
     * @return mixed
     */
    public static function getInfoById(int $label_id)
    {
        return ProLabel::find($label_id);
    }
}