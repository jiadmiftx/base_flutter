part of 'home_bloc.dart';

class HomeState extends Equatable {
  final BaseResponse<UserProfileResponse?>? userProfileResponse;
  final BaseResponse<BottomBannerResponse?>? bottomBannerResponse;
  final BaseResponse<HomeSliderResponse?>? sliderResponse;
  final BaseResponse<StripperBannerResponse?>? stripperBannerResponse;
  final BaseResponse<ProductSliderResponse?>? newArrivalResponse;
  final BaseResponse<ProductSliderResponse?>? bestSellerResponse;
  final bool isLoading;
  final String errorMessage;

  const HomeState({
    this.userProfileResponse,
    this.bottomBannerResponse,
    this.newArrivalResponse,
    this.stripperBannerResponse,
    this.bestSellerResponse,
    this.sliderResponse,
    this.isLoading = false,
    this.errorMessage = '',
  });

  const HomeState.noValue()
      : isLoading = true,
        errorMessage = '',
        sliderResponse = null,
        newArrivalResponse = null,
        stripperBannerResponse = null,
        bestSellerResponse = null,
        bottomBannerResponse = null,
        userProfileResponse = null;

  HomeState copyWith({
    BaseResponse<UserProfileResponse?>? userProfileResponse,
    BaseResponse<BottomBannerResponse?>? bottomBannerResponse,
    BaseResponse<HomeSliderResponse?>? sliderResponse,
    BaseResponse<StripperBannerResponse?>? stripperBannerResponse,
    BaseResponse<ProductSliderResponse?>? newArrivalResponse,
    BaseResponse<ProductSliderResponse?>? bestSellerResponse,
    bool? isLoading,
    String? errorMessage,
  }) {
    return HomeState(
      userProfileResponse: userProfileResponse ?? this.userProfileResponse,
      bottomBannerResponse: bottomBannerResponse ?? this.bottomBannerResponse,
      sliderResponse: sliderResponse ?? this.sliderResponse,
      stripperBannerResponse: stripperBannerResponse ?? this.stripperBannerResponse,
      newArrivalResponse: newArrivalResponse ?? this.newArrivalResponse,
      bestSellerResponse: bestSellerResponse ?? this.bestSellerResponse,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object>[
        isLoading,
        userProfileResponse ?? BaseResponse<UserProfileResponse?>(),
        bottomBannerResponse ?? BaseResponse<BottomBannerResponse?>(),
        sliderResponse ?? BaseResponse<HomeSliderResponse?>(),
        stripperBannerResponse ?? BaseResponse<StripperBannerResponse?>(),
        newArrivalResponse ?? BaseResponse<ProductSliderResponse>(),
        bestSellerResponse ?? BaseResponse<ProductSliderResponse>(),
        errorMessage,
      ];

  @override
  String toString() {
    return 'HomeState: {'
        'userProfileResponse: $userProfileResponse'
        'isLoading: $isLoading'
        'bottomBannerResponse: $bottomBannerResponse'
        'errorMessage: $errorMessage'
        '}';
  }
}
