import 'package:flutter/material.dart';
import 'package:pgn_mobile/core/core.dart';
import 'package:pgn_mobile/core/utils/extensions/widget_util.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Loadable(
        child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: BaseColor.grey,
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text(
              "----",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
        Image.asset(
          getSourceByPng('base_icon'),
          height: 100,
        ),
      ],
    ));
  }
}
