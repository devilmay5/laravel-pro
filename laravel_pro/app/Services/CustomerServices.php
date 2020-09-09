<?php


namespace App\Services;


use App\Modules\Customer;

class CustomerServices
{
    /**
     * 获取select列表
     * @return array
     */
    public static function getSelectList(): array
    {
        $select = [
            'id',
            'nickname as text',
        ];

        $customer_group = Customer::query()->select($select)->ofStatus(Customer::STATUS_CODE['ENABLE'])->get();

        if ($customer_group->isNotEmpty()) {
            $customer_group = $customer_group->toArray();
        } else {
            $customer_group = [];
        }

        return $customer_group;
    }


    /**
     * @param int $customer_id
     * @return mixed
     */
    public static function getCustomerById(int $customer_id)
    {
        return Customer::find($customer_id);
    }


    /**
     * @param string $nickname
     * @return mixed
     */
    public static function getListFromNickname(string $nickname)
    {
        return Customer::query()->where('nickname', 'like', "%$nickname%")->get();
    }
}
