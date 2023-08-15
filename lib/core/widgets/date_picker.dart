import 'package:mothercare_mobile/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DateTimePickerWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool aktaLahir;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  const DateTimePickerWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.inputFormatters,
    this.aktaLahir = false,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  _DateTimePickerWidgetState createState() => _DateTimePickerWidgetState();
}

class _DateTimePickerWidgetState extends State<DateTimePickerWidget> {
  DateTime? selectedDateTime;

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1000),
      lastDate: widget.aktaLahir ? DateTime.now() : DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDateTime = picked;
        widget.controller.text = DateFormat("dd-MM-yyyy").format(picked);
        widget.onChanged?.call(picked.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
            text: TextSpan(
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: BaseColor.colorGrey),
          children: <TextSpan>[
            TextSpan(text: widget.hintText),
            TextSpan(text: '*', style: TextStyle(fontWeight: FontWeight.normal, color: Colors.red)),
          ],
        )),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textCapitalization: TextCapitalization.words,
          keyboardType: TextInputType.emailAddress,
          onTap: () => _selectDateTime(context),
          controller: widget.controller,
          cursorColor: Colors.white,
          inputFormatters: widget.inputFormatters,
          validator: widget.validator ??
              (value) {
                if (value?.isEmpty ?? true) {
                  return "${widget.hintText} wajib disini";
                }
                return null;
              },
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.date_range),
            suffixIconColor: BaseColor.primaryColor,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            contentPadding: EdgeInsets.fromLTRB(0, 12, 0, 12),
            isDense: true,
            hintText: "Pilih " + widget.hintText,
          ),
        ),
      ],
    );
  }
}
