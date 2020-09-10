<?php

namespace App\Admin\Controllers;

use App\Modules\FreightTemplate;
use App\Modules\ProInfo;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class FreightTemplateController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '运费模板';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new FreightTemplate());

        $grid->column('id', 'Id');
        $grid->column('created_at', '创建时间');
        $grid->column('template_name', '模板名称');
        $grid->column('delivery_time', '发货时间')->display(function ($delivery_time) {
            return $delivery_time . '天内发货';
        });
        $states = [
            'on' => ['value' => FreightTemplate::STATUS_CODE['ENABLE'], 'text' => '上架', 'color' => 'primary'],
            'off' => ['value' => FreightTemplate::STATUS_CODE['DISABLE'], 'text' => '下架', 'color' => 'default'],
        ];
        $grid->column('status', '状态')->switch($states);
        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->like('template_name', '模板名称');
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
        $show = new Show(FreightTemplate::findOrFail($id));
        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new FreightTemplate());

        $form->text('template_name', '模板名称');
        $form->select('pro_country', '所属国家')->options('/api/map/get-country');
        $form->distpicker([
            'pro_province' => '省',
            'pro_city' => '市',
            'pro_area' => '区'
        ], '宝贝地址');
        $form->select('delivery_time', '发货时间')->options([1 => '1天内发货', 3 => '3天内发货', 7 => '7天内发货'])->help('多少天内发货');

        $form->radio('is_free_shipping', '是否包邮')->options([0 => '否', 1 => '是'])->default(1)
            ->when(0, function (Form $form) {
                $form->embeds('default_template', '默认运费公式', function ($form) {
                    $form->text('default_piece', '默认物品件数（件）');
                    $form->text('default_price', '默认运费金额（元）');
                    $form->text('incr_piece', '每增加物品件数（件）');
                    $form->text('incr_price', '增加运费（元）');
                });

                $form->table('other_template', '定制运费公式', function ($table) {
                    $table->select('country', '国家')->options('/api/map/get-country')->load('province', '/api/map/get-province');
                    $table->select('text', '省份')->options('/api/map/get-province');
                    $table->text('default_piece', '物品件数（件）');
                    $table->text('default_price', '运费金额（元）');
                    $table->text('incr_piece', '每增加物品件数（件）');
                    $table->text('incr_price', '增加运费（元）');
                });
            });

        $form->switch('status', '是否有效')->default(1);

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
