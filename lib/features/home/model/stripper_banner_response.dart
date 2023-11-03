// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'stripper_banner_response.freezed.dart';
part 'stripper_banner_response.g.dart';

@freezed
class StripperBannerResponse with _$StripperBannerResponse {
  factory StripperBannerResponse({
    List<Record>? records,
  }) = _StripperBannerResponse;

  factory StripperBannerResponse.fromJson(Map<String, dynamic> json) => _$StripperBannerResponseFromJson(json);
}

@freezed
class Record with _$Record {
  factory Record({
    @JsonKey(name: 'class') String? recordClass,
    @JsonKey(name: 'entity_id') String? entityId,
    @JsonKey(name: 'entity_name') String? entityName,
    @JsonKey(name: 'external_url') String? externalUrl,
    @JsonKey(name: 'button_name') String? buttonName,
    @JsonKey(name: 'product_id') String? productId,
    @JsonKey(name: 'category_id') String? categoryId,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'entity_type') String? entityType,
  }) = _Record;

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
}
