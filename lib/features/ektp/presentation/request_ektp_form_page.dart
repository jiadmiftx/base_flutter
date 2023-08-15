import 'dart:developer';
import 'package:mothercare_mobile/features/ektp/ektp.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_html/flutter_html.dart' as html;

@RoutePage()
class RequestEktpFormPage extends StatefulWidget {
  const RequestEktpFormPage({super.key, this.isEdit = false, this.requKtpId});
  final bool isEdit;
  final String? requKtpId;

  @override
  State<RequestEktpFormPage> createState() => _RequestEktpFormPageState();
}

class _RequestEktpFormPageState extends State<RequestEktpFormPage> {
  final _nameCtrl = TextEditingController();
  final _noKKCtrl = TextEditingController();
  final _nikCtrl = TextEditingController();
  final _typeCtrl = TextEditingController(text: "baru");
  final _genderCtrl = TextEditingController(text: "L");

  final _fileF102Ctrl = TextEditingController();
  final _fileKKCtrl = TextEditingController();
  final _fileSuratPerekamanCtrl = TextEditingController();
  final _fileSuratKehilanganCtrl = TextEditingController();
  final _fileEktpCtrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  XFile? fileF102;
  XFile? fileKK;
  XFile? fileSuratPerekaman;
  XFile? fileSuratKehilangan;
  XFile? fileEktp;

  bool isChange = true;
  bool tnc = false;

  @override
  void initState() {
    _autoFill();
    if (widget.isEdit) {
      sl<EktpBloc>().add(DataDetailRequestedEktpEvent(id: widget.requKtpId ?? ""));
    }

    super.initState();
  }

  String? roles = '';

  _autoFill() async {
    roles = await storage.getRole;
    if (roles == "MASYARAKAT") {
      _noKKCtrl.text = await storage.getNoKK ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EktpBloc, EktpState>(
      listener: (context, state) {
        if (state.pengajuanEktpResponse != null && state.errorMessage == '' && !state.isLoading) {
          context.router.pop();
          sl<EktpBloc>().add(DataGetRequestedEktpEvent());
          showSuccess(context, !widget.isEdit ? "Pengajuan EKTP berhasil di tambahkan" : "Pengajuan EKTP berhasil di perbaharui", 5);
          if (widget.isEdit) {
            sl<EktpBloc>().add(DataDetailRequestedEktpEvent(id: widget.requKtpId ?? ""));
          }
        }

        if (state.pengajuanEktpResponse == null && state.errorMessage != '') {
          showError(context, state.errorMessage, 3);
        }

        if (widget.isEdit) {
          log("RUN IS EDIT");
          final dataReqKtp = state.ektpDetailResponse?.response?.data?.item;
          _nameCtrl.text = dataReqKtp?.nama ?? "";
          _noKKCtrl.text = dataReqKtp?.noKk ?? "";
          _nikCtrl.text = dataReqKtp?.nik ?? "";
          _typeCtrl.text = dataReqKtp?.type ?? "baru";
          _genderCtrl.text = dataReqKtp?.jenisKelamin ?? "L";
        }
      },
      builder: (context, state) {
        return Loadable(
          loading: state.isLoading,
          appBar: BackAppBar(
            backgroundColor: BaseColor.primaryColor,
            context,
            widget.isEdit ? "Ubah Pengajuan E-KTP" : "Pengajuan E-KTP",
            elevation: 0.0,
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: LeftAlignedColumn(
                children: [
                  TextFieldWidget(
                    enable: roles != "MASYARAKAT",
                    controller: _noKKCtrl,
                    hintText: "No. KK",
                    maxLenght: 16,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                    ],
                    validator: (value) {
                      if ((value ?? '').isEmpty) {
                        return 'Wajib diisi';
                      } else if (value!.length != 16) {
                        return 'No KK harus berisikan 16 Karakter';
                      } else {
                        return null;
                      }
                    },
                    textInputType: TextInputType.number,
                  ).paddedLTRB(left: 24, right: 24, top: 15, bottom: 8),
                  TextFieldWidget(
                    controller: _nikCtrl,
                    hintText: "NIK",
                    maxLenght: 16,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                    ],
                    validator: (value) {
                      if ((value ?? '').isEmpty) {
                        return 'Wajib diisi';
                      } else if (value!.length != 16) {
                        return 'NIK harus berisikan 16 Karakter';
                      } else {
                        return null;
                      }
                    },
                    textInputType: TextInputType.number,
                  ).paddedLTRB(left: 24, right: 24, top: 15, bottom: 8),
                  TextFieldWidget(
                    controller: _nameCtrl,
                    hintText: "Nama Lengkap",
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))],
                    validator: (value) {
                      if ((value ?? '').isEmpty) {
                        return 'Wajib diisi';
                      } else {
                        return null;
                      }
                    },
                  ).paddedLTRB(left: 24, right: 24, top: 15, bottom: 8),
                  GenericSpinnerForm<String>(
                    onTap: () {},
                    value: _genderCtrl.text,
                    callback: (p0) {
                      log("APA ISI CALLBACK NI ?? 🤮 $p0");
                      _genderCtrl.text = p0 ?? "";
                    },
                    items: [
                      DropdownMenuItem(
                        child: Text14BlackRegular("Laki-Laki"),
                        value: "L",
                      ),
                      DropdownMenuItem(
                        child: Text14BlackRegular("Perempuan"),
                        value: "P",
                      ),
                    ],
                    hintText: "Jenis Kelamin",
                  ).paddedLTRB(left: 24, right: 24, top: 15, bottom: 8),
                  GenericSpinnerForm<String>(
                    onTap: () {},
                    value: _typeCtrl.text,
                    callback: (p0) {
                      log("APA ISI CALLBACK NI ?? 🤮 $p0");
                      _typeCtrl.text = p0 ?? "";
                      setState(() {});
                    },
                    items: [
                      DropdownMenuItem(
                        child: Text14BlackRegular("Baru"),
                        value: "baru",
                      ),
                      DropdownMenuItem(
                        child: Text14BlackRegular("Hilang"),
                        value: "hilang",
                      ),
                      DropdownMenuItem(
                        child: Text14BlackRegular("Rusak"),
                        value: "rusak/perubahan data",
                      ),
                    ],
                    hintText: "Tipe Permohonan",
                  ).paddedLTRB(left: 24, right: 24, top: 15, bottom: 8),
                  ImagePickerWidget<XFile>(
                    controller: _fileF102Ctrl,
                    hintText: "F102",
                    validator: (value) {
                      if (widget.isEdit) {
                        return null;
                      } else {
                        if (value?.isEmpty ?? true) {
                          return 'F102 wajib diunggah';
                        } else {
                          return null;
                        }
                      }
                    },
                    onChanged: (file) {
                      log("F102 NI BOSSS🔫___ ${file.name}");
                      setState(() {
                        fileF102 = file;
                      });
                    },
                  ).paddedLTRB(left: 24, right: 24, top: 15, bottom: 8),
                  ImagePickerWidget<XFile>(
                    controller: _fileKKCtrl,
                    hintText: "Kartu Keluarga",
                    validator: (value) {
                      if (widget.isEdit) {
                        return null;
                      } else {
                        if (value?.isEmpty ?? true) {
                          return 'Kartu Keluarga wajib diunggah';
                        } else {
                          return null;
                        }
                      }
                    },
                    onChanged: (file) {
                      setState(() {
                        fileKK = file;
                      });
                    },
                  ).paddedLTRB(left: 24, right: 24, top: 15, bottom: 8),
                  _typeCtrl.text == 'baru'
                      ? ImagePickerWidget<XFile>(
                          controller: _fileSuratPerekamanCtrl,
                          hintText: "Surat Perekaman",
                          validator: (value) {
                            if (_typeCtrl.text == 'baru') {
                              if (widget.isEdit) {
                                if (state.ektpDetailResponse?.response?.data?.item?.attachments
                                        ?.firstWhere((element) => element.type == 'file_surat_perekaman', orElse: () => AttachmentDetail())
                                        .type ==
                                    null) {
                                  if (value?.isEmpty ?? true) {
                                    return 'Surat Perekaman wajib diunggah';
                                  } else {
                                    return null;
                                  }
                                } else {
                                  return null;
                                }
                              } else {
                                if (value?.isEmpty ?? true) {
                                  return 'Surat Perekaman wajib diunggah';
                                } else {
                                  return null;
                                }
                              }
                            } else {
                              return null;
                            }
                          },
                          onChanged: (file) {
                            setState(() {
                              fileSuratPerekaman = file;
                            });
                          },
                        ).paddedLTRB(left: 24, right: 24, top: 15, bottom: 8)
                      : SizedBox(),
                  _typeCtrl.text == 'hilang'
                      ? ImagePickerWidget<XFile>(
                          controller: _fileSuratKehilanganCtrl,
                          hintText: "Surat Kehilangan",
                          validator: (value) {
                            if (_typeCtrl.text == 'hilang') {
                              if (widget.isEdit) {
                                if (state.ektpDetailResponse?.response?.data?.item?.attachments
                                        ?.firstWhere((element) => element.type == 'file_bukti_kehilangan', orElse: () => AttachmentDetail())
                                        .type ==
                                    null) {
                                  if (value?.isEmpty ?? true) {
                                    return 'Surat Kehilangan wajib diunggah';
                                  } else {
                                    return null;
                                  }
                                } else {
                                  return null;
                                }
                              } else {
                                if (value?.isEmpty ?? true) {
                                  return 'Surat Kehilangan wajib diunggah';
                                } else {
                                  return null;
                                }
                              }
                            } else {
                              return null;
                            }
                          },
                          onChanged: (file) {
                            setState(() {
                              fileSuratKehilangan = file;
                            });
                          },
                        ).paddedLTRB(left: 24, right: 24, top: 15, bottom: 8)
                      : SizedBox(),
                  _typeCtrl.text == 'rusak/perubahan data'
                      ? ImagePickerWidget<XFile>(
                          controller: _fileEktpCtrl,
                          hintText: "EKTP Rusak",
                          validator: (value) {
                            if (_typeCtrl.text == 'rusak/perubahan data') {
                              if (widget.isEdit) {
                                if (state.ektpDetailResponse?.response?.data?.item?.attachments?.firstWhere((element) => element.type == 'file_ektp', orElse: () => AttachmentDetail()).type == null) {
                                  if (value?.isEmpty ?? true) {
                                    return 'EKTP Asli wajib diunggah';
                                  } else {
                                    return null;
                                  }
                                } else {
                                  return null;
                                }
                              } else {
                                if (value?.isEmpty ?? true) {
                                  return 'EKTP Asli wajib diunggah';
                                } else {
                                  return null;
                                }
                              }
                            } else {
                              return null;
                            }
                          },
                          onChanged: (file) {
                            setState(() {
                              fileEktp = file;
                            });
                          },
                        ).paddedLTRB(left: 24, right: 24, top: 15, bottom: 8)
                      : SizedBox(),
                  Visibility(child: _buildAttachment(state), visible: widget.isEdit)
                ],
              ).bottomPadded(100),
            ),
          ),
          bottomNavigationBar: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                disabledForegroundColor: BaseColor.grey,
                backgroundColor: BaseColor.primaryColor,
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  var show = await storage.getPopUpUU;
                  if (show != "true") {
                    showPopUp(context, tnc);
                  } else {
                    if (widget.isEdit) {
                      sl<EktpBloc>().add(DataRequestedEktpEvent(formData: FormData.fromMap(await ektpData), id: widget.requKtpId));
                    } else {
                      sl<EktpBloc>().add(DataRequestedEktpEvent(formData: FormData.fromMap(await ektpData)));
                    }
                  }
                }
              },
              child: Text14WhiteMedium("Simpan").padded(8),
            ),
          ).paddedLTRB(left: 24, right: 24, top: 32, bottom: 32),
        );
      },
    );
  }

  Future<Map<String, dynamic>> get ektpData async {
    return {
      // Give this field when edit data
      if (widget.isEdit) "_method": "put",

      "nik": _nikCtrl.text,
      "no_kk": _noKKCtrl.text,
      "nama": _nameCtrl.text,
      "type": _typeCtrl.text,
      "jenis_kelamin": _genderCtrl.text,
      "file_f102": fileF102?.path != null ? await MultipartFile.fromFile(fileF102?.path ?? "", filename: fileF102?.name.split("/").last, contentType: MediaType.parse("image/jpeg")) : null,
      "file_kartu_keluarga": fileKK?.path != null ? await MultipartFile.fromFile(fileKK?.path ?? "", filename: fileKK?.name.split("/").last, contentType: MediaType.parse("image/jpeg")) : null,
      "file_surat_perekaman": fileSuratPerekaman != null
          ? await MultipartFile.fromFile(fileSuratPerekaman?.path ?? "", filename: fileSuratPerekaman?.name.split("/").last, contentType: MediaType.parse("image/jpeg"))
          : null,
      "file_bukti_kehilangan": fileSuratKehilangan != null
          ? await MultipartFile.fromFile(fileSuratKehilangan?.path ?? "", filename: fileSuratKehilangan?.name.split("/").last, contentType: MediaType.parse("image/jpeg"))
          : null,
      "file_ektp": fileEktp != null ? await MultipartFile.fromFile(fileEktp?.path ?? "", filename: fileEktp?.name.split("/").last, contentType: MediaType.parse("image/jpeg")) : null,
    };
  }

  _buildAttachment(EktpState state) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.white, boxShadow: [
        BoxShadow(
          blurRadius: 4,
          color: Colors.black.withOpacity(0.15),
          spreadRadius: 0,
        ),
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text16GreyRegular("Lampiran").padded(8),
          Wrap(
              children: List.generate(
            state.ektpDetailResponse?.response?.data?.item?.attachments?.length ?? 0,
            (index) => InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return Scaffold(
                      backgroundColor: Colors.black.withOpacity(0),
                      body: Stack(
                        children: [
                          PhotoView(
                            imageProvider: CachedNetworkImageProvider(state.ektpDetailResponse?.response?.data?.item?.attachments?[index].url ?? "",
                                cacheKey: state.ektpDetailResponse?.response?.data?.item?.attachments?[index].id.toString()),
                            minScale: PhotoViewComputedScale.contained * 0.8,
                            // Covered = the smallest possible size to fit the whole screen
                            maxScale: PhotoViewComputedScale.covered * 2,
                            enableRotation: true,
                            // Set the background color to the "classic white"
                            backgroundDecoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                            ),
                            loadingBuilder: (context, event) => Center(
                              child: Container(
                                width: 20.0,
                                height: 20.0,
                                child: CircularProgressIndicator(
                                  value: event == null ? 0 : event.cumulativeBytesLoaded / 0.5,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 16,
                            left: 12,
                            right: 12,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    context.router.pop();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ).horizontalPadded(),
                                Expanded(
                                    child: Text14WhiteRegular(
                                  state.ektpDetailResponse?.response?.data?.item?.attachments?[index].type ?? "",
                                  overflow: TextOverflow.ellipsis,
                                )),
                                IconButton(
                                  onPressed: () {
                                    sl<EktpBloc>().add(DownloadImageKtp(imageUrl: state.ektpDetailResponse?.response?.data?.item?.attachments?[index].url));
                                  },
                                  icon: Icon(
                                    Icons.download,
                                    color: Colors.white,
                                  ),
                                ).horizontalPadded(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      // color: Colors.red,
                      child: CachedNetworkImage(
                        cacheKey: state.ektpDetailResponse?.response?.data?.item?.attachments?[index].id.toString(),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.width / 4,
                        imageUrl: state.ektpDetailResponse?.response?.data?.item?.attachments?[index].url ?? "",
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.white,
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          getSourceByPng('ic_blank_n'),
                        ),
                      ),
                    ),
                  ).padded(8),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: Text12GreyDefaultRegular(state.ektpDetailResponse?.response?.data?.item?.attachments?[index].type?.replaceAll('file_', '').replaceAll('_', '-').toUpperCase() ?? "")
                          .horizontalPadded(8)),
                ],
              ),
            ),
          )),
        ],
      ).padded(8),
    ).padded(8);
  }
}
