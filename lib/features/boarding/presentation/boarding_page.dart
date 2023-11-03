import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:pgn_mobile/core/utils/extensions/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:pgn_mobile/core/core.dart';

@RoutePage()
class BoardingPage extends StatefulWidget {
  const BoardingPage({super.key});

  @override
  State<BoardingPage> createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Loadable(
      extendBodyBehindAppBar: true,
      appBar: BackAppBar(
        context,
        '',
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            getSourceByJpg('signup-bg'),
            fit: BoxFit.fitWidth,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            decoration: BoxDecoration(
              color: BaseColor.primaryColor.withOpacity(0.8),
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CenterAlignedColumn(children: [
              Image.asset(
                getSourceByPng('ic_mothercare_white'),
                fit: BoxFit.fitHeight,
                height: 40,
              ).topPadded().bottomPadded(100),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      disabledForegroundColor: BaseColor.grey,
                      backgroundColor: BaseColor.primaryColor.withOpacity(0.8),
                    ),
                    onPressed: () {
                      context.router.push(LoginPageRoute());
                    },
                    child: Text14WhiteRegular("Masuk menggunakan nomor email").padded(8)),
              ).paddedLTRB(left: 24, right: 24, top: 32, bottom: 8),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      disabledForegroundColor: BaseColor.grey,
                      backgroundColor: BaseColor.colorSecondary.withOpacity(0.7),
                    ),
                    onPressed: () {
                      context.router.push(LoginPageRoute());
                    },
                    child: Text14WhiteRegular("Masuk menggunakan nomor ponsel").padded(8)),
              ).paddedLTRB(left: 24, right: 24, top: 15, bottom: 8),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: BaseColor.primaryColor,
                      disabledForegroundColor: BaseColor.grey,
                      backgroundColor: Colors.white,
                      side: BorderSide(color: BaseColor.primaryColor, width: 1),
                    ),
                    onPressed: () {
                      context.router.push(HomePageRoute());
                    },
                    child: Text14BluePrimaryRegular("Masuk Sebagai Tamu").padded(8)),
              ).paddedLTRB(left: 24, right: 24, top: 15, bottom: 16),
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
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Syarat & Ketentuan',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: BaseColor.yellow14A,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ).padded().horizontalPadded().topPadded(100),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Versi',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
