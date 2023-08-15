import 'package:mothercare_mobile/features/ektp/ektp.dart';
import 'package:dio/dio.dart';
import 'package:mothercare_mobile/features/login/model/login_request.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  // Home
  @GET('/homepage/type/slider')
  Future doGetHomeSlider();

  @GET('/homepage/promotionbottombanner')
  Future doGetHomeBottomBanner();

  @GET('/homepage/staticblock')
  Future doGetHomeBannerStripper();

  @GET('/homepage/getnewsliderone')
  Future<HttpResponse> doGetHomeNewArrival();

  @GET('/homepage/getnewslidertwo')
  Future<HttpResponse> doGetHomeBestSeller();

  @GET('/categoryTreeData')
  Future<HttpResponse> doGetCategory(@Query('storecode') String? storeCode);

  // Auth
  @POST('/login')
  Future doLogin(@Body() LoginRequest loginRequest);

  @POST('/forget-password')
  Future doResetPassword(@Body() FormData resetRequest);

  @POST('/register')
  Future doRegisterUser(@Body() FormData registerUserRequest);

  @POST('/profile/update')
  Future doUpdateProfile(@Body() FormData updateProfileRequest);

  @POST('/send-otp')
  Future doResendOtp(@Body() FormData resendOtpRequest);

  @GET('/profile')
  Future getProfile();

  @POST('/logout')
  Future doLogout();

  // Tracking
  @GET('/tracking/{no_permohonan}')
  Future doTracking(@Path() String no_permohonan);

  // Region
  @GET('/regional/provinsi')
  Future getProvince();

  @GET('/regional/kabupaten')
  Future getDistrict(@Query('provinsi') String? provinceCode);

  @GET('/regional/kecamatan')
  Future getSubdistrict(@Query('kabupaten') String? districtCode);

  @GET('/regional/desa')
  Future getVillage(@Query('kecamatan') String? subDistrictCode);

  // EKTP
  @GET('/request-ektp')
  Future getListRequestingEktp();

  @POST('/request-ektp')
  Future doRequestEktp(@Body() FormData data);

  @POST('/request-ektp/{id}')
  Future doEditRequestEktp(@Body() FormData data, @Path('id') String id);

  @GET('/request-ektp/{id}')
  Future getDetailEktp(@Path() String? id);

  @DELETE('/request-ektp/{id}')
  Future doDeleteEktp(@Path() String? id);

  // KK
  @GET('/kartu-keluarga')
  Future getListRequestingKK();

  @POST('/kartu-keluarga')
  Future doRequestKK(@Body() FormData data);

  @POST('/kartu-keluarga/{id}')
  Future doEditRequestKK(@Body() FormData data, @Path('id') String id);

  @GET('/kartu-keluarga/{id}')
  Future getDetailKK(@Path() String? id);

  @DELETE('/kartu-keluarga/{id}')
  Future doDeleteKK(@Path() String? id);

  // KIA
  @GET('/request-kia')
  Future getListKia();

  @POST('/request-kia')
  @MultiPart()
  Future doRequestKia(@Body() FormData data);

  @GET('/request-kia/{id}')
  Future getDetailKia(@Path('id') String? id);

  @POST('/request-kia/{id}')
  @MultiPart()
  Future doEditRequestKia(@Body() FormData data, @Path('id') String id);

  @DELETE('/request-kia/{id}')
  Future doDeleteKia(@Path() String? id);

  // AKta
  @GET('/request-akta')
  @MultiPart()
  Future getListRequestingAkta();

  @POST('/request-akta')
  @MultiPart()
  Future doRequestAkta(@Body() FormData data);

  @GET('/request-akta/{id}')
  Future getDetailAkta(@Path('id') String? id);

  @POST('/request-akta/{id}')
  @MultiPart()
  Future doEditRequestAkta(@Body() FormData data, @Path('id') String id);

  @DELETE('/request-akta/{id}')
  Future doDeleteAkta(@Path() String? id);

  // Tuak Manis
  @GET('/tuak-manis')
  Future getListTuakManis();

  @POST('/tuak-manis')
  @MultiPart()
  Future doRequestTuakManis(@Body() FormData data);

  @GET('/tuak-manis/{id}')
  Future getDetailTuakManis(@Path('id') String? id);

  @POST('/tuak-manis/{id}')
  @MultiPart()
  Future doEditRequestTuakManis(@Body() FormData data, @Path('id') String id);

  @DELETE('/tuak-manis/{id}')
  Future doDeleteTuakManis(@Path() String? id);

  // Notifications
  @GET('/notif')
  Future getAllNotifications();

  @GET('/notif/{id}/read')
  Future getReadNotif(@Path() String? id);

  @GET('/berita')
  Future getNews();

  // Info form
  @GET('/information-module/all')
  Future getAllInformationModule();

  // Si Cantik
  @GET('/si-cantik')
  Future getListSiCantik();

  @POST('/si-cantik')
  @MultiPart()
  Future doRequestSiCantik(@Body() FormData data);

  @GET('/si-cantik/{id}')
  Future getDetailSiCantik(@Path('id') String? id);

  @POST('/si-cantik/{id}')
  @MultiPart()
  Future doEditRequestSiCantik(@Body() FormData data, @Path('id') String id);

  @DELETE('/si-cantik/{id}')
  Future doDeleteSiCantik(@Path() String? id);

  // Kartu Keluarga
  @GET('/kartu-keluarga')
  Future getListKk();

  @POST('/kartu-keluarga')
  @MultiPart()
  Future doRequestKk(@Body() FormData data);

  @GET('/kartu-keluarga/{id}')
  Future getDetailKk(@Path('id') String? id);

  @POST('/kartu-keluarga/{id}')
  @MultiPart()
  Future doEditRequestKk(@Body() FormData data, @Path('id') String id);

  @DELETE('/kartu-keluarga/{id}')
  Future doDeleteKk(@Path() String? id);

  // Sync Data
  @GET('/sinkronisasi-data')
  Future getListSyncData();

  @POST('/sinkronisasi-data')
  @MultiPart()
  Future doRequestSyncData(@Body() FormData data);

  @GET('/sinkronisasi-data/{id}')
  Future getDetailSyncData(@Path('id') String? id);

  @POST('/sinkronisasi-data/{id}')
  @MultiPart()
  Future doEditRequestSyncData(@Body() FormData data, @Path('id') String id);

  @DELETE('/sinkronisasi-data/{id}')
  Future doDeleteSyncData(@Path() String? id);

  // Akta kematian
  @GET('/akta-kematian')
  Future getListAktaKematian();

  @POST('/akta-kematian')
  @MultiPart()
  Future doRequestAktaKematian(@Body() FormData data);

  @GET('/akta-kematian/{id}')
  Future getDetailAktaKematian(@Path('id') String? id);

  @POST('/akta-kematian/{id}')
  @MultiPart()
  Future doEditRequestAktaKematian(@Body() FormData data, @Path('id') String id);

  @DELETE('/akta-kematian/{id}')
  Future doDeleteAktaKematian(@Path() String? id);

  // Report duplicate
  @GET('/pengaduan-duplikat')
  Future getListReportDuplicate();

  @POST('/pengaduan-duplikat')
  @MultiPart()
  Future doRequestReportDuplicate(@Body() FormData data);

  @GET('/pengaduan-duplikat/{id}')
  Future getDetailReportDuplicate(@Path('id') String? id);

  @POST('/pengaduan-duplikat/{id}')
  @MultiPart()
  Future doEditRequestReportDuplicate(@Body() FormData data, @Path('id') String id);

  @DELETE('/pengaduan-duplikat/{id}')
  Future doDeleteReportDuplicate(@Path() String? id);

  // Move and Come
  @GET('/request-pindah-datang')
  Future getListMoveCome();

  @POST('/request-pindah-datang')
  @MultiPart()
  Future doRequestMoveCome(@Body() FormData data);

  @GET('/request-pindah-datang/{id}')
  Future getDetailMoveCome(@Path('id') String? id);

  @POST('/request-pindah-datang/{id}')
  @MultiPart()
  Future doEditRequestMoveCome(@Body() FormData data, @Path('id') String id);

  @DELETE('/request-pindah-datang/{id}')
  Future doDeleteMoveCome(@Path() String? id);

  // Kinan Ceria
  @GET('/kinan-ceria')
  Future getListKinanCeria();

  @POST('/kinan-ceria')
  @MultiPart()
  Future doRequestKinanCeria(@Body() FormData data);

  @GET('/kinan-ceria/{id}')
  Future getDetailKinanCeria(@Path('id') String? id);

  @POST('/kinan-ceria/{id}')
  @MultiPart()
  Future doEditRequestKinanCeria(@Body() FormData data, @Path('id') String id);

  @DELETE('/kinan-ceria/{id}')
  Future doDeleteKinanCeria(@Path() String? id);
}
