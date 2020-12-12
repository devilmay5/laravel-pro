<?php

namespace App\Admin\Controllers;

use App\Modules\NewsClassModel;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class NewsClassController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '帮助信息分类';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new NewsClassModel());

        $grid->column('id','ID')->sortable();
        $grid->column('created_at', '创建时间');
        $grid->column('class_name', '分类名称');
        $grid->column('order_by', '排序值')->editable()->sortable();

        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->like('class_name', '分类名称');
        });

        $grid->disableExport();
        $grid->actions(function ($actions) {
            // 去掉查看
            $actions->disableView();
        });

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
        $show = new Show(NewsClassModel::findOrFail($id));
        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new NewsClassModel());

        $form->text('class_name', '分类名称')->required();

        $form->number('order_by', '排序值')->default(10)->required();

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
