import 'package:pgn_mobile/core/resource/models/base_response.dart';
import 'package:pgn_mobile/features/notifikasi/model/notification_response.dart';
import 'package:pgn_mobile/features/notifikasi/model/read_notif_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationState()) {}
}
