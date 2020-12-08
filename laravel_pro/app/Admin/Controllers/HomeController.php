<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Widgets\Box;
use Encore\Admin\Widgets\Echarts\Echarts;
use Encore\Admin\Widgets\InfoBox;
use Encore\Admin\Widgets\Collapse;

class HomeController extends Controller
{
    public function index(Content $content)
    {
//        return $content
//            ->title('Dashboard')
//            ->description('Description...')
//            ->row(Dashboard::title())
//            ->row(function (Row $row) {
//
//                $row->column(4, function (Column $column) {
//                    $column->append(Dashboard::environment());
//                });
//
//                $row->column(4, function (Column $column) {
//                    $column->append(Dashboard::extensions());
//                });
//
//                $row->column(4, function (Column $column) {
//                    $column->append(Dashboard::dependencies());
//                });
//            });


        return $content
            ->title('首页')
            ->description('首页')
            ->row(function (Row $row) {

                $data = ['columnsName' => json_encode(["Red", "Blue", "Yellow", "Green", "Purple", "Orange"]), 'countId' => 1];
                $row->column(8, function (Column $column) use ($data) {
                    $column->append(new Box('柱形图', view('admin.chartjs', ['data' => $data]))); // 调用刚刚是创建的视图
                });

                $row->column(4, function (Column $column) {
                    $column->append($this->infoBoxTest());
                    $column->append($this->infoBoxTest());
                });

                // 方法调用
                $row->column(4, function (Column $column) {
                    $column->append($this->collapseTest());
                });

// 方法调用
                $row->column(4, function (Column $column) {
                    $column->append($this->boxTest());
                });
            });


//        $json = '[{"count_date":"03-28","fans_num":5906,"article_num":363,"forward_num":27928,"comment_num":9123,"like_num":35632},{"count_date":"03-29","fans_num":9565,"article_num":361,"forward_num":16755,"comment_num":7193,"like_num":36540}]';
//        $jsonArr = json_decode($json, 1);
//        // bindData
//        $head = [
//            'count_date' => '日期',
//            'fans_num' => '粉丝',
//            'comment_num' => '评论',
//            'article_num' => '文章',
//            'forward_num' => '转发',
//            'like_num' => '点赞',
//        ];
//        $echarts = (new Echarts('柱状图', '数据来自新浪云大数据平台'))
//            ->setData($jsonArr)
//            ->bindLegend($head);
//
//        return $content
//            ->header('Echarts demo')
//            ->description('百度echarts图表展示')
//            ->body(new Box('折线图', $echarts));


    }

    // 组件方法
    public function infoBoxTest()
    {
        // 参数1为标题 参数2为图标 参数3为颜色 参数4为跳转链接 参数5为数据
        $infoBox = new InfoBox('New Users', 'users', 'aqua', '/admin/users', '1024');
        return $infoBox->render();
    }

    // 组件方法
    public function collapseTest()
    {
        $collapse = new Collapse();
        $collapse->add('标题', '这是一些信息');

        return $collapse->render();
    }

    // 组件方法
    public function boxTest()
    {
        $box = new Box();
        $box->removable();
        $box->collapsable();
        $box->style('info');
        $box->solid();
        $box->scrollable();
        $box->title('标题');
        $box->content('<h2>111111</h2>');
        return $box;
    }



}
