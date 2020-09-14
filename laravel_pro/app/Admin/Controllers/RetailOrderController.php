<?php

namespace App\Admin\Controllers;

use App\Modules\Address;
use App\Modules\ProBrand;
use App\Modules\RetailOrder;
use App\Modules\RetailOrderLine;
use App\Services\AddressServices;
use App\Services\CustomerServices;
use App\Services\MapServices;
use App\Services\ProBrandServices;
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
    protected $title = '订单管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new RetailOrder());

        $grid->column('id', __('Id'));
        $grid->column('created_at', '下单时间');
        $grid->column('retail_name', '订单号');
        $grid->column('customer_id', '客户名称')->display(function ($customer_id) {
            $customer = CustomerServices::getCustomerById($customer_id);
            return $customer['nickname'];
        });
        $grid->column('total_actual_price', '实际成交价格');


        $grid->filter(function ($filter) {
            $filter->disableIdFilter();

            $filter->like('retail_name', '订单号');

            $filter->where(function ($query) {
                $customer_list = CustomerServices::getListFromNickname($this->input);
                if ($customer_list) {
                    $customer_group = $customer_list->toArray();
                    $customer_ids = array_column($customer_group, 'id');
                    $query->whereIn('customer_id', $customer_ids);
                }

            }, "客户名称");

            $filter->between('total_actual_price', '成交价格');
        });

        $grid->disableExport();
        $grid->disableCreateButton();
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
        $show = new Show(RetailOrder::findOrFail($id));
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

        $form->display('retail_name', '订单编号');
        $form->display('customer_id', '客户名称')->with(function ($customer_id) {
            $customer = CustomerServices::getCustomerById($customer_id);
            return $customer['nickname'];
        });
        $form->display('address_id', '客户地址')->with(function ($address_id) {
            $address = AddressServices::getAddressInfoById($address_id);
            $province = MapServices::getInfoByCode($address['province']);
            $city = MapServices::getInfoByCode($address['city']);
            $area = MapServices::getInfoByCode($address['area']);
            return $province->name . ' ' . $city->name . ' ' . $area->name . ' ' . $address['address'];
        });
        $form->currency('total_actual_price', '订单总金额')->symbol('￥')->readonly();

        $form->hasMany('retail_order_line', '订单明细', function (Form\NestedForm $form) {

            $form->display('brand_id', '品牌名称')->with(function ($brand_id) {
                $brand = ProBrand::find($brand_id);
                return $brand['brand_name'];
            });
            $form->display('pro_name', '产品名称');
            $form->keyValue('pro_sku', '产品参数');

            $form->currency('unit_price', '单品价格')->symbol('￥')->readonly();
            $form->display('unit_count', '单品数量');
            $form->currency('freight', '运费')->symbol('￥')->readonly();

            $form->select('pay_type', '支付类型')->options([
                RetailOrderLine::PAY_TYPE['NO_PAY'] => '未支付',
                RetailOrderLine::PAY_TYPE['ALIPAY'] => '支付宝',
                RetailOrderLine::PAY_TYPE['WEIXIN'] => '微信支付',
                RetailOrderLine::PAY_TYPE['OTHER'] => '其他',
            ]);

            $form->select('pay_status', '订单状态')->options([
                RetailOrderLine::PAY_STATUS['TO_BE_PAY'] => '待支付',
                RetailOrderLine::PAY_STATUS['TO_BE_DELIVERY'] => '待发货',
                RetailOrderLine::PAY_STATUS['TO_BE_SIGNED'] => '待签收',
                RetailOrderLine::PAY_STATUS['RETURN_EXCHANGE'] => '退换货',
            ]);

            $form->display('pay_serial_number', '交易流水号');
            $form->datetime('pay_time', '支付时间');
            $form->datetime('delivery_time', '发货时间');
            $form->datetime('sign_time', '签收时间');
        });

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
