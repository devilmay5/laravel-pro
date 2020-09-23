<?php


namespace App\Services;


use App\Modules\Advertisement;

class AdvertisementServices
{
    /**
     * @param string $name
     * @return array
     */
    public static function getInfo(string $name): array
    {
        return Advertisement::query()->ofName($name)->first()->toArray();
    }
}