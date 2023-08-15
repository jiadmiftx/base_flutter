part of 'article_bloc.dart';

class ArticleState extends Equatable {
  final BaseResponse<UserProfileResponse?>? userProfileResponse;
  final bool isLoading;
  final String errorMessage;

  const ArticleState({
    this.userProfileResponse,
    this.isLoading = false,
    this.errorMessage = '',
  });

  const ArticleState.noValue()
      : isLoading = true,
        errorMessage = '',
        userProfileResponse = null;

  ArticleState copyWith({
    BaseResponse<UserProfileResponse?>? userProfileResponse,
    bool? isLoading,
    String? errorMessage,
  }) {
    return ArticleState(
      userProfileResponse: userProfileResponse ?? this.userProfileResponse,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object>[
        isLoading,
        userProfileResponse ?? BaseResponse<UserProfileResponse?>(),
        errorMessage,
      ];

  @override
  String toString() {
    return 'ArticleState: {'
        'userProfileResponse: $userProfileResponse'
        'isLoading: $isLoading'
        'errorMessage: $errorMessage'
        '}';
  }
}
