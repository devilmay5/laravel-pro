<?php


namespace App\Services;


use App\Modules\ProInfo;

class ProInfoServices
{
    /**
     * @param int $brand_id
     * @param int $class_id
     * @param int $page_size
     * @param int $page_index
     * @return array
     */
    public static function getProList(int $brand_id = 0, int $class_id = 0, int $page_size = 20, int $page_index = 1): array
    {
        $select = [
            'id as pro_id',
            'brand_id',
            'class_id',
            'pro_name',
            'original_price',
            'present_price',
            'cover_image_url',
            'sale_count',
            'status',
            'order_by'
        ];
        $query = ProInfo::query()->select($select)
            ->ofStatus(ProInfo::STATUS_CODE['ENABLE'])
            ->ofBrandId($brand_id)
            ->ofClassId($class_id)
            ->orderBy('order_by', 'desc');

        $count = $query->count();

        if ($page_index && $page_size) {
            $query = $query->offset(($page_index - 1) * $page_size)->limit($page_size);
        }

        $pro_info_group = $query->get();
        if ($pro_info_group->isNotEmpty()) {
            $pro_info_group = $pro_info_group->toArray();
        } else {
            $pro_info_group = [];
        }
        return [$pro_info_group, $count];

    }

    /**
     * @param int $pro_id
     * @return mixed
     */
    public static function getProInfo(int $pro_id)
    {
        return ProInfo::find($pro_id)->toArray();
    }

    /**
     * @param int $pro_id
     * @param int $page_index
     * @param int $page_size
     * @return array
     */
    public static function getRecommendList(int $pro_id, int $page_index = 1, int $page_size = 3): array
    {
        $proInfo = self::getProInfo($pro_id);
        $select = [
            'id as pro_id',
            'pro_name',
            'original_price',
            'present_price',
            'cover_image_url',
            'status',
            'order_by',
        ];

        $query = ProInfo::query()->select($select)
            ->ofStatus(ProInfo::STATUS_CODE['ENABLE'])
            ->ofClassId($proInfo['class_id'])
            ->orderBy('order_by', 'desc');

        $count = $query->count();

        if ($page_index && $page_size) {
            $query = $query->offset(($page_index - 1) * $page_size)->limit($page_size);
        }

        $recommend_group = $query->get();
        if ($recommend_group->isNotEmpty()) {
            $recommend_group = $recommend_group->toArray();
        } else {
            $recommend_group = [];
        }

        return [$recommend_group, $count];
    }

    public static function getSearchList(array $req): array
    {
        $select = [
            'id as pro_id',
            'pro_name',
            'present_price',
            'cover_image_url',
            'sale_count'
        ];

        $query = ProInfo::query()->select($select)
            ->ofProName($req['pro_name'] ?? '')
            ->ofIsRecommend($req['is_recommend'] ?? '')
            ->orderBy($req['order_item'], $req['order_type']);

        $count = $query->count();

        if ($req['page_index'] && $req['page_size']) {
            $query = $query->offset(($req['page_index'] - 1) * $req['page_size'])->limit($req['page_size']);
        }

        $pro_group = $query->get();
        if ($pro_group->isNotEmpty()) {
            $pro_group = $pro_group->toArray();
        } else {
            $pro_group = [];
        }

        return [$pro_group, $count];
    }
}
