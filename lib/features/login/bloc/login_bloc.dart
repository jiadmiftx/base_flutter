import 'package:dio/dio.dart';
import 'package:pgn_mobile/core/resource/injector/injection_container.dart';
import 'package:pgn_mobile/core/resource/models/base_response.dart';
import 'package:pgn_mobile/core/resource/network/http_service.dart';
import 'package:pgn_mobile/core/resource/repositories/repository.dart';
import 'package:pgn_mobile/features/login/model/login_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Repository _repository;

  LoginBloc(this._repository) : super(LoginState()) {
    on<DataLoginEvent>(_onLogin);
  }

  Future<void> _onLogin(DataLoginEvent event, Emitter<LoginState> emit) async {
    try {
      emit(const LoginState.noValue());
      final data = await _repository.doLogin(email: event.email, password: event.password);
      sl<HttpService>().setToken(token: data.response?.data?.token ?? "");
      emit(state.copyWith(isLoading: false, loginResponse: data, errorMessage: data.errorMessage));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
