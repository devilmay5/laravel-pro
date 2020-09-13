<?php


namespace App\Services;


use App\Modules\Customer;

class CustomerServices
{
    /**
     * @param $mobile
     * @return array
     */
    public static function getCustomerByMobile($mobile): array
    {
        $customer = Customer::ofMobile($mobile)->first();

        if (!$customer) {
            $tmp_customer = [];
            $tmp_customer['nickname'] = '游客' . time();
            $tmp_customer['mobile'] = $mobile;
            $tmp_customer['status'] = Customer::STATUS_CODE['ENABLE'];
            $customer = Customer::create($tmp_customer);
        }
        return $customer->toArray();
    }

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
