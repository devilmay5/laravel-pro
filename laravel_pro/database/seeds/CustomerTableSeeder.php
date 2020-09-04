<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;

class CustomerTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for($i=0;$i<50;$i++){
            DB::table('customer')->insert([
                'created_at'=>date('Y-m-d H:i:s',time()),
                'updated_at'=>date('Y-m-d H:i:s',time()),
                'nickname' => Str::words('Tom'),
                'mobile' => '18102025228',
                'wechat_openid' => Str::uuid(),
                'head_img_url' => 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132',
            ]);
        }

    }
}
