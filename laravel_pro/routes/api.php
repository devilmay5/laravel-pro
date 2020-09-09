<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

use Illuminate\Support\Facades\Route;

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::prefix('map')->group(function () {
    Route::get('get-country', 'MapController@GetCountrySelect');
    Route::get('get-province', 'MapController@GetProvinceSelect');
});

Route::prefix('shop')->group(function () {
    Route::get('get-parent', 'ShopController@getParentBranch');
});

Route::prefix('customer')->group(function () {
    Route::get('get-customer-select', 'CustomerController@GetCustomerSelect');
    Route::post('get-customer-info', 'CustomerController@GetCustomerInfo');

});

Route::prefix('address')->group(function () {
    Route::post('get-address-list', 'AddressController@GetAddressList');
    Route::post('create-address-info', 'AddressController@CreateAddressInfo');
    Route::post('del-address-info', 'AddressController@DelAddressInfo');
    Route::post('update-address-info', 'AddressController@UpdateAddresInfo');
});

Route::prefix('pro_label')->group(function () {
    Route::get('get-pro_label-select', 'ProLabelController@GetProLabelSelect');
    Route::post('get-pro_label-list', 'ProLabelController@GetProLabelList');
});

Route::prefix('pro_brand')->group(function () {
    Route::get('get-brand-select', 'ProBrandController@GetBrandSelect');
    Route::post('get-brand-list', 'ProBrandController@GetBrandList');
    Route::post('get-brand-info', 'ProBrandController@GetBrandInfo');
});

Route::prefix('pro_class')->group(function () {
    Route::get('get-class-select', 'ProClassController@GetClassSelect');
    Route::post('get-class-list', 'ProClassController@GetClassList');
});

Route::prefix('pro_specs_class')->group(function () {
    Route::get('get-specs-class-select', 'ProSpecsClassController@GetSpecsClassSelect');
});

Route::prefix('pro_info')->group(function () {
    Route::post('get-pro-list', 'ProInfoController@GetProList');
    Route::post('get-pro-info', 'ProInfoController@GetProInfo');
});


Route::post('upload_file', function (Request $request) {
    if ($request->hasFile('file')) {
        $file = $request->file('file');
        $path = $file->store('images', 'admin');

        // 返回格式
        return ['url' => '/upload/' . $path];
    }
});
