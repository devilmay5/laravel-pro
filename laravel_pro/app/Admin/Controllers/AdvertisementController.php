<?php

namespace App\Admin\Controllers;

use App\Modules\Advertisement;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class AdvertisementController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '广告位管理';

    const OPTIONS = [
            'banner'=>'banner广告图',
            'Indexadvert'=>'首页宣传图',
            'NewPro'=>'新品上新-app',
            'NewProsWeb'=>'新品上新-web',
        ];
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Advertisement());

        $grid->column('id', 'Id');
        $grid->column('name', '广告位标识')->display(function ($name){
            return self::OPTIONS[$name];
        });
        $grid->column('description', '描述');
        $grid->column('image_url', __('Image url'))->image();
        $grid->column('image_list', __('Image list'))->display(function ($image_list) {
            return is_array($image_list) ? $image_list : json_decode($image_list, true);
        })->image();
        $grid->column('is_muti', '是否多图')->display(function ($is_muti) {
            return $is_muti == Advertisement::IS_MUTI ? '是' : '否';
        });
        $grid->disableExport();
        $grid->disableFilter();
        $grid->actions(function ($actions) {
            // 去掉查看
            $actions->disableView();
            $actions->disableDelete();
        });
        // 去掉批量操作
        $grid->disableBatchActions();
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
        $show = new Show(Advertisement::findOrFail($id));
        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Advertisement());


        $form->select('name','广告位标识')->options(self::OPTIONS)->required();

        $form->text('description', '描述')->required();
        $form->radio('is_muti', '是否多图')->options([
            Advertisement::IS_MUTI => '是',
            Advertisement::NOT_MUTI => '否',
        ])->when(Advertisement::IS_MUTI, function (Form $form) {
            $form->multipleImage('image_list', '广告图')->removable()->uniqueName();
        })->when(Advertisement::NOT_MUTI, function (Form $form) {
            $form->image('image_url', '广告图')->removable()->uniqueName();
        });

        $form->list('url_list','广告链接（按图片顺序设置）');

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
