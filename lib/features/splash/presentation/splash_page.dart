import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:mothercare_mobile/core/helpers/secure_storage/storage_key_helper.dart';
import 'package:mothercare_mobile/core/resource/injector/injection_container.dart';
import 'package:mothercare_mobile/core/resource/network/http_service.dart';
import 'package:flutter/material.dart';
import 'package:mothercare_mobile/core/core.dart';
import 'package:mothercare_mobile/core/helpers/secure_storage/storage_helper.dart';
import 'package:mothercare_mobile/features/splash/widgets/splash_widget.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: const Duration(milliseconds: 3000), vsync: this)
      ..forward()
      ..addStatusListener((_) async {
        await initialProcess();
      });
  }

  Future<void> initialProcess() async {
    final connect = await NetworkConnectivity().isConnected;

    if (connect) {
      final token = await storage.getAuthToken;
      // final token = null;
      log("token $token");
      // if (token != null) {
      // sl<HttpService>().setToken(token: token);
      context.router.replaceAll([HomePageRoute()]);

      // context.router.replaceAll([MainPageRoute()]);
      // } else {
      //   context.router.replaceAll([BoardingPageRoute()]);
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: animationController, builder: (context, _) => const SplashWidget());
  }
}
