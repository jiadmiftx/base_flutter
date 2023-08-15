import 'dart:async';
import 'dart:developer';
import 'package:mothercare_mobile/core/helpers/date/time.dart';
import 'package:mothercare_mobile/core/resource/models/region_base_model.dart';
import 'package:mothercare_mobile/features/ektp/ektp.dart';
import 'package:email_validator/email_validator.dart';
import 'package:mothercare_mobile/features/register/bloc/register_bloc.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
  final TextEditingController _addressCtrl = TextEditingController();
  final TextEditingController _desaCtrl = TextEditingController();
  final TextEditingController _nikCtrl = TextEditingController();
  final TextEditingController _otpCtrl = TextEditingController();
  final TextEditingController _typeVerifCtrl = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool _cpasswordVisible = false;

  final _filePasFoto = TextEditingController();

  bool isOtpForm = false;

  XFile? fileFoto;

  int _countdownDuration = 0;
  Timer? timer;

  @override
  void initState() {
    sl<RegisterBloc>().add(DataGetProvince());
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _countdownDuration = 60;
    if (timer?.isActive ?? false) {
      timer?.cancel();
      _onStartingTimeCountDown();
    } else {
      _onStartingTimeCountDown();
    }
  }

  void _onStartingTimeCountDown() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_countdownDuration == 0) {
          timer.cancel();
        } else {
          setState(() => _countdownDuration--);
        }
      },
    );
  }

  List<String> listStirng = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      builder: (BuildContext context, RegisterState state) {
        return Loadable(
          extendBodyBehindAppBar: true,
          appBar: BackAppBar(
            context,
            '',
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _form,
                child: LeftAlignedColumn(
                  children: [
                    Image.asset(
                      getSourceByPng('ic_bakso_black'),
                      height: 36,
                    ).padded(24),
                    Text18BlueLightestSemiBold(
                      'Hai, Selamat Datang',
                    ).horizontalPadded(24),
                    Text16BlackRegular(
                      isOtpForm ? 'Kami telah mengirimkan kode OTP ke email kamu(cek inbox/spam) dan Whatsapp' : 'Silahkan mendaftar untuk membuat akun baru.',
                      maxLines: 3,
                    ).horizontalPadded(24),
                    isOtpForm
                        ? LeftAlignedColumn(children: [
                            TextFieldWidget(
                              controller: _otpCtrl,
                              hintText: "Kode OTP Verifikasi",
                              validator: (value) {
                                return null;
                              },
                              textInputType: TextInputType.number,
                            ).paddedLTRB(left: 24, right: 24, top: 32, bottom: 8),
                            _countdownDuration != 0
                                ? Text14GreyRegular(
                                    "Kirim Ulang Kode OTP/Verifikasi: ${timeHelper.intToTimeLeft(_countdownDuration)}",
                                  ).padded(24)
                                : LeftAlignedColumn(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          setState(() {
                                            _startTimer();
                                            _typeVerifCtrl.text = 'email';
                                          });
                                          sl<RegisterBloc>().add(DataResendOtpEvent(resendOtpRequest: FormData.fromMap(await resendOtpData)));
                                        },
                                        child: LeftAlignedRow(children: [
                                          Icon(
                                            Icons.email_outlined,
                                            color: BaseColor.blue8BD,
                                          ),
                                          Text12BlueRegular("Kirim verifikasi via Email").padded(8)
                                        ]),
                                      ),
                                      Divider(),
                                      InkWell(
                                        onTap: () async {
                                          setState(() {
                                            _startTimer();
                                            _typeVerifCtrl.text = 'wa';
                                          });
                                          sl<RegisterBloc>().add(DataResendOtpEvent(resendOtpRequest: FormData.fromMap(await resendOtpData)));
                                        },
                                        child: LeftAlignedRow(
                                          children: [
                                            Icon(
                                              Icons.chat_outlined,
                                              color: BaseColor.blue8BD,
                                            ),
                                            Text12BlueRegular("Kirim Ulang OTP Whatsapp").padded(8),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ).padded(24)
                          ])
                        : CenterAlignedColumn(
                            children: [
                              ImageProfileCameraWidget<XFile>(
                                controller: _filePasFoto,
                                hintText: "",
                                onChanged: (file) {
                                  log("FOTO NI BOSSS🔫___ ${file.name}");
                                  setState(() {
                                    fileFoto = file;
                                  });
                                },
                              ),
                              TextFieldWidget(
                                enable: !isOtpForm,
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
                              TextFieldWidget(
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
                              ).paddedLTRB(left: 24, right: 24, top: 15, bottom: 8),
                              TextFieldWidget(
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
                              ).paddedLTRB(left: 24, right: 24, top: 15, bottom: 8),
                              GenericSpinnerForm<String>(
                                onTap: () {},
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
                              GenericSpinnerForm<RegionModel>(
                                onTap: () {
                                  // if(state.listProvince == null) sl<RegisterBloc>().add(DataGetProvince());
                                },
                                callback: (s) {
                                  setState(() {
                                    state.selectedProvince = s;
                                    _provinceCtrl.text = s?.nama ?? "";
                                    state.selectedDistrict = null;
                                    state.selectedSubDistrict = null;
                                    state.selectedVillage = null;
                                    sl<RegisterBloc>().add(DataGetDistrict(provinceCode: s?.kode));
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
                                    sl<RegisterBloc>().add(DataSubGetDistrict(districtCode: s?.kode));
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
                                    sl<RegisterBloc>().add(DataGetVillage(subDistrictCode: s?.kode));
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
                              TextFieldWidget(
                                maxlines: 4,
                                controller: _addressCtrl,
                                hintText: "Alamat Lengkap",
                                textInputType: TextInputType.multiline,
                              ).paddedLTRB(left: 24, right: 24, top: 15, bottom: 8),
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
                                    return 'Wajib diisi';
                                  } else if (value != _passwordCtrl.text) {
                                    return 'Konfirmasi password tidak sama';
                                  } else {
                                    return null;
                                  }
                                },
                                obscuretext: !_cpasswordVisible,
                                textInputType: TextInputType.visiblePassword,
                              ).paddedLTRB(left: 24, right: 24, top: 15, bottom: 8),
                            ],
                          ).bottomPadded(20),
                    Text(
                      '⚠️ PASTIKAN SEMUA DATA ANDA SUDAH BENAR SEBELUM MENDAFTAR',
                      style: TextStyle(fontSize: 11, color: BaseColor.yellow14A, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,
                    ).horizontalPadded(24),
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
                            sl<RegisterBloc>().add(DataRegisterUserEvent(registerUserRequest: FormData.fromMap(await registerData)));
                          }
                        },
                        child: Text14WhiteRegular(isOtpForm ? "Verifikasi" : "Daftar").padded(8),
                      ),
                    ).paddedLTRB(left: 24, right: 24, top: 8, bottom: 15),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text16BlackRegular('Sudah punya akun?'),
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              context.router.push(LoginPageRoute());
                            },
                            child: Text16BlackSemiBold('Masuk disini'),
                          )
                        ],
                      ),
                    ).bottomPadded(24),
                  ],
                ),
              ),
            ),
          ),
          loading: state.isLoading,
        );
      },
      listener: (BuildContext context, RegisterState state) {
        if (state.errorMessage == 'OK' && state.statusCode == 200) {
          context.router.replaceAll([LoginPageRoute()]);
          showSuccess(context, "Daftar berhasil, silahkan masuk menggunakan email yang baru saja Anda daftarkan", 7);
        } else if (state.errorMessage != '' && state.statusCode == 401) {
          context.router.replaceAll([LoginPageRoute()]);
          showSuccess(context, "${state.errorMessage}", 5);
        } else if (state.errorMessage != '' && state.statusCode == 403 && !isOtpForm) {
          setState(() {
            _startTimer();
            isOtpForm = true;
          });
          showWarning(context, "${state.errorMessage}", 5);
        } else if (state.errorMessage != '' && state.statusCode == 200 && isOtpForm) {
          showWarning(context, "${state.errorMessage}", 5);
        } else if (state.errorMessage != '' && state.statusCode == 422) {
          showError(context, "${state.errorMessage}", 5);
        } else if (state.errorMessage != '' && state.statusCode == 409) {
          _otpCtrl.clear();
          showError(context, "${state.errorMessage}", 5);
        }
      },
    );
  }

  Future<Map<String, dynamic>> get registerData async {
    return {
      if (isOtpForm) "kode_otp": _otpCtrl.text,
      "nik": int.parse(_nikCtrl.text),
      "no_kk": int.parse(_kkCtrl.text),
      "nama": _nameCtrl.text,
      "jenis_kelamin": _genderCtrl.text,
      "no_hp": int.parse(_numberCtrl.text),
      "provinsi": _provinceCtrl.text,
      "kabupaten": _kabupatenCtrl.text,
      "kecamatan": _kecamatanCtrl.text,
      "alamat": _addressCtrl.text,
      "desa": _desaCtrl.text,
      "email": _emailCtrl.text,
      "password": _passwordCtrl.text,
      "password_confirmation": _retypePasswordCtrl.text,
      "file_photo": fileFoto != null ? await MultipartFile.fromFile(fileFoto?.path ?? "", filename: fileFoto?.name.split("/").last, contentType: MediaType.parse("image/jpeg")) : "",
    };
  }

  Future<Map<String, dynamic>> get resendOtpData async {
    return {
      "no_hp": int.parse(_numberCtrl.text),
      "email": _emailCtrl.text,
      "metode_verifikasi": _typeVerifCtrl.text,
    };
  }

  // list helper
  infoItemProvincesToDropdown(List<RegionModel>? items) => items?.map((o) => DropdownMenuItem(value: o, child: Text14BlackRegular(o.nama ?? ''))).toList() ?? [];
  infoItemDistrictToDropdown(List<RegionModel>? items) => items?.map((o) => DropdownMenuItem(value: o, child: Text14BlackRegular(o.nama ?? ''))).toList() ?? [];
  infoItemSubDistrictToDropdown(List<RegionModel>? items) => items?.map((o) => DropdownMenuItem(value: o, child: Text14BlackRegular(o.nama ?? ''))).toList() ?? [];
  infoItemVillageToDropdown(List<RegionModel>? items) => items?.map((o) => DropdownMenuItem(value: o, child: Text14BlackRegular(o.nama ?? ''))).toList() ?? [];
}
