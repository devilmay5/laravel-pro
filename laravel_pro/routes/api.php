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
