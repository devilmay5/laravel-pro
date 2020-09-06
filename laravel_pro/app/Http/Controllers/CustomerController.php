<?php


namespace App\Http\Controllers;


use App\Services\CustomerServices;

class CustomerController extends BaseController
{
    public function __construct()
    {
        parent::__construct();
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

            return $this->RemoteApiResponse($customerInfo,self::SUCCESS_CODE,'查询成功');

        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }


}
