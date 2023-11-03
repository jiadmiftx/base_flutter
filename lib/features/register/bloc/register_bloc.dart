import 'package:pgn_mobile/core/resource/models/region_base_model.dart';
import 'package:pgn_mobile/core/resource/repositories/repository.dart';
import 'package:pgn_mobile/features/register/model/otp_validate_response.dart';
import 'package:pgn_mobile/features/register/model/register_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final Repository _repository;

  RegisterBloc(this._repository) : super(RegisterState()) {
    on<DataRegisterUserEvent>(_onRegisterUser);
    on<DataGetProvince>(_onGetProvince);
    on<DataGetDistrict>(_onGetDistrict);
    on<DataSubGetDistrict>(_onGetSubDistrict);
    on<DataGetVillage>(_onGetVillage);
    on<DataResendOtpEvent>(_onResendOtp);
  }

  Future<void> _onRegisterUser(DataRegisterUserEvent event, Emitter<RegisterState> emit) async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: '', message: '', registerResponse: null, listDistrict: null, listSubDistrict: null, listVillage: null));
      final data = await _repository.doRegisterUser(registerUserRequest: event.registerUserRequest);
      emit(state.copyWith(isLoading: false, registerResponse: data.response, statusCode: data.statusCode, errorMessage: data.errorMessage));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onResendOtp(DataResendOtpEvent event, Emitter<RegisterState> emit) async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: '', message: '', registerResponse: null, listDistrict: null, listSubDistrict: null, listVillage: null));
      final data = await _repository.doResendOtp(resendOtpRequest: event.resendOtpRequest);
      emit(state.copyWith(isLoading: false, registerResponse: data.response, statusCode: data.statusCode, errorMessage: data.errorMessage));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onGetProvince(DataGetProvince event, Emitter<RegisterState> emit) async {
    try {
      emit(RegisterState.noValue());
      final data = await _repository.doGetProvince();
      if (data.status == true) {
        emit(state.copyWith(isLoading: false, listProvince: data.response));
      } else {
        emit(state.copyWith(isLoading: false, errorMessage: data.errorMessage));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onGetDistrict(DataGetDistrict event, Emitter<RegisterState> emit) async {
    try {
      // emit(const RegisterState.noValue());
      emit(state.copyWith(isLoading: true, errorMessage: '', message: '', registerResponse: null, otpValidateResponse: null, listDistrict: null, listSubDistrict: null, listVillage: null));
      final data = await _repository.doGetDistrict(provinceCode: event.provinceCode);
      if (data.status == true) {
        emit(state.copyWith(isLoading: false, listDistrict: data.response));
      } else {
        emit(state.copyWith(isLoading: false, errorMessage: data.errorMessage));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onGetSubDistrict(DataSubGetDistrict event, Emitter<RegisterState> emit) async {
    try {
      // emit(const RegisterState.noValue());
      emit(state.copyWith(isLoading: true, errorMessage: '', message: '', registerResponse: null, otpValidateResponse: null, listSubDistrict: null, listVillage: null));
      final data = await _repository.doGetSubdistrict(districtCode: event.districtCode);
      if (data.status == true) {
        emit(state.copyWith(isLoading: false, listSubDistrict: data.response));
      } else {
        emit(state.copyWith(isLoading: false, errorMessage: data.errorMessage));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onGetVillage(DataGetVillage event, Emitter<RegisterState> emit) async {
    try {
      // emit(const RegisterState.noValue());
      emit(state.copyWith(isLoading: true, errorMessage: '', message: '', registerResponse: null, otpValidateResponse: null, listVillage: null));
      final data = await _repository.doGetVillage(subDistrictCode: event.subDistrictCode);
      if (data.status == true) {
        emit(state.copyWith(isLoading: false, listVillage: data.response));
      } else {
        emit(state.copyWith(isLoading: false, errorMessage: data.errorMessage));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
