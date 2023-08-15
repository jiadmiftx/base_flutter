import 'dart:developer';

import 'package:mothercare_mobile/core/core.dart';
import 'package:mothercare_mobile/core/utils/extensions/widget_util.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenericSpinnerForm<T> extends StatelessWidget {
  final String hintText;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final Function(T?) callback;
  final Function() onTap;
  const GenericSpinnerForm({
    super.key,
    required this.onTap,
    required this.callback,
    required this.items,
    this.value,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: LeftAlignedColumn(
        children: [
          RichText(
              text: TextSpan(
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: BaseColor.colorGrey),
            children: <TextSpan>[
              TextSpan(text: hintText),
              TextSpan(text: '*', style: TextStyle(fontWeight: FontWeight.normal, color: Colors.red)),
            ],
          )),
          Spinner<T>(
            items: items,
            onChanged: (s) => callback(s),
            hintText: "Pilih " + hintText,
            value: value,
          ),
        ],
      ),
    );
  }
}

class GenericDropdown<T> extends StatelessWidget {
  final String hintText;
  final List<T> items;
  final T? value;

  final String Function(T)? itemAsString;
  final Function(T?) callback;
  final Function() onTap;

  final Future<bool?> Function(T?)? onBeforePopupOpening;

  const GenericDropdown({
    super.key,
    this.value,
    required this.items,
    required this.onTap,
    required this.itemAsString,
    required this.callback,
    required this.hintText,
    this.onBeforePopupOpening,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: LeftAlignedColumn(
        children: [
          RichText(
              text: TextSpan(
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: BaseColor.colorGrey),
            children: <TextSpan>[
              TextSpan(text: hintText),
              TextSpan(text: '*', style: TextStyle(fontWeight: FontWeight.normal, color: Colors.red)),
            ],
          )),
          DropdownSearch<T>(
            selectedItem: value,
            items: items,
            itemAsString: itemAsString,
            onChanged: callback,
            onBeforeChange: (prevItem, nextItem) {
              log("onBeforeChange");
              return Future.value(true);
            },
            onBeforePopupOpening: onBeforePopupOpening,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(hintText: "Pilih " + hintText),
              baseStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: BaseColor.colorGrey),
            ),
          )
        ],
      ),
    );
  }
}
