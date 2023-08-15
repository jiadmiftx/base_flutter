import 'package:freezed_annotation/freezed_annotation.dart';

part 'pengajuan_ektp_response.freezed.dart';
part 'pengajuan_ektp_response.g.dart';

@freezed
class PengajuanEktpResponse with _$PengajuanEktpResponse {
  factory PengajuanEktpResponse({
    bool? success,
    int? code,
    String? locale,
    String? message,
    DataPengajuan? data,
  }) = _PengajuanEktpResponse;

  factory PengajuanEktpResponse.fromJson(Map<String, dynamic> json) => _$PengajuanEktpResponseFromJson(json);
}

@freezed
class Item with _$Item {
  factory Item({
    String? nik,
    @JsonKey(name: 'no_kk') String? noKk,
    String? nama,
    String? type,
    @JsonKey(name: 'jenis_kelamin') String? jenisKelamin,
    @JsonKey(name: 'no_permohonan') String? noPermohonan,
    @JsonKey(name: 'created_by') int? createdBy,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'created_at') String? createdAt,
    int? id,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
class DataPengajuan with _$DataPengajuan {
  factory DataPengajuan({
    Item? item,
  }) = _Data;

  factory DataPengajuan.fromJson(Map<String, dynamic> json) => _$DataPengajuanFromJson(json);
}
