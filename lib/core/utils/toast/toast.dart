import 'package:pgn_mobile/core/core.dart';
import 'package:flutter/material.dart';

Future<void> showError(BuildContext context, String message, [int? duration]) async {
  await showGenericSnackBar(context, message, Icons.cancel, BaseColor.red821, true, duration ?? 2);
}

Future<void> showSuccess(BuildContext context, String message, [int? duration]) async {
  await showGenericSnackBar(context, message, Icons.check_circle, BaseColor.colorSecondary, false, duration ?? 2);
}

Future<void> showWarning(BuildContext context, String message, [int? duration]) async {
  await showGenericSnackBar(context, message, Icons.error, BaseColor.yellow14A, false, duration ?? 2);
}

Future<void> showGenericSnackBar(BuildContext context, String message, IconData iconData, Color backgroundColor, [bool error = false, int? duration]) async {
  OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (BuildContext context) => Positioned(
      top: kToolbarHeight,
      left: 24,
      right: 24,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                iconData,
                color: Colors.white,
              ).rightPadded8(),
              Flexible(
                child: Text18WhiteRegular(
                  message,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
  Overlay.of(context).insert(overlayEntry);

  await Future.delayed(Duration(seconds: duration ?? 2));

  overlayEntry.remove();
}
