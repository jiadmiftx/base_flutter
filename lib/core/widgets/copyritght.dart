import 'package:flutter/widgets.dart';
import 'package:pgn_mobile/core/utils/extensions/fun_utils.dart';
import 'package:pgn_mobile/core/utils/text/text_util.dart';

Widget buildCopyright() {
  return Column(
    children: [
      Image.asset(
        getSourceByPng('ic_bakso_grey'),
        height: 26,
      ),
      Text10GreyDefaultRegular("©️ DUKCAPIL LOTIM"),
    ],
  );
}
