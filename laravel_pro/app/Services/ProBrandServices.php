<?php


namespace App\Services;


use App\Modules\ProBrand;
use App\Modules\ProLabel;

class ProBrandServices
{
    /**
     * @param int $label_id
     * @return array
     */
    public static function getBrandList(int $label_id = 0): array
    {
        $select = [
            'id',
            'brand_name',
            'brand_image',
            'order_by',
            'label_id'
        ];
        $query = ProBrand::query()->select($select)
            ->ofStatus(ProBrand::STATUS_CODE['ENABLE'])
            ->ofLabelId($label_id)
            ->orderBy('order_by', 'desc');

        $count = $query->count();
        $pro_brand_group = $query->get();
        if ($pro_brand_group) {
            $pro_brand_group = $pro_brand_group->toArray();
        } else {
            $pro_brand_group = [];
        }
        return [$pro_brand_group, $count];
    }

    public static function getBrandInfo(int $brand_id): array
    {
        return ProBrand::find($brand_id)->toArray();
    }
}