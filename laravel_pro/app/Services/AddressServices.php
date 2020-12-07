<?php


namespace App\Services;


use App\Modules\Address;
use Illuminate\Support\Facades\DB;

class AddressServices
{

    /**
     * @param int $customer_id
     * @param int $page_index
     * @param int $page_size
     * @return array
     */
    public static function getAddressListByCustomerId(int $customer_id, int $page_index, int $page_size): array
    {
        $select = [
            'id as address_id',
            'province',
            'city',
            'area',
            'address',
            'consignee_name',
            'consignee_mobile',
            'is_default',
        ];

        $query = Address::query()->select($select)
            ->ofCustomerId($customer_id);

        $query = $query->orderBy("id", "desc");
        $count = $query->count();

        if ($page_index && $page_size) {
            $query = $query->offset(($page_index - 1) * $page_size)->limit($page_size);
        }

        $res = $query->get();
        if ($res->isNotEmpty()) {

            $res = collect($res)->map(function ($item) {
                $obj_province = MapServices::getInfoByCode($item['province']);
                $item['province_name'] = $obj_province->name ?? "";

                $obj_city = MapServices::getInfoByCode($item['city']);
                $item['city_name'] = $obj_city->name ?? "";

                $obj_area = MapServices::getInfoByCode($item['area']);
                $item['area_name'] = $obj_area->name ?? "";
                return $item;
            })->toArray();

        } else {
            $res = [];
        }
        return [$res, $count];
    }

    /**
     * @param int $customer_id
     * @return mixed
     */
    public static function getDefaultAddress(int $customer_id)
    {
        $default_address = Address::query()
            ->ofCustomerId($customer_id)
            ->ofIsDefault(Address::STATUS['IS_DEFAULT'])
            ->first();

        if ($default_address) {
            $default_address = $default_address->toArray();
        } else {
            $default_address = [];
        }

        return $default_address;
    }

    /**
     * @param array $address
     * @return mixed
     */
    public static function addAddressInfo(array $address)
    {
        return Address::create($address)->toArray();
    }


    /**
     * @param int $customer_id
     * @return mixed
     */
    public static function setAllDefault(int $customer_id)
    {
        return Address::where('customer_id', $customer_id)->update(['is_default' => Address::STATUS['NOT_DEFAULT']]);
    }

    /**
     * @param int $address_id
     * @return mixed
     */
    public static function delAddress(int $address_id)
    {
        return Address::where('id', $address_id)->delete();
    }

    /**
     * @param array $address
     * @return mixed
     */
    public static function updateAddressInfo(array $address)
    {
        $address_id = $address['address_id'];
        unset($address['address_id']);

        return Address::where('id', $address_id)->update($address);
    }

    /**
     * @param int $address_id
     * @return mixed
     */
    public static function getAddressInfoById(int $address_id)
    {
        return Address::find($address_id);
    }
}
