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
        $res = Advertisement::query()->ofName($name)->first();

        if ($res) {
            $res = $res->toArray();
        } else {
            $res = [];
        }
        return $res;
    }
}
