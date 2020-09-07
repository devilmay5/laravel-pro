<?php

namespace App\Admin\Controllers;

use App\Modules\Address;
use App\Services\CustomerServices;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class AddressController extends AdminController
{
    const REMOTE_URL_CUSTOMER = '/api/customer/get-customer-select';
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '地址管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Address());

        $grid->column('id', 'ID')->sortable();
        $grid->column('created_at', '创建时间');
        $grid->column('customer_id', '客户名称')->display(function ($customer_id) {
            $customer = CustomerServices::getCustomerById($customer_id);
            return $customer->nickname;
        })->required();
        $grid->column('consignee_name', '收货人姓名')->required();
        $grid->column('consignee_mobile', '收货人手机号')->required();
        $grid->column('is_default', '默认地址')->display(function ($is_default) {
            return $is_default == Address::STATUS['IS_DEFAULT'] ? '是' : '否';
        })->required();

        $grid->filter(function ($filter) {
            $filter->disableIdFilter();

            $filter->like('consignee_name', '收货人姓名');
            $filter->like('consignee_mobile', '收货人手机号');

            $filter->where(function ($query) {
                $customer_list = CustomerServices::getListFromNickname($this->input);
                if ($customer_list) {
                    $customer_group = $customer_list->toArray();
                    $customer_ids = array_column($customer_group, 'id');
                    $query->whereIn('customer_id', $customer_ids);
                }

            }, "客户名称");
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
        $show = new Show(Address::findOrFail($id));


        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Address());

        $form->display('id', 'ID');
        $form->time('created_at', '创建时间');
        $form->select('customer_id', '选择客户')->options(self::REMOTE_URL_CUSTOMER)->required();

        $form->distpicker([
            'province' => '省',
            'city' => '市',
            'area' => '区'
        ])->required();

        $form->text('address', '具体地址')->required();
        $form->text('consignee_name', '收货人姓名')->required();
        $form->mobile('consignee_mobile', '收货人手机号')->required();

        $is_default_group = [
            Address::STATUS['NOT_DEFAULT'] => '否',
            Address::STATUS['IS_DEFAULT'] => '是'
        ];

        $form->select('is_default', '默认地址')
            ->options($is_default_group)
            ->creationRules(['unique:address,customer_id,is_default'])
            ->updateRules(['unique:address,customer_id,is_default']);

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
