import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile_response.freezed.dart';
part 'update_profile_response.g.dart';

@freezed
class UpadeteProfileResponse with _$UpadeteProfileResponse {
  factory UpadeteProfileResponse({
    bool? success,
    int? code,
    String? locale,
    String? message,
    Data? data,
  }) = _UpadeteProfileResponse;

  factory UpadeteProfileResponse.fromJson(Map<String, dynamic> json) => _$UpadeteProfileResponseFromJson(json);
}

@freezed
class Data with _$Data {
  factory Data({
    UpdateProfile? item,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class UpdateProfile with _$UpdateProfile {
  factory UpdateProfile({
    int? id,
    String? nik,
    @JsonKey(name: 'no_kk') String? noKk,
    String? nama,
    @JsonKey(name: 'no_hp') String? noHp,
    String? email,
    @JsonKey(name: 'jenis_kelamin') String? jenisKelamin,
    String? provinsi,
    String? kecamatan,
    String? kabupaten,
    String? desa,
    String? alamat,
    @JsonKey(name: 'device_token') dynamic deviceToken,
    @JsonKey(name: 'created_by') dynamic createdBy,
    @JsonKey(name: 'updated_by') dynamic updatedBy,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    List<String>? permissions,
    @JsonKey(name: 'count_notification_unread') int? countNotificationUnread,
  }) = _UpdateProfile;

  factory UpdateProfile.fromJson(Map<String, dynamic> json) => _$UpdateProfileFromJson(json);
}
