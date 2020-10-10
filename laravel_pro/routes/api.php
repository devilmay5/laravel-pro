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

Route::prefix('index')->group(function () {
    Route::post('get-search-list', 'IndexController@GetIndexProSearch');
    Route::post('get-banner', 'AdvertisementController@GetBannerList');
    Route::post('get-advert', 'AdvertisementController@GetAdvert');
    Route::post('get-recommend-list', 'IndexController@GetRecommendList');
    Route::post('get-pro-list', 'IndexController@GetProList');
    Route::post('get-pro-list-in-brand', 'IndexController@getProListInBrand');
    Route::post('get-new-pro-list', 'IndexController@getNewProList');
});

Route::prefix('customer')->group(function () {
    Route::post('login', 'CustomerController@Login');
    Route::post('logout', 'CustomerController@Logout');
    Route::get('get-customer-select', 'CustomerController@GetCustomerSelect');
    Route::middleware('check_customer')->post('update-customer', 'CustomerController@UpdateCustomerInfo');
    Route::middleware('check_customer')->post('get-customer-info', 'CustomerController@GetCustomerInfo');
    Route::middleware('check_customer')->post('add-feedback', 'FeedBackController@AddFeedBack');
    Route::middleware('check_customer')->post('get-problem-list', 'CommonProblemController@GetProblemList');
});

Route::prefix('address')->middleware('check_customer')->group(function () {
    Route::post('get-address-list', 'AddressController@GetAddressList');
    Route::post('create-address-info', 'AddressController@CreateAddressInfo');
    Route::post('del-address-info', 'AddressController@DelAddressInfo');
    Route::post('update-address-info', 'AddressController@UpdateAddresInfo');
    Route::post('get-default-address', 'AddressController@GetDefaultAddressByCustomerId');
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
    Route::get('get-root-class', 'ProClassController@GetRootClass');
    Route::get('get-child-class', 'ProClassController@GetChildClass');
    Route::get('get-all-class', 'ProClassController@GetAllClass');
});

Route::prefix('pro_specs_class')->group(function () {
    Route::get('get-specs-class-select', 'ProSpecsClassController@GetSpecsClassSelect');
});

Route::prefix('pro_info')->group(function () {
    Route::post('get-pro-list', 'ProInfoController@GetProList');
    Route::post('get-pro-info', 'ProInfoController@GetProInfo');
    Route::post('get-pro-recommend', 'ProInfoController@GetRecommendList');
    Route::get('get-template-select', 'FreightTemplateController@GetTemplateSelect');
    Route::post('get-template-info', 'FreightTemplateController@GetTemplateInfo');
});

Route::prefix('cart')->middleware('check_customer')->group(function () {
    Route::post('add-cart', 'CartController@CreateCart');
    Route::post('get-cart', 'CartController@GetCart');
    Route::post('update-cart', 'CartController@UpdateCart');
    Route::post('delete-cart', 'CartController@DeleteCart');
});

Route::prefix('retail_order')->middleware('check_customer')->group(function () {
    Route::post('add-retail-from-cart', 'RetailOrderController@AddRetailFromCart');
    Route::post('add-retail-from-pro', 'RetailOrderController@AddRetailFromPro');
    Route::post('get-retail-list', 'RetailOrderController@GetRetailList');
    Route::post('get-retail-info', 'RetailOrderController@GetRetailInfo');
    Route::post('add-retail-refund', 'RetailRefundController@CreateRetailRefund');
    Route::post('get-retail-refund-list', 'RetailRefundController@GetRetailRefundList');
    Route::post('get-retail-refund-info', 'RetailRefundController@GetRetailRefundInfo');
    Route::post('update-retail-status', 'RetailOrderController@UpdateRetailStatus');
});

Route::prefix('pro_collection')->middleware('check_customer')->group(function () {
    Route::post('add-pro-info-collection', 'ProCollectionController@addProInfoCollection');
    Route::post('del-pro-info-collection', 'ProCollectionController@delProInfoCollection');
    Route::post('get-pro_collection-list', 'ProCollectionController@getProInfoCollection');

    Route::post('add-brand-collection', 'ProCollectionController@addBrandCollection');
    Route::post('del-brand-collection', 'ProCollectionController@delBrandCollection');
    Route::post('get-brand_collection-list', 'ProCollectionController@getBrandCollection');
});

Route::prefix('ask')->middleware('check_customer')->group(function () {
    Route::post('add-ask', 'CustomerAskController@AddAsk');
    Route::post('get-ask-list', 'CustomerAskController@GetAskList');
    Route::post('get-ask-item', 'CustomerAskController@GetAskItem');
    Route::post('get-ask-item-by-pro', 'CustomerAskController@GetAskItemByProId');
    Route::post('get-system-push-list', 'SystemPushController@GetSystemPushList');
});

Route::prefix('about')->group(function () {
    Route::post('get-about-list', 'AboutController@GetAboutList');
});

Route::post('upload_file', function (Request $request) {
    if ($request->hasFile('file')) {
        $file = $request->file('file');
        $path = $file->store('images', 'admin');

        // 返回格式
        return ['url' => '/upload/' . $path];
    }
});
