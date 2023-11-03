import 'package:pgn_mobile/core/resource/models/base_response.dart';
import 'package:pgn_mobile/core/resource/repositories/repository.dart';
import 'package:pgn_mobile/features/home/model/bottom_banner_response.dart';
import 'package:pgn_mobile/features/home/model/home_slider_response.dart';
import 'package:pgn_mobile/features/home/model/product_slider_response.dart';
import 'package:pgn_mobile/features/home/model/stripper_banner_response.dart';
import 'package:pgn_mobile/features/profile/model/user_profile_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Repository _repository;

  HomeBloc(this._repository) : super(HomeState()) {
    on<DataHomeProfileEvent>(_onHomeProfile);
  }

  Future<void> _onHomeProfile(DataHomeProfileEvent event, Emitter<HomeState> emit) async {
    try {
      emit(const HomeState.noValue());
      final data = await _repository.doGetProfile();
      if (data.response?.data != null) {
        emit(state.copyWith(isLoading: false, userProfileResponse: data));
      } else {
        emit(state.copyWith(isLoading: false, errorMessage: data.errorMessage));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
