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
    protected $title = 'NewsClassModel';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new NewsClassModel());

        $grid->column('id', __('Id'));
        $grid->column('class_name', __('Class name'));
        $grid->column('status', __('Status'));
        $grid->column('order_by', __('Order by'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));

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

        $show->field('id', __('Id'));
        $show->field('class_name', __('Class name'));
        $show->field('status', __('Status'));
        $show->field('order_by', __('Order by'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

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

        $form->text('class_name', __('Class name'));
        $form->switch('status', __('Status'))->default(1);
        $form->number('order_by', __('Order by'))->default(10);

        return $form;
    }
}
