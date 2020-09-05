<?php


namespace App\Services;


use App\Modules\Address;

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
            'id',
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

        return [$res, $count];
    }

}
