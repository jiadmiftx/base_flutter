import 'package:flutter/material.dart';

class DropdownWidget extends StatelessWidget {
  final String selectedValue;
  final List<String> dropdownValues;
  final void Function(String?)? onChanged;

  const DropdownWidget({
    Key? key,
    required this.selectedValue,
    required this.dropdownValues,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      onChanged: onChanged,
      items: dropdownValues.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        contentPadding: EdgeInsets.fromLTRB(0, 12, 0, 12),
        isDense: true,
      ),
    );
  }
}
