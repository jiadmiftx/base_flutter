import 'package:pgn_mobile/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final bool? obscuretext;
  final int? maxlines;
  final bool required;
  final int? maxLenght;
  final bool enable;
  final TextInputType? textInputType;

  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.inputFormatters,
    this.onChanged,
    this.suffixIcon,
    this.validator,
    this.prefixIcon,
    this.maxLenght,
    this.obscuretext,
    this.textInputType = TextInputType.text,
    this.maxlines = 1,
    this.enable = true,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
            text: TextSpan(
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: BaseColor.colorGrey),
          children: <TextSpan>[
            TextSpan(text: hintText),
            TextSpan(text: required ? '*' : ' (Opsional)', style: TextStyle(fontWeight: FontWeight.normal, color: required ? Colors.red : Colors.grey)),
          ],
        )),
        TextFormField(
          enabled: enable,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textCapitalization: TextCapitalization.words,
          keyboardType: textInputType,
          onChanged: onChanged,
          controller: controller,
          cursorColor: Colors.white,
          maxLines: maxlines,
          maxLength: maxLenght,
          inputFormatters: inputFormatters,
          obscureText: obscuretext ?? false,
          style: TextStyle(color: enable ? Colors.black : Colors.grey),
          validator: required
              ? validator ??
                  (value) {
                    if (value?.isEmpty ?? false) return "$hintText Wajib diisi";
                    return null;
                  }
              : (value) => null,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            contentPadding: EdgeInsets.fromLTRB(0, 12, 0, 12),
            isDense: true,
            hintText: "Masukkan " + hintText,
          ),
        ),
      ],
    );
  }
}
