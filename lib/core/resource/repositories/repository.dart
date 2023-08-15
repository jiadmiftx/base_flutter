import 'dart:convert';
import 'dart:developer';
import 'package:mothercare_mobile/core/resource/models/region_base_model.dart';
import 'package:mothercare_mobile/core/resource/network/rest_client.dart';
import 'package:mothercare_mobile/core/resource/repositories/repository_interface.dart';
import 'package:mothercare_mobile/features/category/model/categroy_response.dart';
import 'package:mothercare_mobile/features/ektp/ektp.dart';
import 'package:mothercare_mobile/features/home/model/bottom_banner_response.dart';
import 'package:mothercare_mobile/features/home/model/home_slider_response.dart';
import 'package:mothercare_mobile/features/home/model/product_slider_response.dart';
import 'package:mothercare_mobile/features/home/model/stripper_banner_response.dart';
import 'package:mothercare_mobile/features/profile/model/update_profile_response.dart';
import 'package:mothercare_mobile/features/profile/model/user_profile_response.dart';
import 'package:mothercare_mobile/features/register/model/register_response.dart';

class Repository implements RepositoryInterface {
  final RestClient _rest;
  const Repository(this._rest);

  @override
  Future<BaseResponse<HomeSliderResponse>> doGetHomeSlider() async {
    try {
      final response = await _rest.doGetHomeSlider();
      final requested = HomeSliderResponse.fromJson(response);

      return BaseResponse<HomeSliderResponse>(
        errorMessage: null,
        status: response['success'],
        response: requested,
        statusCode: response['code'],
      );
    } on DioError catch (e) {
      return BaseResponse<HomeSliderResponse>(
        errorMessage: e.response?.data['message'],
        status: e.response?.data['success'],
        response: null,
        statusCode: e.response?.data['code'],
      );
    } catch (e) {
      log("doGetRequestHomeSlider___: ${e}");
      return BaseResponse<HomeSliderResponse>();
    }
  }

  @override
  Future<BaseResponse<BottomBannerResponse>> doGetHomeBottomBanner() async {
    try {
      final response = await _rest.doGetHomeBottomBanner();
      final requested = BottomBannerResponse.fromJson(response);

      return BaseResponse<BottomBannerResponse>(
        errorMessage: null,
        status: response['success'],
        response: requested,
        statusCode: response['code'],
      );
    } on DioError catch (e) {
      return BaseResponse<BottomBannerResponse>(
        errorMessage: e.response?.data['message'],
        status: e.response?.data['success'],
        response: null,
        statusCode: e.response?.data['code'],
      );
    } catch (e) {
      log("doGetRequestHomeBottomBanner___: ${e}");
      return BaseResponse<BottomBannerResponse>();
    }
  }

  @override
  Future<BaseResponse<ProductSliderResponse>> doGetHomeBestSeller() async {
    try {
      final response = await _rest.doGetHomeBestSeller();
      List<dynamic> responseList = response.response.data;
      List<ProductSliderResponse> d = responseList.map((json) => ProductSliderResponse.fromJson(json)).toList();

      ProductSliderResponse firstD = d.first;

      return BaseResponse<ProductSliderResponse>(
        errorMessage: null,
        // status: response['success'],
        response: firstD,
        // statusCode: response['code'],
      );
    } on DioError catch (e) {
      return BaseResponse<ProductSliderResponse>(
        errorMessage: e.response?.data['message'],
        status: e.response?.data['success'],
        response: null,
        statusCode: e.response?.data['code'],
      );
    } catch (e) {
      log("doGetRequestHomeBestSeller___: ${e}");
      return BaseResponse<ProductSliderResponse>();
    }
  }

  @override
  Future<BaseResponse<ProductSliderResponse>> doGetHomeNewArrival() async {
    try {
      final response = await _rest.doGetHomeNewArrival();
      List<dynamic> responseList = response.response.data;
      List<ProductSliderResponse> d = responseList.map((json) => ProductSliderResponse.fromJson(json)).toList();

      ProductSliderResponse firstD = d.first;
      log("response code ${response.response.statusCode}");
      log("response code ${response.response.statusMessage}");
      return BaseResponse<ProductSliderResponse>(
        errorMessage: null,
        // status: response['success'],
        response: firstD,
        // statusCode: response['code'],
      );
    } on DioError catch (e) {
      return BaseResponse<ProductSliderResponse>(
        errorMessage: e.response?.data['message'],
        status: e.response?.data['success'],
        response: null,
        statusCode: e.response?.data['code'],
      );
    } catch (e) {
      log("doGetRequestHomeNewArrival___: ${e}");
      return BaseResponse<ProductSliderResponse>();
    }
  }

  @override
  Future<BaseResponse<StripperBannerResponse>> doGetHomeBannerStripper() async {
    try {
      final response = await _rest.doGetHomeBannerStripper();
      final requested = StripperBannerResponse.fromJson(response);

      return BaseResponse<StripperBannerResponse>(
        errorMessage: null,
        status: response['success'],
        response: requested,
        statusCode: response['code'],
      );
    } on DioError catch (e) {
      return BaseResponse<StripperBannerResponse>(
        errorMessage: e.response?.data['message'],
        status: e.response?.data['success'],
        response: null,
        statusCode: e.response?.data['code'],
      );
    } catch (e) {
      log("doGetRequestHomeNewArrival___: ${e}");
      return BaseResponse<StripperBannerResponse>();
    }
  }

  @override
  Future<BaseResponse<CategroyResponse>> doGetCategory({String? storeCode}) async {
    try {
      final response = await _rest.doGetCategory(storeCode);
      final requested = CategroyResponse.fromJson(response.response.data);

      return BaseResponse<CategroyResponse>(
        errorMessage: null,
        status: response.response.statusMessage == "OK",
        response: requested,
        statusCode: response.response.statusCode,
      );
    } on DioError catch (e) {
      return BaseResponse<CategroyResponse>(
        errorMessage: e.response?.data['message'],
        status: e.response?.data['success'],
        response: null,
        statusCode: e.response?.data['code'],
      );
    } catch (e) {
      log("doGetRequestHomeNewArrival___: ${e}");
      return BaseResponse<CategroyResponse>();
    }
  }

  @override
  Future<BaseResponse<List<RegionModel>>> doGetDistrict({String? provinceCode}) {
    // TODO: implement doGetDistrict
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<UserProfileResponse>> doGetProfile() {
    // TODO: implement doGetProfile
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<List<RegionModel>>> doGetProvince() {
    // TODO: implement doGetProvince
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<List<RegionModel>>> doGetSubdistrict({String? districtCode}) {
    // TODO: implement doGetSubdistrict
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<List<RegionModel>>> doGetVillage({String? subDistrictCode}) {
    // TODO: implement doGetVillage
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<LoginResponse>> doLogin({required String email, required String password}) {
    // TODO: implement doLogin
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse> doLogout() {
    // TODO: implement doLogout
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<RegisterResponse>> doRegisterUser({required FormData registerUserRequest}) {
    // TODO: implement doRegisterUser
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse> doResendOtp({required FormData resendOtpRequest}) {
    // TODO: implement doResendOtp
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse> doReset({required FormData email}) {
    // TODO: implement doReset
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<UpadeteProfileResponse>> doUpdateProfile({required FormData updateProfileRequest}) {
    // TODO: implement doUpdateProfile
    throw UnimplementedError();
  }
}
