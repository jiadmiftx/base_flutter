// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  factory LoginResponse({
    bool? success,
    int? code,
    String? locale,
    String? message,
    DataLogin? data,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}

@freezed
class DataLogin with _$DataLogin {
  factory DataLogin({
    UserLogin? user,
    String? token,
  }) = _DataLogin;

  factory DataLogin.fromJson(Map<String, dynamic> json) => _$DataLoginFromJson(json);
}

@freezed
class PermissionLogin with _$PermissionLogin {
  factory PermissionLogin({
    int? id,
    String? name,
    @JsonKey(name: 'guard_name') String? guardName,
    String? category,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    PivotLogin? pivot,
  }) = _PermissionLogin;

  factory PermissionLogin.fromJson(Map<String, dynamic> json) => _$PermissionLoginFromJson(json);
}

@freezed
class RoleLogin with _$RoleLogin {
  factory RoleLogin({
    int? id,
    String? name,
    @JsonKey(name: 'guard_name') String? guardName,
    @JsonKey(name: 'created_by') dynamic createdBy,
    @JsonKey(name: 'updated_by') int? updatedBy,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    PivotLogin? pivot,
    List<PermissionLogin>? permissions,
  }) = _RoleLogin;

  factory RoleLogin.fromJson(Map<String, dynamic> json) => _$RoleLoginFromJson(json);
}

@freezed
class UserLogin with _$UserLogin {
  factory UserLogin({
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
    @JsonKey(name: 'device_token') dynamic deviceToken,
    @JsonKey(name: 'created_by') dynamic createdBy,
    @JsonKey(name: 'updated_by') dynamic updatedBy,
    @JsonKey(name: 'deleted_at') dynamic deletedAt,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    String? token,
    List<String>? permissions,
    @JsonKey(name: 'count_notification_unread') int? countNotificationUnread,
    List<AttachmentLogin>? attachments,
    List<RoleLogin>? roles,
  }) = _UserLogin;

  factory UserLogin.fromJson(Map<String, dynamic> json) => _$UserLoginFromJson(json);
}

@freezed
class PivotLogin with _$PivotLogin {
  factory PivotLogin({
    @JsonKey(name: 'attachmentable_id') int? attachmentableId,
    @JsonKey(name: 'attachment_id') int? attachmentId,
    @JsonKey(name: 'attachmentable_type') String? attachmentableType,
  }) = _PivotLogin;

  factory PivotLogin.fromJson(Map<String, dynamic> json) => _$PivotLoginFromJson(json);
}

@freezed
class AttachmentLogin with _$AttachmentLogin {
  factory AttachmentLogin({
    int? id,
    String? disk,
    String? folder,
    @JsonKey(name: 'original_filename') String? originalFilename,
    @JsonKey(name: 'hash_filename') String? hashFilename,
    String? extension,
    @JsonKey(name: 'mime_type') String? mimeType,
    String? type,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    String? url,
    PivotLogin? pivot,
  }) = _AttachmentLogin;

  factory AttachmentLogin.fromJson(Map<String, dynamic> json) => _$AttachmentLoginFromJson(json);
}
