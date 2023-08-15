import 'package:freezed_annotation/freezed_annotation.dart';

part 'categroy_response.freezed.dart';
part 'categroy_response.g.dart';

@freezed
class CategroyResponse with _$CategroyResponse {
  factory CategroyResponse({
    List<Record>? records,
  }) = _CategroyResponse;

  factory CategroyResponse.fromJson(Map<String, dynamic> json) => _$CategroyResponseFromJson(json);
}

@freezed
class Record with _$Record {
  factory Record({
    int? id,
    @JsonKey(name: 'parent_id') int? parentId,
    String? name,
    dynamic image,
    @JsonKey(name: 'is_active') bool? isActive,
    int? position,
    int? level,
    @JsonKey(name: 'product_count') int? productCount,
    @JsonKey(name: 'children_data') List<ChildrenDatum>? childrenData,
  }) = _Record;

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
}

@freezed
class ChildrenDatum with _$ChildrenDatum {
  factory ChildrenDatum({
    int? id,
    @JsonKey(name: 'parent_id') int? parentId,
    String? name,
    dynamic image,
    @JsonKey(name: 'is_active') bool? isActive,
    int? position,
    int? level,
    @JsonKey(name: 'product_count') int? productCount,
    @JsonKey(name: 'children_data') List<ChildrenDatum>? childrenData,
  }) = _ChildrenDatum;

  factory ChildrenDatum.fromJson(Map<String, dynamic> json) => _$ChildrenDatumFromJson(json);
}
