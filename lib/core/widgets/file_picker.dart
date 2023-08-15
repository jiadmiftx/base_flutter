import 'dart:io';
import 'package:mothercare_mobile/core/core.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

class FilePickerWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  const FilePickerWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.inputFormatters,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  _FilePickerWidgetState createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {
  File? pickedFile;

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        pickedFile = File(result.files.single.path!);
        widget.controller.text = pickedFile!.path;
        widget.onChanged?.call(pickedFile!.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textCapitalization: TextCapitalization.words,
          keyboardType: TextInputType.emailAddress,
          onTap: _pickFile,
          onChanged: widget.onChanged,
          controller: widget.controller,
          cursorColor: Colors.white,
          inputFormatters: widget.inputFormatters,
          validator: widget.validator,
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.file_copy),
            suffixIconColor: BaseColor.primaryColor,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            contentPadding: EdgeInsets.fromLTRB(0, 12, 0, 12),
            isDense: true,
            hintText: widget.hintText,
          ),
        ),
      ],
    );
  }
}
