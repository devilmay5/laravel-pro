<?php


namespace App\Services;


use App\Modules\ProBrand;
use App\Modules\ProInfo;
use App\Modules\ProLabel;

class ProBrandServices
{
    /**
     * @param int $label_id
     * @param int $page_index
     * @param int $page_size
     * @return array
     */
    public static function getBrandList(int $label_id = 0, int $page_index = 0, int $page_size = 0): array
    {
        $select = [
            'id as brand_id',
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

        if ($page_index && $page_size) {
            $query = $query->offset(($page_index - 1) * $page_size)->limit($page_size);
        }

        $pro_brand_group = $query->get();
        if ($pro_brand_group) {
            $pro_brand_group = $pro_brand_group->toArray();
        } else {
            $pro_brand_group = [];
        }
        return [$pro_brand_group, $count];
    }

    /**
     * @param int $brand_id
     * @return array
     */
    public static function getBrandInfo(int $brand_id): array
    {
        return ProBrand::find($brand_id)->toArray();
    }

    public static function getBrandProCount(int $brand_id): int
    {
        return ProInfo::query()
            ->ofStatus(ProInfo::STATUS_CODE['ENABLE'])
            ->ofBrandId($brand_id)
            ->count();
    }
}
