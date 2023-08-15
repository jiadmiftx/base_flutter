part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final BaseResponse<UserProfileResponse?>? userProfileResponse;
  final BaseResponse<UpadeteProfileResponse?>? updateProfileResponse;
  final String logoutMessage;
  final bool isLoading;
  final String errorMessage;

  final List<RegionModel>? listProvince;
  final List<RegionModel>? listDistrict;
  final List<RegionModel>? listSubDistrict;
  final List<RegionModel>? listVillage;

  // Selected Region
  RegionModel? selectedProvince;
  RegionModel? selectedSubDistrict;
  RegionModel? selectedDistrict;
  RegionModel? selectedVillage;

  ProfileState({
    this.userProfileResponse,
    this.updateProfileResponse,
    this.logoutMessage = '',
    this.isLoading = false,
    this.errorMessage = '',
    this.listProvince,
    this.listDistrict,
    this.listSubDistrict,
    this.listVillage,
    this.selectedProvince,
    this.selectedSubDistrict,
    this.selectedDistrict,
    this.selectedVillage,
  });

  ProfileState.noValue()
      : isLoading = true,
        logoutMessage = '',
        errorMessage = '',
        userProfileResponse = null,
        updateProfileResponse = null,
        listProvince = null,
        listDistrict = null,
        listSubDistrict = null,
        listVillage = null,
        selectedProvince = null,
        selectedSubDistrict = null,
        selectedDistrict = null,
        selectedVillage = null;

  ProfileState copyWith({
    BaseResponse<UserProfileResponse?>? userProfileResponse,
    BaseResponse<UpadeteProfileResponse?>? updateProfileResponse,
    bool? isLoading,
    String? logoutMessage,
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
    return ProfileState(
      userProfileResponse: userProfileResponse ?? this.userProfileResponse,
      updateProfileResponse: updateProfileResponse ?? this.updateProfileResponse,
      isLoading: isLoading ?? this.isLoading,
      logoutMessage: logoutMessage ?? this.logoutMessage,
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
  List<Object?> get props => [
        isLoading,
        userProfileResponse ?? BaseResponse<UserProfileResponse?>(),
        updateProfileResponse ?? BaseResponse<UpadeteProfileResponse?>(),
        logoutMessage,
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

  @override
  String toString() {
    return 'ProfileState: {'
        'userProfileResponse: $userProfileResponse'
        'updateProfileResponse: $updateProfileResponse'
        'isLoading: $isLoading'
        'logoutMessage: $userProfileResponse'
        'errorMessage: $errorMessage'
        'listProvince: $listProvince'
        'listDistrict: $listDistrict'
        'listSubDistrict: $listSubDistrict'
        'listVillage: $listVillage'
        '}';
  }
}
