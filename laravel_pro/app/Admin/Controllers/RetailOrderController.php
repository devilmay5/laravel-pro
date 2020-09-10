<?php

namespace App\Admin\Controllers;

use App\Modules\RetailOrder;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class RetailOrderController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'RetailOrder';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new RetailOrder());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('retail_name', __('Retail name'));
        $grid->column('customer_id', __('Customer id'));
        $grid->column('address_id', __('Address id'));
        $grid->column('total_original_price', __('Total original price'));
        $grid->column('total_actual_price', __('Total actual price'));

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
        $show = new Show(RetailOrder::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('retail_name', __('Retail name'));
        $show->field('customer_id', __('Customer id'));
        $show->field('address_id', __('Address id'));
        $show->field('total_original_price', __('Total original price'));
        $show->field('total_actual_price', __('Total actual price'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new RetailOrder());

        $form->text('retail_name', __('Retail name'));
        $form->number('customer_id', __('Customer id'));
        $form->number('address_id', __('Address id'));
        $form->decimal('total_original_price', __('Total original price'));
        $form->decimal('total_actual_price', __('Total actual price'));

        return $form;
    }
}
