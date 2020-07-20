<?php

namespace App\Admin\Controllers;

use App\Modules\Shop;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ShopController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Shop';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Shop());

        $grid->column('id', 'ID')->sortable();
        $grid->column('name', '店铺名称');
        $grid->column('business_status', '营业状态')->display(function ($business_status) {
            return $business_status == Shop::BUSSINESS_STATUS_ENABLE ? "开业" : "停业";
        });
        $grid->column('phone', '联系电话');
        $grid->column('created_at', '创建时间');

        $grid->filter(function ($filter) {
            // 设置created_at字段的范围查询
            $filter->between('created_at', '创建时间')->datetime();
            // 在这里添加字段过滤器
            $filter->like('name', '店铺名称');

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
        $show = new Show(Shop::findOrFail($id));


        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Shop());
        // 显示记录id
        $form->display('id', 'ID');
        // 两个时间显示
        $form->display('created_at', '创建时间');
        $form->display('updated_at', '修改时间');
        $form->text('name', '店铺名称')->required();

        $business_status = [
            Shop::BUSSINESS_STATUS_DISABLE => "停业",
            Shop::BUSSINESS_STATUS_ENABLE => "开业",
        ];

        $form->select('business_status', '营业状态')->options($business_status)->required();
        $form->text('business_timezone', '营业时间段')->required();

        $form->distpicker([
            'province' => '省',
            'city' => '市',
            'area' => '区'
        ])->required();

        $form->text('address', '具体地址')->required();
        $form->text('phone', '联系电话')->required();

        $branch = [
            Shop::NOT_BRANCH => "否",
            Shop::IS_BRANCH => "是",
        ];
        $form->select('is_branch', '是否为分店')->options($branch)->when(Shop::IS_BRANCH, function (Form $form) {
            $form->select("parent_branch","选择总店")->options('/api/shop/get-parent');
        })->required();

        $form->table('extention', function ($table) {
            $table->text('key');
            $table->text('value');
        });


        return $form;
    }
}
