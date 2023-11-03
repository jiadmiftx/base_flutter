import 'package:dio/dio.dart';
import 'package:pgn_mobile/core/helpers/secure_storage/storage_helper.dart';
import 'package:pgn_mobile/core/helpers/secure_storage/storage_key_helper.dart';
import 'package:pgn_mobile/core/resource/models/base_response.dart';
import 'package:pgn_mobile/core/resource/models/region_base_model.dart';
import 'package:pgn_mobile/core/resource/repositories/repository.dart';
import 'package:pgn_mobile/features/profile/model/update_profile_response.dart';
import 'package:pgn_mobile/features/profile/model/user_profile_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final Repository _repository;

  ProfileBloc(this._repository) : super(ProfileState()) {
    on<DataProfileEvent>(_onProfile);
    on<DataProfileLogoutEvent>(_logout);
    on<DataUpdateUserEvent>(_onUpdateProfile);
    on<DataProfileGetProvince>(_onGetProvince);
    on<DataProfileGetDistrict>(_onGetDistrict);
    on<DataProfileSubGetDistrict>(_onGetSubDistrict);
    on<DataProfileGetVillage>(_onGetVillage);
  }

  Future<void> _onProfile(DataProfileEvent event, Emitter<ProfileState> emit) async {
    try {
      emit(ProfileState.noValue());
      final data = await _repository.doGetProfile();
      if (data.response?.data != null) {
        await storage.write(StorageKey.deviceToken, data.response?.data?.item?.deviceToken ?? "");
        await storage.write(StorageKey.role, data.response?.data?.item?.roles?.first.name ?? "");
        await storage.write(StorageKey.rolePermission, "${data.response?.data?.item?.permissions}");
        if (data.response?.data?.item?.noKk != null && data.response?.data?.item?.noKk != "") {
          await storage.write(StorageKey.noKk, data.response?.data?.item?.noKk ?? "");
        }
        emit(state.copyWith(isLoading: false, userProfileResponse: data));
      } else {
        emit(state.copyWith(isLoading: false, errorMessage: data.errorMessage));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _logout(DataProfileLogoutEvent event, Emitter<ProfileState> emit) async {
    try {
      emit(ProfileState.noValue());
      final data = await _repository.doLogout();
      await storage.clear();
      emit(state.copyWith(isLoading: false, logoutMessage: data.errorMessage));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onUpdateProfile(DataUpdateUserEvent event, Emitter<ProfileState> emit) async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: '', updateProfileResponse: null));
      final data = await _repository.doUpdateProfile(updateProfileRequest: event.updateProfileRequest);
      emit(state.copyWith(isLoading: false, updateProfileResponse: data, errorMessage: data.errorMessage));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onGetProvince(DataProfileGetProvince event, Emitter<ProfileState> emit) async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: '', listProvince: null, listDistrict: null, listSubDistrict: null, listVillage: null));
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

  Future<void> _onGetDistrict(DataProfileGetDistrict event, Emitter<ProfileState> emit) async {
    try {
      // emit(const RegisterState.noValue());
      emit(state.copyWith(isLoading: true, errorMessage: '', listDistrict: null, listSubDistrict: null, listVillage: null));
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

  Future<void> _onGetSubDistrict(DataProfileSubGetDistrict event, Emitter<ProfileState> emit) async {
    try {
      // emit(const RegisterState.noValue());
      emit(state.copyWith(isLoading: true, errorMessage: '', listSubDistrict: null, listVillage: null));
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

  Future<void> _onGetVillage(DataProfileGetVillage event, Emitter<ProfileState> emit) async {
    try {
      // emit(const RegisterState.noValue());
      emit(state.copyWith(isLoading: true, errorMessage: '', listVillage: null));
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
