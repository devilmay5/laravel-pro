<?php


namespace App\Services;


use App\Modules\Cart;
use App\Modules\ProClass;
use App\Modules\ProInfo;
use Illuminate\Support\Facades\DB;

class ProClassServices
{
    /**
     * @param int $brand_id
     * @param int $page_index
     * @param int $page_size
     * @return array
     */
    public static function getClassList(int $brand_id = 0, int $page_index = 0, int $page_size = 0): array
    {
        $select = [
            'id as class_id',
            'class_name',
            'label_id',
            'brand_id',
            'order_by',
        ];

        $query = ProClass::query()->select($select)
            ->ofStatus(ProClass::STATUS_CODE['ENABLE'])
            ->ofBrandId($brand_id)
            ->orderBy('order_by', 'desc');

        $count = $query->count();

        if ($page_index && $page_size) {
            $query = $query->offset(($page_index - 1) * $page_size)->limit($page_size);
        }
        $brand_group = $query->get();

        if ($brand_group->isNotEmpty()) {
            $brand_group = $brand_group->toArray();
        } else {
            $brand_group = [];
        }
        return [$brand_group, $count];
    }

    /**
     * @param int $class_id
     * @return mixed
     */
    public static function getProClassInfo(int $class_id)
    {
        return ProClass::find($class_id);
    }

    /**
     * @param int $class_id
     * @param int $status
     */
    public static function setProInfoStatus(int $class_id, int $status)
    {
        ProInfo::ofClassId($class_id)->update(['status' => $status]);
    }

    /**
     * @param int $class_id
     */
    public static function delProInfo(int $class_id)
    {
        DB::transaction(function () use ($class_id) {
            $proIds = ProInfo::ofBrandId($class_id)->pluck('id');
            if($proIds){
                Cart::query()->whereIn('pro_id', $proIds)->delete();
                ProInfo::destroy($proIds);
            }
        });
    }
}
