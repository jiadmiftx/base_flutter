part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => <Object>[];
}

class DataRegisterUserEvent extends RegisterEvent {
  final FormData registerUserRequest;

  const DataRegisterUserEvent({
    required this.registerUserRequest,
  });

  @override
  List<Object> get props => <Object>[registerUserRequest];
}

class DataResendOtpEvent extends RegisterEvent {
  final FormData resendOtpRequest;

  const DataResendOtpEvent({
    required this.resendOtpRequest,
  });

  @override
  List<Object> get props => <Object>[resendOtpRequest];
}

class DataGetProvince extends RegisterEvent {
  const DataGetProvince();

  @override
  List<Object> get props => <Object>[];
}

class DataGetDistrict extends RegisterEvent {
  final String? provinceCode;
  const DataGetDistrict({required this.provinceCode});

  @override
  List<Object?> get props => [provinceCode];
}

class DataSubGetDistrict extends RegisterEvent {
  final String? districtCode;
  const DataSubGetDistrict({required this.districtCode});

  @override
  List<Object?> get props => [districtCode];
}

class DataGetVillage extends RegisterEvent {
  final String? subDistrictCode;
  const DataGetVillage({required this.subDistrictCode});

  @override
  List<Object?> get props => [subDistrictCode];
}
