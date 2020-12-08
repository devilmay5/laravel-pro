<?php


namespace App\Services;


use AlibabaCloud\Client\AlibabaCloud;

class SmsServices
{
    const SEND_TPL = [
        1 => 'SMS_205135231', // 重置密码
        2 => 'SMS_205125239'// 用户登录
    ];

    public static function sendSms($user_group, $send_type, $param_format)
    {
        $accessKeyId = config('sms.sms_access_key_id');
        $accessKeySecret = config('sms.sms_access_key_secret');

        AlibabaCloud::accessKeyClient($accessKeyId, $accessKeySecret)->regionId('cn-hangzhou')->asDefaultClient();

        $result = AlibabaCloud::rpc()
            ->product('Dysmsapi')
            ->version('2017-05-25')
            ->action('SendSms')
            ->method('POST')
            ->host('dysmsapi.aliyuncs.com')
            ->options([
                'query' => [
                    'RegionId' => "cn-hangzhou",
                    'PhoneNumbers' => implode(',', $user_group),
                    'SignName' => config('sms.sms_sign'),
                    'TemplateCode' => self::SEND_TPL[$send_type],
                    'TemplateParam' => json_encode($param_format),
                ],
            ])
            ->request();
        return $result->toArray();
    }
}
