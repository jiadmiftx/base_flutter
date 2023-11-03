import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pgn_mobile/core/core.dart';
import 'package:pgn_mobile/core/utils/extensions/widget_util.dart';

@RoutePage()
class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Loadable(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: BaseColor.primaryColor,
        title: Text18WhitekBold("Pemberitahuan"),
      ),
      child: SafeArea(child: _buildEmptyWidget()),
    );
  }

  _buildEmptyWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            getSourceByPng('base_icon'),
            height: 40,
          ),
        ).padded(),
        Text16BlackRegular("Belum ada pemberitahuan...")
      ],
    );
  }
}
