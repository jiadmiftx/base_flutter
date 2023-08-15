import 'package:flutter/widgets.dart';
import 'package:mothercare_mobile/features/ektp/ektp.dart';
import 'package:mothercare_mobile/features/notifikasi/bloc/notification_bloc.dart';

@RoutePage()
class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationBloc, NotificationState>(
      builder: (context, state) {
        return Loadable(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: BaseColor.primaryColor,
            title: Text18WhitekBold("Pemberitahuan"),
          ),
          child: SafeArea(
            child: (state.userNotificationResponse?.response?.data?.data?.isEmpty ?? true)
                ? _buildEmptyWidget()
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.userNotificationResponse?.response?.data?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final data = state.userNotificationResponse?.response?.data?.data?[index];
                      return Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: data?.isRead == 0 ? Colors.white : Colors.grey[100], boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: data?.isRead == 0 ? Colors.black.withOpacity(0.15) : Colors.black.withOpacity(0.15),
                            spreadRadius: 0,
                          ),
                        ]),
                        child: ListTile(
                          onTap: () {
                            showAlertNotifDetail(context, textTitle: data?.message?.title ?? "", textDesc: data?.message?.body ?? "", date: data?.createdAt ?? "");
                            sl<NotificationBloc>().add(DataReadNotificationEvent(id_notif: data?.id.toString() ?? ""));
                          },
                          title: data?.isRead == 0 ? Text14BlackMedium(data?.message?.title ?? "") : Text14Black414Medium(data?.message?.title ?? ""),
                          subtitle: data?.isRead == 0 ? Text14BlackRegular(data?.createdAt ?? "") : Text12BlackRegular(data?.createdAt ?? ""),
                        ).padded(8),
                      ).horizontalPadded(8).topPadded(8);
                    }),
          ),
          loading: state.isLoading,
        );
      },
      listener: (context, state) {
        if (state.readNotifResponse?.statusCode == 200 && state.errorMessage == '') {
          sl<NotificationBloc>().add(DataGetAllNotificationEvent());
        }
      },
    );
  }

  _buildEmptyWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            getSourceByPng('ic_bakso_grey'),
            height: 40,
          ),
        ).padded(),
        Text16BlackRegular("Belum ada pemberitahuan...")
      ],
    );
  }
}
