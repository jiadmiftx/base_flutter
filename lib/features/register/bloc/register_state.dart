// ignore_for_file: must_be_immutable

part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final OtpValidateResponse? otpValidateResponse;
  final RegisterResponse? registerResponse;
  final bool isLoading;
  final String errorMessage;
  final int statusCode;
  final String message;

  // Region
  final List<RegionModel>? listProvince;
  final List<RegionModel>? listDistrict;
  final List<RegionModel>? listSubDistrict;
  final List<RegionModel>? listVillage;

  // Selected Region
  RegionModel? selectedProvince;
  RegionModel? selectedSubDistrict;
  RegionModel? selectedDistrict;
  RegionModel? selectedVillage;

  RegisterState({
    this.otpValidateResponse,
    this.registerResponse,
    this.isLoading = false,
    this.errorMessage = '',
    this.message = '',
    this.statusCode = 0,
    this.listProvince,
    this.listDistrict,
    this.listSubDistrict,
    this.listVillage,
    this.selectedProvince,
    this.selectedSubDistrict,
    this.selectedDistrict,
    this.selectedVillage,
  });

  RegisterState.noValue()
      : isLoading = true,
        errorMessage = '',
        message = '',
        statusCode = 0,
        registerResponse = null,
        otpValidateResponse = null,
        listProvince = null,
        listDistrict = null,
        listSubDistrict = null,
        listVillage = null,
        selectedProvince = null,
        selectedSubDistrict = null,
        selectedDistrict = null,
        selectedVillage = null;

  RegisterState copyWith({
    OtpValidateResponse? otpValidateResponse,
    RegisterResponse? registerResponse,
    bool? isLoading,
    String? message,
    int? statusCode,
    String? errorMessage,
    List<RegionModel>? listProvince,
    List<RegionModel>? listDistrict,
    List<RegionModel>? listSubDistrict,
    List<RegionModel>? listVillage,
    RegionModel? selectedProvince,
    RegionModel? selectedSubDistrict,
    RegionModel? selectedDistrict,
    RegionModel? selectedVillage,
  }) {
    return RegisterState(
      otpValidateResponse: otpValidateResponse ?? this.otpValidateResponse,
      registerResponse: registerResponse ?? this.registerResponse,
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      statusCode: statusCode ?? this.statusCode,
      errorMessage: errorMessage ?? this.errorMessage,
      listProvince: listProvince ?? this.listProvince,
      listDistrict: listDistrict ?? this.listDistrict,
      listSubDistrict: listSubDistrict ?? this.listSubDistrict,
      listVillage: listVillage ?? this.listVillage,
      selectedProvince: selectedProvince ?? this.selectedProvince,
      selectedDistrict: selectedDistrict ?? this.selectedDistrict,
      selectedSubDistrict: selectedSubDistrict ?? this.selectedSubDistrict,
      selectedVillage: selectedVillage ?? this.selectedVillage,
    );
  }

  @override
  List<Object?> get props {
    return [
      isLoading,
      otpValidateResponse ?? OtpValidateResponse(),
      registerResponse ?? RegisterResponse(),
      message,
      statusCode,
      errorMessage,
      listProvince,
      listDistrict,
      listSubDistrict,
      listVillage,
      selectedProvince,
      selectedSubDistrict,
      selectedDistrict,
      selectedVillage,
    ];
  }

  @override
  String toString() {
    return 'RegisterState: {'
        'otpValidateResponse: $otpValidateResponse'
        'registerCustomerResponse: $registerResponse'
        'message: $message'
        'isLoading: $isLoading'
        'statusCode: $statusCode'
        'errorMessage: $errorMessage'
        'listProvince: $listProvince'
        'listDistrict: $listDistrict'
        'listSubDistrict: $listSubDistrict'
        'listVillage: $listVillage'
        '}';
  }
}
