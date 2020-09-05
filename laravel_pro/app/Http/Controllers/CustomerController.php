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
}
