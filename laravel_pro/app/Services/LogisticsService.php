<?php


namespace App\Services;


use GuzzleHttp\Client;

class LogisticsService
{
    const COM_URL = 'http://www.kuaidi100.com/autonumber/auto';
    const QUERY_URL = 'https://poll.kuaidi100.com/poll/query.do';

    /**
     * @param string $bill_no
     * @return array
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public static function getLogistics(string $bill_no)
    {
        $data = "";
        if ($bill_no) {
            $client = new Client();
            $comCode = self::getComCode($client, $bill_no);

            if($comCode){
                $param = [
                    'com' => $comCode,
                    'num' => $bill_no,
                ];
                $sign = strtoupper(md5(json_encode($param) . config('logistics.key') . config('logistics.customer')));

                $response = $client->request('POST', self::QUERY_URL, [
                    'form_params' => [
                        'customer' => config('logistics.customer'),
                        'sign' => $sign,
                        'param' => json_encode($param)
                    ]
                ]);

                $data = json_decode($response->getBody()->getContents(), true);
            }

        }
        return $data;
    }

    /**
     * @param $client
     * @param string $bill_no
     * @return mixed|string
     */
    public static function getComCode($client, string $bill_no)
    {
        $response = $client->request('POST', self::COM_URL, [
            'form_params' => [
                'num' => $bill_no,
                'key' => config('logistics.key'),
            ]
        ]);

        $body = $response->getBody()->getContents();
        $body = json_decode($body, true);

        return $body[0]['comCode'] ?? '';
    }
}
