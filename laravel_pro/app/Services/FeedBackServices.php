<?php


namespace App\Services;


use App\Modules\Feedback;

class FeedBackServices
{
    /**
     * @param array $req
     * @return mixed
     */
    public static function addFeedback(array $req)
    {
        return Feedback::create($req);
    }
}