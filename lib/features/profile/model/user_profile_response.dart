// ignore_for_file: invalid_annotation_target

import 'package:pgn_mobile/core/resource/models/region_base_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_response.freezed.dart';
part 'user_profile_response.g.dart';

@freezed
class UserProfileResponse with _$UserProfileResponse {
  factory UserProfileResponse({
    bool? success,
    int? code,
    String? locale,
    String? message,
    Data? data,
  }) = _UserProfileResponse;

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) => _$UserProfileResponseFromJson(json);
}

@freezed
class Data with _$Data {
  factory Data({
    ItemProfile? item,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class ItemProfile with _$ItemProfile {
  factory ItemProfile({
    int? id,
    String? nik,
    @JsonKey(name: 'no_kk') String? noKk,
    String? nama,
    @JsonKey(name: 'no_hp') String? noHp,
    String? email,
    @JsonKey(name: 'jenis_kelamin') String? jenisKelamin,
    RegionModel? provinsi,
    RegionModel? kecamatan,
    RegionModel? kabupaten,
    RegionModel? desa,
    String? alamat,
    @JsonKey(name: 'device_token') dynamic deviceToken,
    @JsonKey(name: 'created_by') dynamic createdBy,
    @JsonKey(name: 'updated_by') dynamic updatedBy,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    List<String>? permissions,
    @JsonKey(name: 'count_notification_unread') int? countNotificationUnread,
    List<Attachment>? attachments,
    List<Faq>? faq,
    @JsonKey(name: 'index_kepuasan') String? indexKepuasan,
    @JsonKey(name: 'pusat_bantuan') List<PusatBantuan>? pusatBantuan,
    String? foto,
    List<Role>? roles,
  }) = _ItemProfile;

  factory ItemProfile.fromJson(Map<String, dynamic> json) => _$ItemProfileFromJson(json);
}

@freezed
class Faq with _$Faq {
  factory Faq({
    int? id,
    String? kategori,
    String? pertanyaan,
    String? jawaban,
    @JsonKey(name: 'created_by') int? createdBy,
    @JsonKey(name: 'updated_by') dynamic updatedBy,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _Faq;

  factory Faq.fromJson(Map<String, dynamic> json) => _$FaqFromJson(json);
}

@freezed
class PusatBantuan with _$PusatBantuan {
  factory PusatBantuan({
    int? id,
    String? nama,
    @JsonKey(name: 'no_hp') String? noHp,
    String? jabatan,
    @JsonKey(name: 'created_by') int? createdBy,
    @JsonKey(name: 'updated_by') String? updatedBy,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    String? whatsapp,
    String? foto,
  }) = _PusatBantuan;

  factory PusatBantuan.fromJson(Map<String, dynamic> json) => _$PusatBantuanFromJson(json);
}

@freezed
class Permission with _$Permission {
  factory Permission({
    int? id,
    String? name,
    @JsonKey(name: 'guard_name') String? guardName,
    String? category,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    Pivot? pivot,
  }) = _Permission;

  factory Permission.fromJson(Map<String, dynamic> json) => _$PermissionFromJson(json);
}

@freezed
class Pivot with _$Pivot {
  factory Pivot({
    @JsonKey(name: 'attachmentable_id') int? attachmentableId,
    @JsonKey(name: 'attachment_id') int? attachmentId,
    @JsonKey(name: 'attachmentable_type') String? attachmentableType,
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
    @JsonKey(name: 'updated_by') dynamic updatedBy,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    Pivot? pivot,
    List<Permission>? permissions,
  }) = _Role;

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
}

@freezed
class Attachment with _$Attachment {
  factory Attachment({
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
    Pivot? pivot,
  }) = _Attachment;

  factory Attachment.fromJson(Map<String, dynamic> json) => _$AttachmentFromJson(json);
}
