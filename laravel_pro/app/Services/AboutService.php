<?php


namespace App\Services;


use App\Modules\About;

class AboutService
{
    /**
     * @return array
     */
    public static function getAboutList()
    {
        return About::all()->toArray();
    }
}