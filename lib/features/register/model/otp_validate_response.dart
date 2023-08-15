import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_validate_response.freezed.dart';
part 'otp_validate_response.g.dart';

@freezed
class OtpValidateResponse with _$OtpValidateResponse {
  factory OtpValidateResponse({
    String? status,
    String? message,
    @JsonKey(name: 'auth_code') dynamic authCode,
  }) = _OtpValidateResponse;

  factory OtpValidateResponse.fromJson(Map<String, dynamic> json) =>
      _$OtpValidateResponseFromJson(json);
}
