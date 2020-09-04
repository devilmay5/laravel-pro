<?php

namespace App\Http\Controllers;

use App\Modules\Shop;
use Illuminate\Http\Request;

class ShopController extends BaseController
{
    //
    public function __construct()
    {
        parent::__construct();
    }

    public function getParentBranch()
    {
        try {
            $shop_list = Shop::getParentBranch();
            return $this->RemoteApiResponse($shop_list->toArray());
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }
}
