import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:pgn_mobile/core/core.dart';
import 'package:flutter/material.dart';
import 'package:pgn_mobile/generated/l10n.dart';

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
        getSourceByPng('base_icon'),
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
        IconButton(
            onPressed: () {
              context.router.push(NotificationsPageRoute());
            },
            icon: Icon(Icons.notifications_none_rounded).rightPadded16()),
        IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border_outlined).rightPadded16()),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight((Platform.isIOS) ? 60 : 70);
}
