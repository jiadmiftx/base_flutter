import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_response.freezed.dart';
part 'register_response.g.dart';

@freezed
class RegisterResponse with _$RegisterResponse {
  factory RegisterResponse({
    bool? success,
    int? code,
    String? locale,
    String? message,
    Data? data,
  }) = _RegisterResponse;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json);
}

@freezed
class Data with _$Data {
  factory Data({
    User? user,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Pivot with _$Pivot {
  factory Pivot({
    @JsonKey(name: 'model_id') int? modelId,
    @JsonKey(name: 'role_id') int? roleId,
    @JsonKey(name: 'model_type') String? modelType,
  }) = _Pivot;

  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);
}

@freezed
class Role with _$Role {
  factory Role({
    int? id,
    String? name,
    @JsonKey(name: 'guard_name') String? guardName,
    @JsonKey(name: 'created_by') dynamic createdBy,
    @JsonKey(name: 'updated_by') int? updatedBy,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    Pivot? pivot,
  }) = _Role;

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
}

@freezed
class User with _$User {
  factory User({
    String? email,
    String? nik,
    @JsonKey(name: 'no_kk') String? noKk,
    @JsonKey(name: 'jenis_kelamin') String? jenisKelamin,
    String? nama,
    @JsonKey(name: 'no_hp') String? noHp,
    String? provinsi,
    String? kabupaten,
    String? kecamatan,
    String? desa,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'created_at') String? createdAt,
    int? id,
    @JsonKey(name: 'count_notification_unread') int? countNotificationUnread,
    List<Role>? roles,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
