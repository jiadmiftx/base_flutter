import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:pgn_mobile/core/utils/toast/toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pgn_mobile/features/login/bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:pgn_mobile/core/core.dart';
import 'package:pgn_mobile/core/utils/extensions/widget_util.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailCtrl = TextEditingController(text: kDebugMode ? '' : null);

  final TextEditingController _passCtrl = TextEditingController(text: kDebugMode ? '' : null);

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
          child: Stack(
            children: [
              Image.asset(
                getSourceByJpg('login-bg'),
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height,
              ),
              Container(
                decoration: BoxDecoration(
                  color: BaseColor.primaryColor.withOpacity(0.8),
                ),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
              SafeArea(
                child: SingleChildScrollView(
                  child: Form(
                    key: _form,
                    child: LeftAlignedColumn(
                      children: [
                        Text(
                          'Hai!',
                          style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ).horizontalPadded(24).topPadded().bottomPadded(60),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {},
                          controller: _emailCtrl,
                          style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
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
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            errorStyle: TextStyle(fontSize: 12, color: Colors.red, fontWeight: FontWeight.normal),
                            contentPadding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                            isDense: true,
                            hintText: "Masukkan alamat email yang terdaftar",
                            focusColor: Colors.white,
                          ),
                        ).paddedLTRB(left: 24, right: 24, top: 0, bottom: 8),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (value) {},
                          controller: _passCtrl,
                          style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                          validator: (value) {
                            if ((value ?? '').isEmpty) {
                              return 'Wajib diisi';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            contentPadding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                            isDense: true,
                            hintText: "Masukkan kata sandi Anda",
                            focusColor: Colors.white,
                          ),
                          obscureText: !_passwordVisible,
                        ).paddedLTRB(left: 24, right: 24, top: 0, bottom: 8),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              disabledForegroundColor: BaseColor.grey,
                              backgroundColor: BaseColor.primaryColor,
                            ),
                            onPressed: () {
                              if (_form.currentState!.validate()) {
                                context.read<LoginBloc>().add(
                                      DataLoginEvent(
                                        email: _emailCtrl.text,
                                        password: _passCtrl.text,
                                      ),
                                    );
                              }
                            },
                            child: Text14WhiteRegular("Masuk").padded(8),
                          ),
                        ).paddedLTRB(left: 24, right: 24, top: 32, bottom: 8),
                        Center(
                          child: InkWell(
                            onTap: () {
                              // context.router.push(ResetPasswordPageRoute());
                            },
                            child: Text(
                              'Lupa Kata sandi?',
                              style: TextStyle(fontSize: 16, color: BaseColor.colorYellow, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ).padded().topPadded(),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: BaseColor.colorGreyInactive),
                            children: <TextSpan>[
                              TextSpan(text: "Belum pernah berbelanja di Mothercare?"),
                              TextSpan(
                                text: ' Daftar',
                                style: TextStyle(fontWeight: FontWeight.normal, color: BaseColor.yellow14A),
                                recognizer: TapGestureRecognizer()..onTap = () {},
                              ),
                            ],
                          ),
                        ).padded().horizontalPadded(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          loading: state.isLoading,
        );
      },
      listener: (BuildContext context, LoginState state) {
        if (state.loginResponse != null && state.errorMessage == '' && !state.isLoading) {
          context.router.replaceAll([MainPageRoute()]);
          showSuccess(context, "Selamat datang di BAKSO Dukcapil LOTIM 😎", 4);
        } else if (state.errorMessage != '') {
          showError(context, state.errorMessage);
        }
      },
    );
  }
}
