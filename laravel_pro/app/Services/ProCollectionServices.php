<?php


namespace App\Services;


use App\Modules\ProBrand;
use App\Modules\ProBrandCollection;
use App\Modules\ProInfo;
use App\Modules\ProInfoCollection;
use Illuminate\Support\Facades\DB;

class ProCollectionServices
{

    /**
     * @param array $req
     * @return mixed
     */
    public static function addBrandCollection(array $req)
    {
        return ProBrandCollection::create($req);
    }

    /**
     * @param array $req
     * @return mixed
     */
    public static function addProCollection(array $req)
    {
        return ProInfoCollection::create($req);
    }

    /**
     * @param array $req
     * @return mixed
     */
    public static function delProCollection(array $req)
    {
        return ProInfoCollection::ofCustomerId($req['customer_id'])->ofProId($req['pro_id'])->delete();
    }

    /**
     * @param array $req
     * @return mixed
     */
    public static function delBrandCollection(array $req)
    {
        return ProBrandCollection::ofCustomerId($req['customer_id'])->ofBrandId($req['brand_id'])->delete();
    }

    /**
     * @param array $req
     * @return array
     */
    public static function getProCollection(array $req): array
    {
        $select = [
            'pro_info_collection.id as pro_collection_id',
            'customer_id',
            'pro_id',
            'pro_info.pro_name',
            'pro_info.cover_image_url',
            'pro_info.sale_count',
            'pro_info.present_price',
            'pro_info.description',
            'pro_info.detail_image_url',
        ];

        $query = ProInfoCollection::query()->select($select)
            ->join('pro_info', 'pro_info.id', '=', 'pro_info_collection.pro_id')
            ->ofCustomerId($req['customer_id'])
            ->ofProId($req['pro_id'] ?? "")
            ->where('pro_info.status', ProInfo::STATUS_CODE['ENABLE'])
            ->orderBy('pro_collection_id', 'desc');

        $count = $query->count();
        if ($req['page_index'] && $req['page_size']) {
            $query = $query->offset(($req['page_index'] - 1) * $req['page_size'])->limit($req['page_size']);
        }

        $res = $query->get();

        if ($res->isNotEmpty()) {
            $res = $res->toArray();
        } else {
            $res = [];
        }
        return [$res, $count];
    }


    /**
     * @param array $req
     * @return array
     */
    public static function getBrandCollection(array $req): array
    {
        $select = [
            'pro_brand_collection.id as brand_collection_id',
            'customer_id',
            'brand_id',
            'pro_brand.brand_image',
            DB::raw('count(*) as brand_count'),
        ];

        $query = ProBrandCollection::query()->select($select)
            ->join('pro_brand', 'pro_brand.id', '=', 'pro_brand_collection.brand_id')
            ->ofCustomerId($req['customer_id'])
            ->where('pro_brand.status', ProBrand::STATUS_CODE['ENABLE'])
            ->orderBy('pro_brand_collection.id', 'desc')
            ->groupBy('brand_id');


        $count = $query->count();

        if ($req['page_index'] && $req['page_size']) {
            $query = $query->offset(($req['page_index'] - 1) * $req['page_size'])->limit($req['page_size']);
        }

        $res = $query->get();

        if ($res->isNotEmpty()) {
            foreach ($res as $key => $item) {
                $res[$key]['pro_list'] = ProInfo::query()->select([
                    'id as pro_id',
                    'pro_name',
                    'cover_image_url',
                    'present_price'
                ])->ofBrandId($item['brand_id'])
                    ->ofStatus(ProInfo::STATUS_CODE['ENABLE'])
                    ->orderBy('id', 'desc')
                    ->limit(3)
                    ->get();
            }
            $res = $res->toArray();
        } else {
            $res = [];
        }
        return [$res, $count];
    }

    /**
     * @param array $req
     * @return mixed
     */
    public static function checkProCollection(array $req)
    {
        return ProInfoCollection::query()
            ->ofCustomerId($req['customer_id'])
            ->ofProId($req['pro_id'])
            ->count();
    }

    /**
     * @param array $req
     * @return mixed
     */
    public static function checkBrandCollection(array $req)
    {
        return ProBrandCollection::query()
            ->ofCustomerId($req['customer_id'])
            ->ofBrandId($req['brand_id'])
            ->count();
    }
}
