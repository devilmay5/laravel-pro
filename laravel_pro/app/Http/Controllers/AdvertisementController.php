<?php


namespace App\Http\Controllers;


use App\Modules\Advertisement;
use App\Services\AdvertisementServices;

class AdvertisementController extends BaseController
{
    public function __construct()
    {
        parent::__construct();
    }

    public function GetBannerList()
    {
        try {
            $banner = AdvertisementServices::getInfo(Advertisement::banner_name);
            return $this->RemoteApiResponse($banner);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function GetAdvert()
    {
        try {
            $advert = AdvertisementServices::getInfo(Advertisement::index_advert);
            return $this->RemoteApiResponse($advert);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function GetNewPro()
    {
        try {
            $advert = AdvertisementServices::getInfo(Advertisement::new_pro);
            return $this->RemoteApiResponse($advert);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }
}