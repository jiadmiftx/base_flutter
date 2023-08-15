part of 'login_bloc.dart';

class LoginState extends Equatable {
  final BaseResponse<LoginResponse?>? loginResponse;
  final BaseResponse<LoginResponse?>? resetResponse;
  final bool isLoading;
  final String errorMessage;

  const LoginState({
    this.loginResponse,
    this.resetResponse,
    this.isLoading = false,
    this.errorMessage = '',
  });

  const LoginState.noValue()
      : isLoading = true,
        errorMessage = '',
        resetResponse = null,
        loginResponse = null;

  LoginState copyWith({
    BaseResponse<LoginResponse?>? loginResponse,
    BaseResponse<LoginResponse?>? resetResponse,
    bool? isLoading,
    String? errorMessage,
  }) {
    return LoginState(
      loginResponse: loginResponse ?? this.loginResponse,
      resetResponse: resetResponse ?? this.resetResponse,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object>[isLoading, loginResponse ?? BaseResponse<LoginResponse?>(), loginResponse ?? BaseResponse<LoginResponse?>(), errorMessage];

  @override
  String toString() {
    return 'LoginState: {'
        'loginResponse: $loginResponse'
        'resetResponse: $resetResponse'
        'isLoading: $isLoading'
        'errorMessage: $errorMessage'
        '}';
  }
}
