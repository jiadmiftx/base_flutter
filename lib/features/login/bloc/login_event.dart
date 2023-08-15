part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => <Object>[];
}

class DataLoginEvent extends LoginEvent {
  final String email;
  final String password;

  const DataLoginEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => <Object>[email, password];
}

class DataResetPasswordEvent extends LoginEvent {
  final FormData email;

  const DataResetPasswordEvent({
    required this.email,
  });

  @override
  List<Object> get props => <Object>[email];
}
