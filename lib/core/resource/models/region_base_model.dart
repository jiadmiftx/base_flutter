import 'package:freezed_annotation/freezed_annotation.dart';

part 'region_base_model.freezed.dart';
part 'region_base_model.g.dart';

@freezed
class RegionBaseModel with _$RegionBaseModel {
  factory RegionBaseModel({
    List<RegionModel>? data,
  }) = _RegionBaseModel;

  factory RegionBaseModel.fromJson(Map<String, dynamic> json) => _$RegionBaseModelFromJson(json);
}

@freezed
class RegionModel with _$RegionModel {
  factory RegionModel({
    int? id,
    String? kode,
    String? nama,
  }) = _RegionModel;

  factory RegionModel.fromJson(Map<String, dynamic> json) =>
      _$RegionModelFromJson(json);
}
