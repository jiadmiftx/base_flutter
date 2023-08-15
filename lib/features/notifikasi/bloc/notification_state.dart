part of 'notification_bloc.dart';

class NotificationState extends Equatable {
  final BaseResponse<NotificationResponse?>? userNotificationResponse;
  final BaseResponse<ReadNotifResponse?>? readNotifResponse;
  final bool isLoading;
  final String errorMessage;

  const NotificationState({
    this.userNotificationResponse,
    this.readNotifResponse,
    this.isLoading = false,
    this.errorMessage = '',
  });

  const NotificationState.noValue()
      : isLoading = true,
        errorMessage = '',
        readNotifResponse = null,
        userNotificationResponse = null;

  NotificationState copyWith({
    BaseResponse<NotificationResponse?>? userNotificationResponse,
    BaseResponse<ReadNotifResponse?>? readNotifResponse,
    bool? isLoading,
    String? logoutMessage,
    String? errorMessage,
  }) {
    return NotificationState(
      userNotificationResponse: userNotificationResponse ?? this.userNotificationResponse,
      readNotifResponse: readNotifResponse ?? this.readNotifResponse,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object>[isLoading, userNotificationResponse ?? BaseResponse<NotificationResponse?>(), readNotifResponse ?? BaseResponse<ReadNotifResponse?>(), errorMessage];

  @override
  String toString() {
    return 'NotificationState: {'
        'userNotificationResponse: $userNotificationResponse'
        'readNotifResponse: $readNotifResponse'
        'isLoading: $isLoading'
        'logoutMessage: $userNotificationResponse'
        'errorMessage: $errorMessage'
        '}';
  }
}
