<?php


namespace App\Http\Controllers;


class AddressController extends BaseController
{
    public function __construct()
    {
        parent::__construct();
    }

    public function PostGetAddressList()
    {
        try {
            $rules = [
                'customer_id' => 'required',
                'page_index' => 'required',
                'page_size' => 'required',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);


        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }
}
