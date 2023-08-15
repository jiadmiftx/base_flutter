import 'dart:developer';

import 'package:mothercare_mobile/core/helpers/secure_storage/storage_helper.dart';
import 'package:mothercare_mobile/core/helpers/secure_storage/storage_key_helper.dart';
import 'package:mothercare_mobile/core/resource/injector/injection_container.dart';
import 'package:mothercare_mobile/core/resource/models/base_response.dart';
import 'package:mothercare_mobile/core/resource/network/http_service.dart';
import 'package:mothercare_mobile/core/resource/repositories/repository.dart';
import 'package:mothercare_mobile/features/ektp/ektp.dart';
import 'package:mothercare_mobile/features/login/model/login_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Repository _repository;

  LoginBloc(this._repository) : super(LoginState()) {
    on<DataLoginEvent>(_onLogin);
    on<DataResetPasswordEvent>(_onResetPassword);
  }

  Future<void> _onLogin(DataLoginEvent event, Emitter<LoginState> emit) async {
    try {
      emit(const LoginState.noValue());
      final data = await _repository.doLogin(email: event.email, password: event.password);
      if (data.response?.data?.token != null) {
        await storage.write(StorageKey.authToken, "${data.response?.data?.token}");
        log("dara login ${data.response?.data?.user?.permissions}");
        await storage.write(StorageKey.rolePermission, "${data.response?.data?.user?.permissions}");
        emit(state.copyWith(isLoading: false, loginResponse: data));
        sl<HttpService>().setToken(token: data.response?.data?.token ?? "");
      } else {
        emit(state.copyWith(isLoading: false, errorMessage: data.errorMessage));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onResetPassword(DataResetPasswordEvent event, Emitter<LoginState> emit) async {
    try {
      // emit(const LoginState.noValue());
      // final data = await _repository.doReset(email: event.email);
      // if (data.statusCode != 200) {
      //   emit(state.copyWith(isLoading: false, resetResponse: data));
      // } else {
      //   emit(state.copyWith(isLoading: false, errorMessage: data.errorMessage));
      // }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
