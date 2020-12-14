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
            'news_class.id as class_id',
        ];

        $classList = NewsClassModel::query()->select($select)
            ->orderBy('created_at', 'desc')
            ->get();

        if ($classList) {

            foreach ($classList as $key => $item) {
                $tmp_list = NewsModel::query()->where('class_id', $item->class_id)->get();
                $classList[$key]['news_list'] = $tmp_list ?? [];
            }
            $classList = $classList->toArray();
        }

        return $classList;
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
