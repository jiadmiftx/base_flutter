import 'package:mothercare_mobile/core/helpers/secure_storage/storage_helper.dart';
import 'package:mothercare_mobile/core/helpers/secure_storage/storage_key_helper.dart';
import 'package:mothercare_mobile/core/resource/models/base_response.dart';
import 'package:mothercare_mobile/core/resource/repositories/repository.dart';
import 'package:mothercare_mobile/features/home/model/bottom_banner_response.dart';
import 'package:mothercare_mobile/features/home/model/home_slider_response.dart';
import 'package:mothercare_mobile/features/home/model/product_slider_response.dart';
import 'package:mothercare_mobile/features/home/model/stripper_banner_response.dart';
import 'package:mothercare_mobile/features/profile/model/user_profile_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mothercare_mobile/generated/l10n.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Repository _repository;

  HomeBloc(this._repository) : super(HomeState()) {
    on<DataHomeProfileEvent>(_onHomeProfile);
    on<DataHomeBottomBannerEvent>(_onHomeBottomBanner);
    on<DataHomeSliderEvent>(_onHomeSlider);
    on<DataHomeStripperBannerEvent>(_onHomeStripperBanner);
    on<DataHomeNewArrivalEvent>(_onHomeNewArrival);
    on<DataHomeBestSellerEvent>(_onHomeBestSeller);
  }

  Future<void> _onHomeProfile(DataHomeProfileEvent event, Emitter<HomeState> emit) async {
    try {
      emit(const HomeState.noValue());
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

  Future<void> _onHomeStripperBanner(DataHomeStripperBannerEvent event, Emitter<HomeState> emit) async {
    try {
      emit(const HomeState.noValue());
      final data = await _repository.doGetHomeBannerStripper();
      if (data.response?.records != null && (data.response?.records?.isNotEmpty ?? true)) {
        emit(state.copyWith(isLoading: false, stripperBannerResponse: data));
      } else {
        emit(state.copyWith(isLoading: false, errorMessage: data.errorMessage));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onHomeSlider(DataHomeSliderEvent event, Emitter<HomeState> emit) async {
    try {
      emit(const HomeState.noValue());
      final data = await _repository.doGetHomeSlider();
      if (data.response?.records != null && (data.response?.records?.isNotEmpty ?? true)) {
        emit(state.copyWith(isLoading: false, sliderResponse: data));
      } else {
        emit(state.copyWith(isLoading: false, errorMessage: data.errorMessage));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onHomeBottomBanner(DataHomeBottomBannerEvent event, Emitter<HomeState> emit) async {
    try {
      emit(const HomeState.noValue());
      final data = await _repository.doGetHomeBottomBanner();
      if (data.response?.records != null && (data.response?.records?.isNotEmpty ?? true)) {
        emit(state.copyWith(isLoading: false, bottomBannerResponse: data));
      } else {
        emit(state.copyWith(isLoading: false, errorMessage: data.errorMessage));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onHomeNewArrival(DataHomeNewArrivalEvent event, Emitter<HomeState> emit) async {
    try {
      emit(const HomeState.noValue());
      final data = await _repository.doGetHomeNewArrival();
      if (data.response?.products != null && (data.response?.products?.isNotEmpty ?? true)) {
        emit(state.copyWith(isLoading: false, newArrivalResponse: data));
      } else {
        emit(state.copyWith(isLoading: false, errorMessage: data.errorMessage));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onHomeBestSeller(DataHomeBestSellerEvent event, Emitter<HomeState> emit) async {
    try {
      emit(const HomeState.noValue());
      final data = await _repository.doGetHomeBestSeller();
      if (data.response?.products != null && (data.response?.products?.isNotEmpty ?? true)) {
        emit(state.copyWith(isLoading: false, bestSellerResponse: data));
      } else {
        emit(state.copyWith(isLoading: false, errorMessage: data.errorMessage));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
