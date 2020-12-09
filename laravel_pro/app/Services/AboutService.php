<?php


namespace App\Services;


use App\Modules\About;

class AboutService
{
    /**
     * @return array
     */
    public static function getAboutList(): array
    {
        return About::all()->toArray();
    }

    /**
     * @param int $id
     * @return array
     */
    public static function getAboutInfo(int $id): array
    {
        return About::find($id)->toArray();
    }
}
