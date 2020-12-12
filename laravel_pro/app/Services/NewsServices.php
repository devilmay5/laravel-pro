<?php


namespace App\Services;


use App\Modules\NewsClassModel;
use App\Modules\NewsModel;

class NewsServices
{
    /**
     * @return array
     */
    public static function getNewsList()
    {
        $select = [
            'news_class.class_name',
            'news.id as news_id',
            'news.title as news_title',
            'news.created_at as created_at',
        ];

        $newsList = NewsModel::query()->select($select)
            ->join('news_class', 'news_class.id', '=', 'news.class_id')
            ->ofStatus(NewsModel::STATUS_CODE['ENABLE'])
            ->groupBy('class_name')
            ->orderBy('created_at', 'desc')
            ->get();


        if (!$newsList) {
            $newsList = [];
        } else {
            $newsList = $newsList->toArray();
        }
        return $newsList;
    }

    /**
     * @param int $id
     * @return mixed
     */
    public static function getNewsInfo(int $id)
    {
        return NewsModel::find($id);
    }
}
