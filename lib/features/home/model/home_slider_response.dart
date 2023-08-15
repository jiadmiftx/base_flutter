import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_slider_response.freezed.dart';
part 'home_slider_response.g.dart';


@freezed
class Record with _$Record {
  factory Record({
    String? name,
    @JsonKey(name: 'order_banner') String? orderBanner,
    String? image,
    @JsonKey(name: 'entity_type') String? entityType,
    @JsonKey(name: 'entity_name') String? entityName,
    @JsonKey(name: 'entity_id') String? entityId,
    @JsonKey(name: 'show_status') String? showStatus,
    @JsonKey(name: 'external_url') String? externalUrl,
    @JsonKey(name: 'button_name') String? buttonName,
    @JsonKey(name: 'category_id') String? categoryId,
    @JsonKey(name: 'product_id') String? productId,
  }) = _Record;

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
}

@freezed
class HomeSliderResponse with _$HomeSliderResponse {
  factory HomeSliderResponse({
    List<Record>? records,
  }) = _HomeSliderResponse;

  factory HomeSliderResponse.fromJson(Map<String, dynamic> json) => _$HomeSliderResponseFromJson(json);
}
