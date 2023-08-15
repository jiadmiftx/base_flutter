import 'package:mothercare_mobile/core/resource/models/base_response.dart';
import 'package:mothercare_mobile/core/resource/repositories/repository.dart';
import 'package:mothercare_mobile/features/notifikasi/model/notification_response.dart';
import 'package:mothercare_mobile/features/notifikasi/model/read_notif_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final Repository _repository;

  NotificationBloc(this._repository) : super(NotificationState()) {
    on<DataGetAllNotificationEvent>(_onGetAllNotification);
    on<DataReadNotificationEvent>(_onReadNotification);
  }

  Future<void> _onGetAllNotification(DataGetAllNotificationEvent event, Emitter<NotificationState> emit) async {
    try {
      // emit(state.copyWith(isLoading: false, errorMessage: '', readNotifResponse: null));
      // final data = await _repository.doGetAllNotif();
      // if (data.response?.data != null) {
      //   emit(state.copyWith(isLoading: false, userNotificationResponse: data));
      // } else {
      //   emit(state.copyWith(isLoading: false, errorMessage: data.errorMessage));
      // }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onReadNotification(DataReadNotificationEvent event, Emitter<NotificationState> emit) async {
    try {
      // emit(state.copyWith(isLoading: false, errorMessage: '', readNotifResponse: null));
      // final data = await _repository.doReadNotification(id: event.id_notif);
      // if (data.response?.data != null) {
      //   emit(state.copyWith(isLoading: false, readNotifResponse: data));
      // } else {
      //   emit(state.copyWith(isLoading: false, errorMessage: data.errorMessage));
      // }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
