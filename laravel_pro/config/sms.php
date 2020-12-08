<?php
return [
    'sms_access_key_id' => env('SMS_ACCESS_KEY_ID', ''),
    'sms_access_key_secret' => env('SMS_ACCESS_KEY_SECRET', ''),
    'sms_sign' => env('SMS_SIGN', ''),
    'sms_reset_pwd_tpl_code' => env('SMS_RESET_PWD_TEMPLATE_CODE', ''),
    'sms_user_login_tpl_code' => env('SMS_USER_LOGIN_TEMPLATE_CODE', ''),
];
