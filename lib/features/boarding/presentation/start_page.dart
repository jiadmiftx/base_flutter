import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pgn_mobile/core/config/bloc/config_bloc.dart';
import 'package:pgn_mobile/core/core.dart';
import 'package:pgn_mobile/core/resource/injector/injection_container.dart';
import 'package:pgn_mobile/core/utils/extensions/widget_util.dart';
import 'package:pgn_mobile/generated/l10n.dart';

@RoutePage()
class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  // String lang = LangConfig.instance.langValue;
  bool selectedLang = true;

  @override
  Widget build(BuildContext context) {
    return Loadable(
      child: Stack(
        children: [
          Image.asset(
            getSourceByJpg('language-bg'),
            fit: BoxFit.fitWidth,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            decoration: BoxDecoration(
              color: BaseColor.primaryColor.withOpacity(0.8),
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: LeftAlignedColumn(
                children: [
                  CenterAlignedColumn(children: [
                    Image.asset(
                      getSourceByPng('ic_mothercare_white'),
                      fit: BoxFit.fitWidth,
                      height: 40,
                    ).bottomPadded(100),
                    Text22WhiteBold(S.of(context).pick_language),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: selectedLang ? Colors.white : Colors.transparent,
                            side: BorderSide(color: Colors.white, width: 1),
                          ),
                          onPressed: () {
                            setState(() {
                              sl<ConfigBloc>().add(ChangeLanguageEvent(newLocal: 'id'));
                              selectedLang = true;
                            });
                          },
                          child: selectedLang ? Text14BlackMedium("Bahasa Indonesia").padded(8) : Text14WhiteMedium("Bahasa Indonesia").padded(8)),
                    ).paddedLTRB(left: 24, right: 24, top: 32, bottom: 8),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: !selectedLang ? Colors.white : Colors.transparent,
                            side: BorderSide(color: Colors.white, width: 1),
                          ),
                          onPressed: () {
                            setState(() {
                              sl<ConfigBloc>().add(ChangeLanguageEvent(newLocal: 'en'));
                              selectedLang = false;
                            });
                          },
                          child: !selectedLang ? Text14BlackMedium("English").padded(8) : Text14WhiteMedium("English").padded(8)),
                    ).paddedLTRB(left: 24, right: 24, top: 8, bottom: 16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            disabledForegroundColor: Colors.white,
                            backgroundColor: BaseColor.primaryColor,
                          ),
                          onPressed: () {
                            context.router.push(BoardingPageRoute());
                          },
                          child: Text14WhiteMedium(S.of(context).start_here).padded(8)),
                    ).paddedLTRB(left: 24, right: 24, top: 36, bottom: 46)
                  ])
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
