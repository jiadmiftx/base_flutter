import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pgn_mobile/features/login/bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:pgn_mobile/core/core.dart';
import 'package:pgn_mobile/core/utils/extensions/widget_util.dart';

@RoutePage()
class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _emailCtrl = TextEditingController();

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      builder: (BuildContext context, LoginState state) {
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
                      getSourceByPng('base_icon'),
                      height: 36,
                    ).padded(24),
                    Text18BlueLightestSemiBold(
                      'Reset Kata sandi',
                    ).horizontalPadded(24),
                    Text14Black414Medium(
                      'Langkah Reset Kata sandi:',
                    ).horizontalPadded(24),
                    Text12BlackRegular(
                      '1. Isilah alamat email yang terdaftar pada akun Anda di kolom email.',
                    ).horizontalPadded(24),
                    Text12BlackRegular(
                      '2. Setelah itu, klik tombol "Kirim Link Reset Kata sandi" untuk memproses permintaan reset password Anda.',
                    ).horizontalPadded(24),
                    Text12BlackRegular(
                      '3. Kami akan mengirimkan tautan reset password ke alamat email dan Whatsapp Anda. Pastikan untuk memeriksa folder Spam jika Anda tidak menerima email dalam beberapa menit.',
                    ).horizontalPadded(24),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {},
                      controller: _emailCtrl,
                      validator: (value) {
                        if ((value ?? '').isEmpty) {
                          return 'Wajib diisi';
                        } else if (!EmailValidator.validate(value ?? '')) {
                          return 'Masukkan alamat email yang valid (cth: johndoe@mail.com)';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                          isDense: true,
                          hintText: "Masukkan alamat email yang terdaftar",
                          focusColor: Colors.white,
                          prefixIconConstraints: BoxConstraints(maxWidth: 40, minWidth: 25),
                          prefixIcon: Icon(Icons.email_outlined)),
                    ).paddedLTRB(left: 24, right: 24, top: 32, bottom: 8),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          disabledForegroundColor: BaseColor.grey,
                          backgroundColor: BaseColor.primaryColor,
                        ),
                        onPressed: () async {
                          if (_form.currentState!.validate()) {}
                        },
                        child: Text14WhiteRegular("Kirim Link Reset Kata sandi").padded(8),
                      ),
                    ).paddedLTRB(left: 24, right: 24, top: 32, bottom: 8),
                  ],
                ),
              ),
            ),
          ),
          loading: state.isLoading,
        );
      },
      listener: (BuildContext context, LoginState state) {},
    );
  }

  Future<Map<String, dynamic>> get emailReset async {
    return {
      "email": _emailCtrl.text,
    };
  }
}
