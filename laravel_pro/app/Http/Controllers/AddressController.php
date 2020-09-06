<?php


namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\Modules\Address;
use App\Services\AddressServices;

class AddressController extends BaseController
{
    public function __construct()
    {
        parent::__construct();
    }

    public function GetAddressList()
    {
        try {
            $rules = [
                'customer_id' => 'required',
                'page_index' => 'required',
                'page_size' => 'required',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            [$address_list, $count] = AddressServices::getAddressListByCustomerId($req['customer_id'], $req['page_index'], $req['page_size']);

            return $this->RemoteApiResponse($address_list, self::SUCCESS_CODE, '查询成功', $count);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function CreateAddressInfo()
    {
        try {
            $rules = [
                'customer_id' => 'required',
                'province' => 'required',
                'city' => 'required',
                'area' => 'required',
                'address' => 'required',
                'consignee_name' => 'required',
                'consignee_mobile' => 'required',
                'is_default' => 'required|in:0,1',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            $address = DB::transaction(function () use ($req) {
                if ($req['is_default'] == Address::STATUS['IS_DEFAULT']) {
                    AddressServices::setAllDefault($req['customer_id']);
                }

                return AddressServices::addAddressInfo($req);
            });
            return $this->RemoteApiResponse($address, self::SUCCESS_CODE, '新增地址成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function DelAddressInfo()
    {
        try {
            $rules = [
                'address_id' => 'required',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            AddressServices::delAddress($req['address_id']);
            return $this->RemoteApiResponse([], self::SUCCESS_CODE, '删除地址成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function UpdateAddresInfo()
    {
        try {
            $rules = [
                'address_id' => 'required',
                'customer_id' => 'required',
                'province' => 'required',
                'city' => 'required',
                'area' => 'required',
                'address' => 'required',
                'consignee_name' => 'required',
                'consignee_mobile' => 'required',
                'is_default' => 'required|in:0,1',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            DB::transaction(function () use ($req) {
                if ($req['is_default'] == Address::STATUS['IS_DEFAULT']) {
                    AddressServices::setAllDefault($req['customer_id']);
                }

                AddressServices::updateAddressInfo($req);
            });
            return $this->RemoteApiResponse([], self::SUCCESS_CODE, '修改地址成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }
}
