part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => <Object>[];
}

class DataProfileEvent extends ProfileEvent {
  const DataProfileEvent();

  @override
  List<Object> get props => <Object>[];
}

class DataProfileLogoutEvent extends ProfileEvent {
  const DataProfileLogoutEvent();

  @override
  List<Object> get props => <Object>[];
}

class DataUpdateUserEvent extends ProfileEvent {
  final FormData updateProfileRequest;

  const DataUpdateUserEvent({
    required this.updateProfileRequest,
  });

  @override
  List<Object> get props => <Object>[updateProfileRequest];
}

class DataProfileGetProvince extends ProfileEvent {
  const DataProfileGetProvince();

  @override
  List<Object> get props => <Object>[];
}

class DataProfileGetDistrict extends ProfileEvent {
  final String? provinceCode;
  const DataProfileGetDistrict({required this.provinceCode});

  @override
  List<Object?> get props => [provinceCode];
}

class DataProfileSubGetDistrict extends ProfileEvent {
  final String? districtCode;
  const DataProfileSubGetDistrict({required this.districtCode});

  @override
  List<Object?> get props => [districtCode];
}

class DataProfileGetVillage extends ProfileEvent {
  final String? subDistrictCode;
  const DataProfileGetVillage({required this.subDistrictCode});

  @override
  List<Object?> get props => [subDistrictCode];
}
