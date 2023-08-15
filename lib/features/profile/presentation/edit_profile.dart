import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:mothercare_mobile/core/resource/models/region_base_model.dart';
import 'package:mothercare_mobile/core/widgets/copyritght.dart';
import 'package:mothercare_mobile/features/ektp/ektp.dart';
import 'package:mothercare_mobile/features/profile/bloc/profile_bloc.dart';
import 'package:mothercare_mobile/features/profile/model/user_profile_response.dart';
import 'package:email_validator/email_validator.dart';

@RoutePage()
class EditProfilePage extends StatefulWidget {
  final ItemProfile profile;

  const EditProfilePage({super.key, required this.profile});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _kkCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _numberCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final TextEditingController _retypePasswordCtrl = TextEditingController();
  final TextEditingController _genderCtrl = TextEditingController();
  final TextEditingController _provinceCtrl = TextEditingController();
  final TextEditingController _kabupatenCtrl = TextEditingController();
  final TextEditingController _kecamatanCtrl = TextEditingController();
  final TextEditingController _desaCtrl = TextEditingController();
  final TextEditingController _addressCtrl = TextEditingController();
  final TextEditingController _nikCtrl = TextEditingController();
  final TextEditingController _otpCtrl = TextEditingController();
  final TextEditingController _typeVerifCtrl = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool _cpasswordVisible = false;

  final _filePasFoto = TextEditingController();

  bool _firstLoad = true;
  bool _hitDistrict = true;
  bool _selectDistrict = true;
  bool _hitSubDistrict = true;
  bool _selectSubDistrict = true;
  bool _hitVillage = true;
  bool _selectVillage = true;

  XFile? fileFoto;

  Timer? timer;

  RegionModel? selectedProv;

  @override
  void initState() {
    sl<ProfileBloc>().add(DataProfileGetProvince());

    final dataProfile = widget.profile;
    _nameCtrl.text = dataProfile.nama ?? "";
    _nikCtrl.text = dataProfile.nik ?? "";
    _kkCtrl.text = dataProfile.noKk ?? "";
    _genderCtrl.text = dataProfile.jenisKelamin ?? "L";
    _emailCtrl.text = dataProfile.email ?? "";
    _numberCtrl.text = dataProfile.noHp ?? "";
    _provinceCtrl.text = dataProfile.provinsi?.nama ?? "";
    _kabupatenCtrl.text = dataProfile.kabupaten?.nama ?? "";
    _kecamatanCtrl.text = dataProfile.kecamatan?.nama ?? "";
    _desaCtrl.text = dataProfile.desa?.nama ?? "";
    _addressCtrl.text = dataProfile.alamat ?? "";
    final dataReq = sl<ProfileBloc>().state.userProfileResponse?.response;
    sl<ProfileBloc>().add(DataProfileGetDistrict(provinceCode: dataReq?.data?.item?.provinsi?.kode.toString()));
    sl<ProfileBloc>().add(DataProfileSubGetDistrict(districtCode: dataReq?.data?.item?.kabupaten?.kode.toString()));
    sl<ProfileBloc>().add(DataProfileGetVillage(subDistrictCode: dataReq?.data?.item?.kecamatan?.kode.toString()));

    sl<ProfileBloc>().state.selectedProvince = dataReq?.data?.item?.provinsi;
    sl<ProfileBloc>().state.selectedDistrict = dataReq?.data?.item?.kabupaten;
    sl<ProfileBloc>().state.selectedSubDistrict = dataReq?.data?.item?.kecamatan;
    sl<ProfileBloc>().state.selectedVillage = dataReq?.data?.item?.desa;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
            // Image size is within the limit, use it as is
            pickedImage = pickedFile;
            _filePasFoto.text = pickedFile.name.split("-").last;
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

  List<String> listStirng = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        return Loadable(
          extendBodyBehindAppBar: true,
          appBar: BackAppBar(
            context,
            'Edit Profile',
            backgroundColor: BaseColor.primaryColor,
            elevation: 0.0,
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _form,
                child: LeftAlignedColumn(
                  children: [
                    CenterAlignedColumn(
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
                                      ).padded(8),
                                    );
                                  } else {
                                    return SizedBox(
                                      height: 100,
                                    );
                                  }
                                },
                              ).topPadded(32)
                            : Container(
                                width: 100, // Adjust the width as needed
                                height: 100, // Adjust the height as needed
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey, width: 2), // Optional: Add a border
                                ),
                                child: ClipOval(
                                  child: Container(
                                    // color: Colors.red,
                                    child: CachedNetworkImage(
                                      cacheKey: "${state.userProfileResponse?.response?.data?.item?.foto}${DateTime.now()}",
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width / 4,
                                      height: MediaQuery.of(context).size.width / 4,
                                      imageUrl: state.userProfileResponse?.response?.data?.item?.foto ?? "",
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
                              ).topPadded(32),
                        InkWell(
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
                          textInputType: TextInputType.text,
                        ).paddedLTRB(left: 24, right: 24, top: 32, bottom: 8),
                        Visibility(
                          visible: (state.userProfileResponse?.response?.data?.item?.roles?.first.name ?? "") == "MASYARAKAT",
                          child: TextFieldWidget(
                            enable: (state.userProfileResponse?.response?.data?.item?.roles?.first.name ?? "") != "MASYARAKAT",
                            maxLenght: 16,
                            controller: _kkCtrl,
                            hintText: "Nomor KK",
                            inputFormatters: [],
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
                          ).paddedLTRB(left: 24, right: 24, top: 16, bottom: 4),
                        ),
                        Visibility(
                          visible: (state.userProfileResponse?.response?.data?.item?.roles?.first.name ?? "") == "MASYARAKAT",
                          child: TextFieldWidget(
                            controller: _nikCtrl,
                            hintText: "NIK",
                            maxLenght: 16,
                            inputFormatters: [],
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
                          ).paddedLTRB(left: 24, right: 24, top: 4, bottom: 4),
                        ),
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
                        TextFieldWidget(
                          controller: _emailCtrl,
                          hintText: "Email",
                          validator: (value) {
                            if ((value ?? '').isEmpty) {
                              return 'Wajib diisi';
                            } else if (!EmailValidator.validate(value ?? '')) {
                              return 'Masukkan alamat email yang valid (cth: johndoe@mail.com)';
                            } else {
                              return null;
                            }
                          },
                          textInputType: TextInputType.emailAddress,
                        ).paddedLTRB(left: 24, right: 24, top: 15, bottom: 8),
                        TextFieldWidget(
                          controller: _numberCtrl,
                          hintText: "Nomor Handphone",
                          maxLenght: 12,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                            FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                            FilteringTextInputFormatter.deny(RegExp(r'^62+')),
                          ],
                          validator: (value) {
                            if ((value ?? '').isEmpty) {
                              return 'No. Hp Wajib diisi';
                            } else if (value!.length <= 8 || (value.characters.first != '8')) {
                              return 'Masukkan nomor telepon yang dimulai dengan angka 8 dan \nharus terdiri dari 9 hingga 12 digit dan valid.';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Text16BlackRegular('+62').padded(11),
                          textInputType: TextInputType.phone,
                        ).paddedLTRB(left: 24, right: 24, top: 15, bottom: 8),
                        Visibility(
                          visible: state.userProfileResponse?.response?.data?.item?.roles?.first.name == "MASYARAKAT",
                          child: CenterAlignedColumn(children: [
                            GenericSpinnerForm<RegionModel>(
                              onTap: () {
                                // if(state.listProvince == null) sl<ProfileBloc>().add(DataGetProvince());
                              },
                              callback: (s) {
                                setState(() {
                                  state.selectedProvince = s;
                                  _provinceCtrl.text = s?.nama ?? "";
                                  log("Porivnce id $s");
                                  state.selectedDistrict = null;
                                  state.selectedSubDistrict = null;
                                  state.selectedVillage = null;
                                  sl<ProfileBloc>().add(DataProfileGetDistrict(provinceCode: s?.kode));
                                });
                              },
                              items: infoItemProvincesToDropdown(state.listProvince),
                              hintText: 'Pilih Provinsi',
                              value: state.selectedProvince,
                            ).paddedLTRB(left: 24, right: 24, top: 15, bottom: 8),
                            GenericSpinnerForm<RegionModel>(
                              onTap: () {},
                              callback: (s) {
                                setState(() {
                                  state.selectedDistrict = s;
                                  _kabupatenCtrl.text = s?.nama ?? "";
                                  state.selectedSubDistrict = null;
                                  state.selectedVillage = null;
                                  sl<ProfileBloc>().add(DataProfileSubGetDistrict(districtCode: s?.kode));
                                });
                              },
                              items: infoItemDistrictToDropdown(state.listDistrict),
                              hintText: 'Pilih Kabupaten',
                              value: state.selectedDistrict,
                            ).paddedLTRB(left: 24, right: 24, top: 15, bottom: 8),
                            GenericSpinnerForm<RegionModel>(
                              onTap: () {},
                              callback: (s) {
                                setState(() {
                                  state.selectedSubDistrict = s;
                                  _kecamatanCtrl.text = s?.nama ?? "";
                                  state.selectedVillage = null;
                                  sl<ProfileBloc>().add(DataProfileGetVillage(subDistrictCode: s?.kode));
                                });
                              },
                              items: infoItemSubDistrictToDropdown(state.listSubDistrict),
                              hintText: 'Pilih Kecamatan',
                              value: state.selectedSubDistrict,
                            ).paddedLTRB(left: 24, right: 24, top: 15, bottom: 8),
                            GenericSpinnerForm<RegionModel>(
                              onTap: () {},
                              callback: (s) {
                                setState(() {
                                  state.selectedVillage = s;
                                  _desaCtrl.text = s?.nama ?? "";
                                });
                              },
                              items: infoItemVillageToDropdown(state.listVillage),
                              hintText: 'Pilih Desa',
                              value: state.selectedVillage,
                            ).paddedLTRB(left: 24, right: 24, top: 15, bottom: 8),
                          ]),
                        ),
                        TextFieldWidget(
                          maxlines: 4,
                          controller: _addressCtrl,
                          hintText: "Alamat Lengkap",
                          textInputType: TextInputType.multiline,
                        ).paddedLTRB(left: 24, right: 24, top: 15, bottom: 8),
                      ],
                    ).bottomPadded(20),
                    Divider(
                      thickness: 12,
                    ),
                    Text(
                      'Ubah Kata sandi',
                      style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ).horizontalPadded(24).topPadded(),
                    TextFieldWidget(
                      controller: _passwordCtrl,
                      hintText: "Kata sandi",
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      validator: (value) {
                        return null;
                      },
                      obscuretext: !_passwordVisible,
                      textInputType: TextInputType.visiblePassword,
                    ).paddedLTRB(left: 24, right: 24, top: 15, bottom: 8),
                    TextFieldWidget(
                      controller: _retypePasswordCtrl,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _cpasswordVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            _cpasswordVisible = !_cpasswordVisible;
                          });
                        },
                      ),
                      hintText: "Ulangi kata sandi",
                      validator: (value) {
                        if ((value ?? '').isEmpty) {
                          return null;
                        } else if (value != _passwordCtrl.text) {
                          return 'Konfirmasi kata sandi tidak sama';
                        } else {
                          return null;
                        }
                      },
                      obscuretext: !_cpasswordVisible,
                      textInputType: TextInputType.visiblePassword,
                    ).paddedLTRB(left: 24, right: 24, top: 15, bottom: 8),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          disabledForegroundColor: BaseColor.grey,
                          backgroundColor: BaseColor.primaryColor,
                        ),
                        onPressed: () async {
                          if (_form.currentState!.validate()) {
                            sl<ProfileBloc>().add(DataUpdateUserEvent(updateProfileRequest: FormData.fromMap(await updateData)));
                          }
                        },
                        child: Text14WhiteRegular("Simpan").padded(8),
                      ),
                    ).paddedLTRB(left: 24, right: 24, top: 8, bottom: 15),
                    Center(child: buildCopyright().bottomPadded(64).topPadded())
                  ],
                ),
              ),
            ),
          ),
          loading: state.isLoading,
        );
      },
      listener: (BuildContext context, ProfileState state) {
        // log("user profile response ${state.userProfileResponse?.statusCode}");
        // log("user profile response ${state.userProfileResponse?.response?.data}");
        // log("user profile response ${state.userProfileResponse?.response?.message}");
        // log("user profile error ${state.userProfileResponse?.errorMessage}");
        if (state.updateProfileResponse?.statusCode == 200 && state.updateProfileResponse?.response != null) {
          context.router.pop();
          sl<ProfileBloc>().add(DataProfileEvent());
          showSuccess(context, state.updateProfileResponse?.response?.message ?? "", 4);
        }

        if (_firstLoad) {}
      },
    );
  }

  Future<Map<String, dynamic>> get updateData async {
    return {
      "nik": _nikCtrl.text != '' ? int.parse(_nikCtrl.text) : "0",
      "no_kk": _kkCtrl.text != '' ? int.parse(_kkCtrl.text) : "0",
      "nama": _nameCtrl.text,
      "jenis_kelamin": _genderCtrl.text,
      "no_hp": _numberCtrl.text != '' ? int.parse(_numberCtrl.text) : "810000000000",
      "provinsi": _provinceCtrl.text,
      "kabupaten": _kabupatenCtrl.text,
      "kecamatan": _kecamatanCtrl.text,
      "desa": _desaCtrl.text,
      "email": _emailCtrl.text,
      "password": _passwordCtrl.text,
      "alamat": _addressCtrl.text,
      "password_confirmation": _retypePasswordCtrl.text,
      "file_photo": pickedImage != null ? await MultipartFile.fromFile(pickedImage?.path ?? "", filename: pickedImage?.name.split("/").last, contentType: MediaType.parse("image/jpeg")) : "",
    };
  }

  // list helper
  infoItemProvincesToDropdown(List<RegionModel>? items) => items?.map((o) => DropdownMenuItem(value: o, child: Text14BlackRegular(o.nama ?? ''))).toList() ?? [];
  infoItemDistrictToDropdown(List<RegionModel>? items) => items?.map((o) => DropdownMenuItem(value: o, child: Text14BlackRegular(o.nama ?? ''))).toList() ?? [];
  infoItemSubDistrictToDropdown(List<RegionModel>? items) => items?.map((o) => DropdownMenuItem(value: o, child: Text14BlackRegular(o.nama ?? ''))).toList() ?? [];
  infoItemVillageToDropdown(List<RegionModel>? items) => items?.map((o) => DropdownMenuItem(value: o, child: Text14BlackRegular(o.nama ?? ''))).toList() ?? [];
}
