import 'dart:developer';
import 'dart:io';

import 'package:pgn_mobile/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget<T> extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool required;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(T)? onChanged;
  final String? Function(String?)? validator;

  const ImagePickerWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.inputFormatters,
    this.onChanged,
    this.validator,
    this.required = true,
  }) : super(key: key);

  @override
  _ImagePickerWidgetState<T> createState() => _ImagePickerWidgetState<T>();
}

class _ImagePickerWidgetState<T> extends State<ImagePickerWidget<T>> {
  XFile? pickedImage;

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery, maxWidth: 1000);

    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      final imageSizeKB = imageBytes.lengthInBytes / 1024;

      if (imageSizeKB > 1000) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Ukuran file terlalu besar, silahkan gunakan file dengan ukuran lebih kecil'),
              content: Text('Ukuran maks 1MB. format .jpg, .png'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            );
          },
        );
      } else {
        setState(() {
          pickedImage = pickedFile;
          widget.controller.text = pickedFile.name.split("-").last;
          widget.onChanged?.call(pickedImage as T);
        });
      }
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
            TextSpan(text: widget.required ? '*' : " (Opsional)", style: TextStyle(fontWeight: FontWeight.normal, color: widget.required ? Colors.red : Colors.grey)),
          ],
        )),
        InkWell(
          onTap: () {
            _pickImage();
          },
          child: TextFormField(
            enabled: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => widget.onChanged?.call(value as T),
            controller: widget.controller,
            cursorColor: Colors.red,
            inputFormatters: widget.inputFormatters,
            validator: widget.required
                ? widget.validator ??
                    (value) {
                      if (value?.isEmpty ?? true) return "${widget.hintText} wajib diunggah";
                      return null;
                    }
                : (value) => null,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.image),
              suffixIconColor: BaseColor.primaryColor,
              errorStyle: TextStyle(color: BaseColor.redE1B),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              contentPadding: EdgeInsets.fromLTRB(0, 12, 0, 12),
              isDense: true,
              hintText: "Unggah " + widget.hintText,
            ),
          ),
        ),
        Text(
          "(Ukuran maks 1MB. format .jpg/.png)",
          style: TextStyle(
            fontSize: 12,
            color: Colors.orange,
            fontWeight: FontWeight.w500,
          ),
        ).topPadded(4),
        Text(""),
      ],
    );
  }
}

class ImageProfileWidget<T> extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(T)? onChanged;
  final String? Function(String?)? validator;

  const ImageProfileWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.inputFormatters,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  State<ImageProfileWidget<T>> createState() => _ImageProfileWidgetState<T>();
}

class _ImageProfileWidgetState<T> extends State<ImageProfileWidget<T>> {
  XFile? pickedImage;

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery, maxWidth: 1000);

    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      final imageSizeKB = imageBytes.lengthInBytes / 1024;

      if (imageSizeKB > 1000) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Ukuran file terlalu besar, silahkan gunakan file dengan ukuran lebih kecil'),
              content: Text('Ukuran maks 1MB. format .jpg, .png'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            );
          },
        );
      } else {
        setState(() {
          pickedImage = pickedFile;
          widget.controller.text = pickedFile.name.split("-").last;
          widget.onChanged?.call(pickedImage as T);
        });
      }
    }
  }

  Future<File> loadXFile(XFile? xFile) async {
    final file = File(xFile?.path ?? "");
    return file;
  }

  @override
  Widget build(BuildContext context) {
    return CenterAlignedColumn(
      children: [
        pickedImage != null
            ? FutureBuilder<File>(
                future: loadXFile(pickedImage),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                    final file = snapshot.data!;
                    return Container(
                      width: 100, // Adjust the width as needed
                      height: 100, // Adjust the height as needed
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: BaseColor.primaryColor, width: 2), // Optional: Add a border
                      ),
                      child: ClipOval(
                        child: Image.file(
                          file, // Replace 'file' with the actual File object
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: 100,
                    );
                  }
                },
              )
            : Container(
                width: 100, // Adjust the width as needed
                height: 100, // Adjust the height as needed
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey, width: 2), // Optional: Add a border
                ),
                child: ClipOval(
                  child: Image.asset(
                    getSourceByPng('ic_profile_blank'), // Replace 'file' with the actual File object
                    fit: BoxFit.cover,
                  ),
                ),
              ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          child: TextButton(
              onPressed: () {
                _pickImage().then((value) {
                  widget.onChanged?.call(value as T);
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text12Blue8BDBold("Pilih Foto"),
                  Icon(
                    Icons.add_a_photo_outlined,
                    color: BaseColor.blue8BD,
                  )
                ],
              )),
        ),
      ],
    );
  }
}

class ImageProfileCameraWidget<T> extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(T)? onChanged;
  final String? Function(String?)? validator;

  const ImageProfileCameraWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.inputFormatters,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  State<ImageProfileCameraWidget<T>> createState() => _ImageProfileCameraWidgetState<T>();
}

class _ImageProfileCameraWidgetState<T> extends State<ImageProfileCameraWidget<T>> {
  XFile? pickedImage;

  Future<void> _pickImage() async {
    try {
      final imagePicker = ImagePicker();
      final pickedFile = await imagePicker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
        requestFullMetadata: true,
      );

      if (pickedFile != null) {
        final imageBytes = await pickedFile.readAsBytes();
        final imageSizeKB = imageBytes.lengthInBytes / 1024;
        if (imageSizeKB > 7000) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Ukuran file terlalu besar, silahkan gunakan file dengan ukuran lebih kecil'),
                content: Text('Ukuran maks 1MB. format .jpg, .png'),
                actions: [
                  TextButton(
                    child: Text('OK'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              );
            },
          );
        } else {
          setState(() {
            pickedImage = pickedFile;
            widget.controller.text = pickedFile.name.split("-").last;
            widget.onChanged?.call(pickedImage as T);
          });
        }
      }
    } catch (e) {
      log("ERROR PICK IMAGE CAMERA___ ${e.toString()}");
    }
  }

  Future<File> loadXFile(XFile? xFile) async {
    final file = File(xFile?.path ?? "");
    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            pickedImage != null
                ? FutureBuilder<File>(
                    future: loadXFile(pickedImage),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                        final file = snapshot.data!;
                        return Container(
                          width: 100, // Adjust the width as needed
                          height: 100, // Adjust the height as needed
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 2), // Optional: Add a border
                          ),
                          child: ClipOval(
                            child: Image.file(
                              file, // Replace 'file' with the actual File object
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      } else {
                        return SizedBox(
                          height: 100,
                        );
                      }
                    },
                  ).bottomPadded(20)
                : Container(
                    width: 100, // Adjust the width as needed
                    height: 100, // Adjust the height as needed
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey, width: 2), // Optional: Add a border
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        getSourceByPng('ic_profile_blank'), // Replace 'file' with the actual File object
                        fit: BoxFit.cover,
                      ),
                    ),
                  ).bottomPadded(20),
            Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  _pickImage();
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('SELFIE', style: TextStyle(fontSize: 14, color: BaseColor.blue8BD, fontWeight: FontWeight.bold)),
                    Icon(
                      Icons.add_a_photo_outlined,
                      color: BaseColor.blue8BD,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.warning,
              color: BaseColor.yellow14A,
            ).rightPadded10(),
            Expanded(
              child: Text(
                'SILAHKAN FOTO SELFIE UNTUK VALIDASI AKUN. JIKA TIDAK, MAKA VALIDASI PENDAFTARAN AKUN DITOLAK',
                style: TextStyle(fontSize: 10, color: BaseColor.yellow14A, fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ).padded()
      ],
    );
  }
}
