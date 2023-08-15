import 'package:freezed_annotation/freezed_annotation.dart';

part 'info_item.freezed.dart';
part 'info_item.g.dart';

@freezed
class InfoItem with _$InfoItem {
  factory InfoItem({
    String? title,
    String? content,
  }) = _InfoItem;

  factory InfoItem.fromJson(Map<String, dynamic> json) =>
      _$InfoItemFromJson(json);
}
