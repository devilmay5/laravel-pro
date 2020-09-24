<?php


namespace App\Http\Controllers;

use App\Services\CustomerServices;
use Illuminate\Support\Facades\Session;

class CustomerController extends BaseController
{
    public function __construct()
    {
        parent::__construct();
    }

    public function Login()
    {
        try {
            $rules = [
                'mobile' => 'required',
                'wechat_openid' => '',
                'head_img_url' => ''
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            $customer = CustomerServices::getCustomerByMobile($req);
            Session::put('customer_' . $customer['id'], $customer);

            return $this->RemoteApiResponse($customer, self::SUCCESS_CODE, '登录成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function GetCustomerSelect()
    {
        try {
            $customer_group = CustomerServices::getSelectList();
            return response()->json($customer_group);

        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function GetCustomerInfo()
    {
        try {
            $rules = [
                'customer_id' => 'required',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            $customerInfo = CustomerServices::getCustomerById($req['customer_id']);

            if ($customerInfo) {
                $customerInfo = $customerInfo->toArray();
            } else {
                $customerInfo = [];
            }

            return $this->RemoteApiResponse($customerInfo, self::SUCCESS_CODE, '查询成功');

        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function UpdateCustomerInfo()
    {
        try {
            $rules = [
                'customer_id' => 'required|exists:customer,id',
                'nickname' => 'string',
                'sex' => 'string',
                'head_img_url' => ''
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            if ($this->request->hasFile('head_img_url')) {
                $req['head_img_url'] = $this->request->file('head_img_url');
            }
             CustomerServices::updateCustomer($req);
            return $this->RemoteApiResponse([], self::SUCCESS_CODE, '更新成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

}
