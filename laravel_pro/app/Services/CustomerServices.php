<?php


namespace App\Services;


use App\Modules\Customer;

class CustomerServices
{
    /**
     * @param $mobile
     * @return array
     */
    public static function getCustomerByMobile($req): array
    {
        $customer = Customer::ofMobile($req['mobile'])->first();

        if (!$customer) {
            $tmp_customer = [];
            $tmp_customer['nickname'] = '游客' . time();
            $tmp_customer['mobile'] = $req['mobile'];
            $tmp_customer['status'] = Customer::STATUS_CODE['ENABLE'];
            $tmp_customer['wechat_openid'] = $req['wechat_openid'] ?? '';
            $tmp_customer['head_img_url'] = $req['head_img_url'] ?? '';
            $tmp_customer['sex'] = Customer::SEX_MAN;
            $customer = Customer::create($tmp_customer);
        }
        return $customer->toArray();
    }

    /**
     * @param array $req
     * @return int
     */
    public static function updateCustomer(array $req)
    {
        $id = $req['customer_id'];
        unset($req['customer_id']);
        $data = $req;
        if (isset($req['head_img_url'])) {
            $path = $req['head_img_url']->store('images', 'admin');
            $data['head_img_url'] = $path;
        }
        return Customer::query()->where('id', $id)->update($data);
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
