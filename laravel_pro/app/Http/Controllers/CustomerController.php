<?php


namespace App\Http\Controllers;

use App\Modules\Customer;
use App\Services\CustomerServices;
use App\Services\SmsServices;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Facades\Log;

class CustomerController extends BaseController
{
    public function __construct()
    {
        parent::__construct();
    }

    public function CheckMobileIsExists()
    {
        try {
            $rules = [
                'mobile' => 'required|exists:customer,mobile',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            $customer = CustomerServices::registerCustomerByMobile($req);
            return $this->RemoteApiResponse($customer, self::SUCCESS_CODE, '手机号存在且有效');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function CheckSmsCode()
    {
        try {
            $rules = [
                'sms_code' => 'required',
                'mobile' => 'required'
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            $sms_list_name = 'sms:' . $req['mobile'];

            if (!Redis::llen($sms_list_name)) {
                return $this->RemoteApiResponse([], self::ERROR_CODE, '请获取有效短信验证码后操作');
            }

            $first_item = json_decode(Redis::lindex($sms_list_name, 0), true);
            if ($first_item['sms_code'] != $req['sms_code']) {
                return $this->RemoteApiResponse([], self::ERROR_CODE, '短信验证码错误，请重新输入');
            }
            return $this->RemoteApiResponse([], self::SUCCESS_CODE, '短信验证码验证成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function ResetPwd()
    {
        try {
            $rules = [
                'customer_id' => 'required|exists:customer,id',
                'password' => 'required'
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            $req['password'] = md5($req['password']);
            CustomerServices::updateCustomer($req);
            return $this->RemoteApiResponse([], self::SUCCESS_CODE, '更新成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function Register()
    {
        try {
            $rules = [
                'mobile' => 'required',
                'sms_code' => 'required',
                'password' => 'required'
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            if (CustomerServices::checkMobileIsRegister($req['mobile'])) {
                return $this->RemoteApiResponse([], self::ERROR_CODE, '手机号已注册，请勿重复注册');
            }

            $sms_list_name = 'sms:' . $req['mobile'];

            if (!Redis::llen($sms_list_name)) {
                return $this->RemoteApiResponse([], self::ERROR_CODE, '请获取有效短信验证码后操作');
            }

            $first_item = json_decode(Redis::lindex($sms_list_name, 0), true);
            if ($first_item['sms_code'] != $req['sms_code']) {
                return $this->RemoteApiResponse([], self::ERROR_CODE, '短信验证码错误，请重新输入');
            }

            $customer = CustomerServices::createCustomer($req);
            //删除短信验证码队列
            Redis::del($sms_list_name);
            return $this->RemoteApiResponse($customer->toArray(), self::SUCCESS_CODE, '注册成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function GetSmsCode()
    {
        try {
            $rules = [
                'mobile' => 'required',
                'send_type' => 'in:1,2',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            $sms_list_name = 'sms:' . $req['mobile'];
            $list_lenth = Redis::llen($sms_list_name);
            // 一分钟最多发4条短信
            if ($list_lenth == 4) {
                //获取队列中最后一个元素
                $last_item = json_decode(Redis::lindex($sms_list_name, -1), true);

                //如果当前时间，与队列最右边的元素的时间相比小于等于1分钟，则不让继续请求
                if ((time() - $last_item['time']) <= 60) {
                    return $this->RemoteApiResponse([], self::ERROR_CODE, '请求过于频繁，请在1分钟之后再次操作');
                } else {
                    //如果当前时间，与队列最右边的元素的时间相比大于1分钟，则pop出去最右边的元素
                    Redis::rpop($sms_list_name);
                }
            }

            $sms_code = random_int(100000, 999999);
            $sms_res = [
                'time' => time(),
                'sms_code' => $sms_code,
            ];

            $user_group = [$req['mobile']];
            $param_format = ["code" => $sms_code];

            $send_res = SmsServices::sendSms($user_group, $req['send_type'], $param_format);
            Log::info('发送短信请求',$req);
            Log::info('发送短信结果',$send_res);
            if ($send_res['Code'] == 'OK') {
                Redis::lpush($sms_list_name, json_encode($sms_res));
                Redis::expire($sms_list_name, 300);
                return $this->RemoteApiResponse([], self::SUCCESS_CODE, '发送成功');
            } else {
                return $this->RemoteApiResponse($send_res, self::ERROR_CODE, '发送失败，请联系管理员查看短信接口');
            }

        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function LoginByPwd()
    {
        try {
            $rules = [
                'mobile' => 'required|exists:customer,mobile',
                'password' => 'required',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            $customer = CustomerServices::registerCustomerByMobile($req);
            if (md5($req['password']) != $customer['password']) {
                return $this->RemoteApiResponse([], self::ERROR_CODE, '登录密码错误');
            }

            if ($customer['status'] == Customer::STATUS_CODE['DISABLE']) {
                return $this->RemoteApiResponse([], self::ERROR_CODE, '您的登录状态已被禁用，请联系管理员操作');
            }

            Session::put('customer_' . $customer['id'], $customer);
            return $this->RemoteApiResponse($customer, self::SUCCESS_CODE, '登录成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }


    public function Login()
    {
        try {
            $rules = [
                'mobile' => 'required',
                'wechat_openid' => '',
                'head_img_url' => ''
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            $customer = CustomerServices::registerCustomerByMobile($req);

            if ($customer['status'] == Customer::STATUS_CODE['DISABLE']) {
                return $this->RemoteApiResponse([], self::ERROR_CODE, '您的登录状态已被禁用，请联系管理员操作');
            }

            Session::put('customer_' . $customer['id'], $customer);

            return $this->RemoteApiResponse($customer, self::SUCCESS_CODE, '登录成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function Logout()
    {
        try {
            $rules = [
                'customer_id' => 'required',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            Session::forget('customer_' . $req['customer_id']);

            return $this->RemoteApiResponse([], self::SUCCESS_CODE, '登出成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function GetCustomerSelect()
    {
        try {
            $customer_group = CustomerServices::getSelectList();
            return response()->json($customer_group);

        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function GetCustomerInfo()
    {
        try {
            $rules = [
                'customer_id' => 'required',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            $customerInfo = CustomerServices::getCustomerById($req['customer_id']);

            if ($customerInfo) {
                $customerInfo = $customerInfo->toArray();
            } else {
                $customerInfo = [];
            }

            return $this->RemoteApiResponse($customerInfo, self::SUCCESS_CODE, '查询成功');

        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function UpdateCustomerInfo()
    {
        try {
            $rules = [
                'customer_id' => 'required|exists:customer,id',
                'nickname' => 'string',
                'sex' => 'string',
                'head_img_url' => ''
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            if ($this->request->hasFile('head_img_url')) {
                $req['head_img_url'] = $this->request->file('head_img_url');
            }
            CustomerServices::updateCustomer($req);
            return $this->RemoteApiResponse([], self::SUCCESS_CODE, '更新成功');
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }

    public function LoginFromWeb()
    {
        try{
            $rules = [
                'mobile' => 'required|exists:customer,mobile',
                'sms_code' => 'required',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);


            $sms_list_name = 'sms:' . $req['mobile'];

            if (!Redis::llen($sms_list_name)) {
                return $this->RemoteApiResponse([], self::ERROR_CODE, '请获取有效短信验证码后操作');
            }

            $first_item = json_decode(Redis::lindex($sms_list_name, 0), true);
            if ($first_item['sms_code'] != $req['sms_code']) {
                return $this->RemoteApiResponse([], self::ERROR_CODE, '短信验证码错误，请重新输入');
            }

            $customer = CustomerServices::registerCustomerByMobile($req);
            //删除短信验证码队列
            Redis::del($sms_list_name);
            Session::put('customer_' . $customer['id'], $customer);
            return $this->RemoteApiResponse($customer, self::SUCCESS_CODE, '登录成功');
        }catch (\Throwable $e){
            return $this->ErrorResponse($e);
        }
    }

}
