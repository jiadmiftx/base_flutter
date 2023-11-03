import 'package:dio/dio.dart';
import 'package:pgn_mobile/core/resource/models/base_response.dart';
import 'package:pgn_mobile/core/resource/models/region_base_model.dart';
import 'package:pgn_mobile/features/home/model/bottom_banner_response.dart';
import 'package:pgn_mobile/features/home/model/home_slider_response.dart';
import 'package:pgn_mobile/features/home/model/product_slider_response.dart';
import 'package:pgn_mobile/features/home/model/stripper_banner_response.dart';
import 'package:pgn_mobile/features/profile/model/update_profile_response.dart';
import 'package:pgn_mobile/features/profile/model/user_profile_response.dart';
import 'package:pgn_mobile/features/register/model/register_response.dart';

abstract class RepositoryInterface {
  // Home
  Future<BaseResponse<HomeSliderResponse>> doGetHomeSlider();
  Future<BaseResponse<BottomBannerResponse>> doGetHomeBottomBanner();
  Future<BaseResponse<StripperBannerResponse>> doGetHomeBannerStripper();
  Future<BaseResponse<ProductSliderResponse>> doGetHomeNewArrival();
  Future<BaseResponse<ProductSliderResponse>> doGetHomeBestSeller();

  // Auth
  Future<BaseResponse<RegisterResponse>> doRegisterUser({required FormData registerUserRequest});
  Future<BaseResponse<UpadeteProfileResponse>> doUpdateProfile({required FormData updateProfileRequest});
  Future<BaseResponse> doResendOtp({required FormData resendOtpRequest});
  Future<BaseResponse<UserProfileResponse>> doGetProfile();
  Future<BaseResponse> doLogout();
  Future<BaseResponse> doReset({required FormData email});

  // Tracking

  // Region
  Future<BaseResponse<List<RegionModel>>> doGetProvince();
  Future<BaseResponse<List<RegionModel>>> doGetDistrict({String? provinceCode});
  Future<BaseResponse<List<RegionModel>>> doGetSubdistrict({String? districtCode});
  Future<BaseResponse<List<RegionModel>>> doGetVillage({String? subDistrictCode});
}
