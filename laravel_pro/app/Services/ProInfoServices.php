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
            'description',
            'cover_image_url',
            'detail_image_url',
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
        $proInfo = ProInfo::query()->where('id', $pro_id)->first();

        if (!$proInfo) {
            $proInfo = [];
        } else {
            $proInfo = $proInfo->toArray();
        }
        return $proInfo;
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
            'description'
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

    /**
     * @param array $req
     * @return array
     */
    public static function getSearchList(array $req): array
    {
        $select = [
            'pro_info.id as pro_id',
            'pro_name',
            'present_price',
            'cover_image_url',
            'sale_count',
            'pro_info.description',
            'detail_image_url',
            'pro_brand.brand_name'
        ];

        $query = ProInfo::query()->select($select)
            ->leftJoin('pro_brand', 'pro_info.brand_id', '=', 'pro_brand.id')
            ->ofProName($req['pro_name'] ?? '')
            ->ofIsRecommend($req['is_recommend'] ?? '')
            ->ofPresentPrice($req['low'] ?? 0, $req['high'] ?? 0)
            ->ofBrandId($req['brand_id'] ?? '')
            ->ofLabelId($req['label_id'] ?? '')
            ->where('pro_info.status', ProInfo::STATUS_CODE['ENABLE'])
            ->ofClassId($req['class_id'] ?? '');


//        $query = $query->orderBy($req['order_item'], $req['order_type']);
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

    /**
     * @return array
     */
    public static function getNewList()
    {
        $select = [
            'id as pro_id',
            'pro_name',
            'description',
            'present_price',
            'cover_image_url',
            'detail_image_url',
            'sale_count'
        ];
        // 新品上新
        $new_pro_group = ProInfo::select($select)
            ->ofStatus(ProInfo::STATUS_CODE['ENABLE'])
            ->orderBy('id', 'desc')
            ->offset(0)->limit(4)
            ->get();

        $return = [['name' => '新品上新', 'data' => $new_pro_group]];

        $label_group = ProLabelServices::getEnableList();
        foreach ($label_group as $item) {
            $label_pro = ProInfo::select($select)
                ->ofStatus(ProInfo::STATUS_CODE['ENABLE'])
                ->ofLabelId($item['id'])
                ->orderBy('id', 'desc')
                ->offset(0)->limit(4)
                ->get();
            $return = array_merge($return, [['name' => $item['label_name'], 'data' => $label_pro]]);
        }

        return $return;
    }
}
