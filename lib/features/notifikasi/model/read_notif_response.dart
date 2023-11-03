// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'read_notif_response.freezed.dart';
part 'read_notif_response.g.dart';

@freezed
class ReadNotifResponse with _$ReadNotifResponse {
	factory ReadNotifResponse({
		bool? success,
		int? code,
		String? locale,
		String? message,
		Data? data,
	}) = _ReadNotifResponse;

	factory ReadNotifResponse.fromJson(Map<String, dynamic> json) => _$ReadNotifResponseFromJson(json);
}
@freezed
class Data with _$Data {
  factory Data({
    Item? item,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Item with _$Item {
  factory Item({
    int? id,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'is_read') int? isRead,
    Message? message,
    @JsonKey(name: 'read_at') String? readAt,
    @JsonKey(name: 'deleted_at') dynamic deletedAt,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}


@freezed
class Message with _$Message {
  factory Message({
    String? title,
    String? body,
    String? logo,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}
