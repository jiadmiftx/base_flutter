import 'package:auto_route/auto_route.dart';
import 'package:mothercare_mobile/core/config/helpers/lang_config.dart';
import 'package:mothercare_mobile/core/config/model/language_response.dart';
import 'package:flutter/material.dart';
import 'package:mothercare_mobile/core/core.dart';
import 'package:mothercare_mobile/core/utils/extensions/widget_util.dart';
import 'package:mothercare_mobile/generated/l10n.dart';

class LanguageDialog extends StatefulWidget {
  final String lang;
  final Function(DataLanguage?) callback;
  const LanguageDialog({
    super.key,
    required this.lang,
    required this.callback,
  });

  @override
  State<LanguageDialog> createState() => LanguageDialogState();
}

class LanguageDialogState extends State<LanguageDialog> {
  DataLanguage? _onDataCheck;
  List<DataLanguage> data = [
    const DataLanguage(code: 'id', name: 'Bahasa Indonesia', sort: 1),
    const DataLanguage(code: 'en', name: 'English', sort: 2),
  ];

  Future<void> setSelectedLang() async {
    try {
      _onDataCheck ??= data.singleWhere((element) => element.code == widget.lang);
    } catch (e) {
      _onDataCheck = DataLanguage(code: LangConfig.instance.langValue);
    }
  }

  @override
  void initState() {
    setSelectedLang();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomDrawer(
      child: LeftAlignedColumn(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (BuildContext ctx, int idx) => InkWell(
                    onTap: () => setState(() => _onDataCheck = data[idx]),
                    child: LeftAlignedColumn(
                      children: [
                        LeftAlignedRow(
                          children: [
                            Expanded(
                              child: Text14BlackRegular(data[idx].name ?? ''),
                            ),
                            (data[idx].code ?? '') == (_onDataCheck?.code ?? '') ? const Icon(Icons.check).rightPadded16() : const SizedBox()
                          ],
                        ).verticalPadded(10),
                        const Divider()
                      ],
                    ),
                  )),
          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(0),
              ),
              foregroundColor: Colors.black,
              disabledForegroundColor: Colors.grey,
              backgroundColor: Colors.black,
            ),
            onPressed: () => context.router.pop().then((_) => widget.callback(_onDataCheck)),
            child: SizedBox(
              width: double.infinity,
              child: Text14WhiteSemiBold(
                "Simpan",
                alignment: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
