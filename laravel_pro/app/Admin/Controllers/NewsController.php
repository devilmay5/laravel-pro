<?php

namespace App\Admin\Controllers;

use App\Modules\NewsModel;
use App\Services\NewClassServices;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class NewsController extends AdminController
{
    const REMOTE_URL_NEWS_CLASS = '/api/news/get-news-class-select';
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '帮助信息';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new NewsModel());

        $grid->column('id', 'ID')->sortable();
        $grid->column('created_at', '创建时间');

        $grid->column('title', '标题');

        $grid->column('class_id', '所属分类')->display(function ($class_id) {
            $class = NewClassServices::getInfo($class_id);
            return $class->class_name ?? '';
        });
        $states = [
            'on' => ['value' => NewsModel::STATUS_CODE['ENABLE'], 'text' => '启用', 'color' => 'primary'],
            'off' => ['value' => NewsModel::STATUS_CODE['DISABLE'], 'text' => '停用', 'color' => 'default'],
        ];
        $grid->column('status', '状态')->switch($states);
        $grid->column('order_by', '排序值')->editable()->sortable();

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(NewsModel::findOrFail($id));
        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new NewsModel());

        $form->text('title', '标题')->required();
        $form->select('class_id', '分类')->options(self::REMOTE_URL_NEWS_CLASS);
        $form->ckeditor('content', '详情')->required();


        $form->switch('status', '状态')->default(1);
        $form->number('order_by', '排序值')->default(10);

        $form->tools(function (Form\Tools $tools) {
            // 去掉`查看`按钮
            $tools->disableView();
        });
        $form->footer(function ($footer) {
            // 去掉`查看`checkbox
            $footer->disableViewCheck();
        });

        return $form;
    }
}
