part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object?> get props => <Object>[];
}

class DataGetAllNotificationEvent extends NotificationEvent {
  const DataGetAllNotificationEvent();

  @override
  List<Object> get props => <Object>[];
}

class DataReadNotificationEvent extends NotificationEvent {
  final String id_notif;
  const DataReadNotificationEvent({required this.id_notif});

  @override
  List<Object> get props => <Object>[id_notif];
}
