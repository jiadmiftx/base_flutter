part of 'category_bloc.dart';

class CategoryState extends Equatable {
  final BaseResponse<CategroyResponse?>? categoryResponse;
  final bool isLoading;
  final String errorMessage;

  const CategoryState({
    this.categoryResponse,
    this.isLoading = false,
    this.errorMessage = '',
  });

  const CategoryState.noValue()
      : isLoading = true,
        errorMessage = '',
        categoryResponse = null;

  CategoryState copyWith({
    BaseResponse<CategroyResponse?>? categoryResponse,
    bool? isLoading,
    String? errorMessage,
  }) {
    return CategoryState(
      categoryResponse: categoryResponse ?? this.categoryResponse,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object>[
        isLoading,
        categoryResponse ?? BaseResponse<CategroyResponse?>(),
        errorMessage,
      ];

  @override
  String toString() {
    return 'CategoryState: {'
        'userProfileResponse: $categoryResponse'
        'isLoading: $isLoading'
        'errorMessage: $errorMessage'
        '}';
  }
}
