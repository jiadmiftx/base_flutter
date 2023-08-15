import 'dart:io';

import 'package:mothercare_mobile/core/core.dart';
import 'package:mothercare_mobile/features/notifikasi/bloc/notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mothercare_mobile/generated/l10n.dart';

class AppBarsCenterLogo extends StatelessWidget implements PreferredSizeWidget {
  const AppBarsCenterLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: BaseColor.primaryColor,
      automaticallyImplyLeading: false,
      leading: Image.asset(
        getSourceByPng('ic_mothercare_white'),
      ).leftPadded(),
      title: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        width: 200,
        height: 40,
        child: Row(
          children: [Icon(Icons.search).leftPadded(8), Text14WhiteRegular(S.of(context).search_product)],
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.document_scanner_outlined).rightPadded16()),
        IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border_outlined).rightPadded16()),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight((Platform.isIOS) ? 60 : 70);
}
