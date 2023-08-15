import 'package:flutter/material.dart';
import 'package:mothercare_mobile/core/core.dart';
import 'package:mothercare_mobile/core/utils/extensions/widget_util.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Loadable(
        child: Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          getSourceByJpg('splash-bg'),
          fit: BoxFit.fitWidth,
          height: MediaQuery.of(context).size.height,
        ),
        Container(
            decoration: BoxDecoration(
              color: BaseColor.primaryColor.withOpacity(0.8),
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: Text(
              "mothercare",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
            )))
      ],
    ));
  }
}
