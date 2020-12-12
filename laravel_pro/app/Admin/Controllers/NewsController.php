<?php

namespace App\Admin\Controllers;

use App\Modules\NewsModel;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class NewsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'NewsModel';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new NewsModel());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('title', __('Title'));
        $grid->column('content', __('Content'));
        $grid->column('class_id', __('Class id'));
        $grid->column('status', __('Status'));
        $grid->column('order_by', __('Order by'));

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

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('title', __('Title'));
        $show->field('content', __('Content'));
        $show->field('class_id', __('Class id'));
        $show->field('status', __('Status'));
        $show->field('order_by', __('Order by'));

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

        $form->text('title', __('Title'));
        $form->textarea('content', __('Content'));
        $form->number('class_id', __('Class id'));
        $form->switch('status', __('Status'))->default(1);
        $form->number('order_by', __('Order by'))->default(10);

        return $form;
    }
}
