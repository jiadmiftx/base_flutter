import 'package:freezed_annotation/freezed_annotation.dart';

part 'ektp_detail_response.freezed.dart';
part 'ektp_detail_response.g.dart';

@freezed
class EktpDetailResponse with _$EktpDetailResponse {
  factory EktpDetailResponse({
    bool? success,
    int? code,
    String? locale,
    String? message,
    DataDetail? data,
  }) = _EktpDetailResponse;

  factory EktpDetailResponse.fromJson(Map<String, dynamic> json) => _$EktpDetailResponseFromJson(json);
}

@freezed
class AttachmentDetail with _$AttachmentDetail {
  factory AttachmentDetail({
    int? id,
    String? disk,
    String? folder,
    @JsonKey(name: 'original_filename') String? originalFilename,
    @JsonKey(name: 'hash_filename') String? hashFilename,
    String? extension,
    @JsonKey(name: 'mime_type') String? mimeType,
    String? type,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    String? url,
    PivotDetail? pivot,
  }) = _AttachmentDetail;

  factory AttachmentDetail.fromJson(Map<String, dynamic> json) => _$AttachmentDetailFromJson(json);
}

@freezed
class Tracking with _$Tracking {
  factory Tracking({
    int? id,
    @JsonKey(name: 'module_name') String? moduleName,
    @JsonKey(name: 'module_id') int? moduleId,
    String? action,
    @JsonKey(name: 'created_by') int? createdBy,
    String? description,
    @JsonKey(name: 'created_on') String? createdOn,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _Tracking;

  factory Tracking.fromJson(Map<String, dynamic> json) => _$TrackingFromJson(json);
}

@freezed
class DataDetail with _$DataDetail {
  factory DataDetail({
    ItemDetail? item,
  }) = _DataDetail;

  factory DataDetail.fromJson(Map<String, dynamic> json) => _$DataDetailFromJson(json);
}

@freezed
class ItemDetail with _$ItemDetail {
  factory ItemDetail({
    int? id,
    @JsonKey(name: 'no_permohonan') String? noPermohonan,
    String? nik,
    String? nama,
    @JsonKey(name: 'no_kk') String? noKk,
    @JsonKey(name: 'jenis_kelamin') String? jenisKelamin,
    String? type,
    String? status,
    @JsonKey(name: 'pelayanan_mandiri') int? pelayananMandiri,
    dynamic alasan,
    @JsonKey(name: 'tgl_pengambilan') dynamic tglPengambilan,
    @JsonKey(name: 'created_by') int? createdBy,
    @JsonKey(name: 'updated_by') dynamic updatedBy,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    List<AttachmentDetail>? attachments,
    List<Tracking>? tracking,
  }) = _ItemDetail;

  factory ItemDetail.fromJson(Map<String, dynamic> json) => _$ItemDetailFromJson(json);
}

@freezed
class PivotDetail with _$PivotDetail {
  factory PivotDetail({
    @JsonKey(name: 'attachmentable_id') int? attachmentableId,
    @JsonKey(name: 'attachment_id') int? attachmentId,
    @JsonKey(name: 'attachmentable_type') String? attachmentableType,
  }) = _PivotDetail;

  factory PivotDetail.fromJson(Map<String, dynamic> json) => _$PivotDetailFromJson(json);
}
