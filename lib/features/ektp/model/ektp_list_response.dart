import 'package:freezed_annotation/freezed_annotation.dart';

part 'ektp_list_response.freezed.dart';
part 'ektp_list_response.g.dart';

@freezed
class EktpListResponse with _$EktpListResponse {
  factory EktpListResponse({
    bool? success,
    int? code,
    String? locale,
    String? message,
    Data? data,
  }) = _EktpListResponse;

  factory EktpListResponse.fromJson(Map<String, dynamic> json) => _$EktpListResponseFromJson(json);
}

@freezed
class Data with _$Data {
  factory Data({
    @JsonKey(name: 'current_page') int? currentPage,
    List<Datum>? data,
    @JsonKey(name: 'first_page_url') String? firstPageUrl,
    int? from,
    @JsonKey(name: 'last_page') int? lastPage,
    @JsonKey(name: 'last_page_url') String? lastPageUrl,
    List<Link>? links,
    @JsonKey(name: 'next_page_url') dynamic nextPageUrl,
    String? path,
    @JsonKey(name: 'per_page') int? perPage,
    @JsonKey(name: 'prev_page_url') dynamic prevPageUrl,
    int? to,
    int? total,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
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
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    String? url,
    Pivot? pivot,
  }) = _Attachment;

  factory Attachment.fromJson(Map<String, dynamic> json) => _$AttachmentFromJson(json);
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
class Link with _$Link {
  factory Link({
    dynamic url,
    String? label,
    bool? active,
  }) = _Link;

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);
}

@freezed
class Datum with _$Datum {
  factory Datum({
    int? id,
    @JsonKey(name: 'no_permohonan') String? noPermohonan,
    String? nik,
    String? nama,
    @JsonKey(name: 'no_kk') String? noKk,
    @JsonKey(name: 'jenis_kelamin') String? jenisKelamin,
    String? type,
    String? status,
    @JsonKey(name: 'pelayanan_mandiri') int? pelayananMandiri,
    @JsonKey(name: 'tgl_pengambilan') dynamic tglPengambilan,
    dynamic alasan,
    @JsonKey(name: 'created_by') int? createdBy,
    @JsonKey(name: 'updated_by') dynamic updatedBy,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    List<Attachment>? attachments,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}
