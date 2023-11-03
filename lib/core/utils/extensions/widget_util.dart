import 'dart:async';
import 'dart:developer';
import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:pgn_mobile/core/core.dart';
import 'package:pgn_mobile/core/helpers/secure_storage/storage_helper.dart';
import 'package:pgn_mobile/core/helpers/secure_storage/storage_key_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

Future<void> showSheet(BuildContext ctx, Widget sheet, {bool isControlled = true}) {
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    isDismissible: isControlled,
    builder: (ctx) => Padding(
      child: sheet,
      padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
    ),
    context: ctx,
    isScrollControlled: isControlled,
    enableDrag: isControlled,
  );
}

void showAlert(BuildContext ctx, {bool isControlled = true, required String text, required VoidCallback yes}) {
  showDialog<void>(
    context: ctx,
    barrierDismissible: isControlled,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text16BlackSemiBold(
          'Konfirmasi',
          alignment: TextAlign.left,
        ),
        content: Text14BlackRegular(text),
        actions: <Widget>[
          TextButton(
            child: Text14BlueBold('Batal'),
            onPressed: () {
              ctx.router.pop();
            },
          ),
          TextButton(
            child: Text14BlueBold('Hapus'),
            onPressed: yes,
          ),
        ],
      );
    },
  );
}

void showAlertNotifDetail(BuildContext ctx, {bool isControlled = true, required String textTitle, required String textDesc, required String date}) {
  showDialog<void>(
    context: ctx,
    barrierDismissible: isControlled,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text14BlueLightMedium(
          'Pemberitahuan',
          alignment: TextAlign.left,
        ),
        content: CenterAlignedColumn(
          children: [
            Text12Black87SemiBold(
              textTitle,
              alignment: TextAlign.left,
            ).bottomPadded(),
            Text12GreyDefaultRegular(
              textDesc,
              alignment: TextAlign.justify,
              maxLines: 112,
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: <Widget>[
          Text12BlackRegular(date).leftPadded(8),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              disabledForegroundColor: BaseColor.grey,
              backgroundColor: BaseColor.primaryColor,
            ),
            child: Text14WhiteMedium('Tutup'),
            onPressed: () {
              ctx.router.pop();
            },
          ),
        ],
      );
    },
  );
}

void showAlertLogout(BuildContext ctx, {bool isControlled = true, required String text, required VoidCallback yes}) {
  showDialog<void>(
    context: ctx,
    barrierDismissible: isControlled,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text16BlackSemiBold(
          'Konfirmasi',
          alignment: TextAlign.left,
        ),
        content: Text14BlackRegular(text),
        actions: <Widget>[
          TextButton(
            child: Text14BlueBold('Batal'),
            onPressed: () {
              ctx.router.pop();
            },
          ),
          TextButton(
            child: Text14BlueBold('Keluar'),
            onPressed: yes,
          ),
        ],
      );
    },
  );
}

void showAlertTermCondition(BuildContext ctx, {bool isControlled = true, required String text, required VoidCallback yes}) {
  showDialog<void>(
    context: ctx,
    barrierDismissible: isControlled,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.warning_amber_rounded,
              color: BaseColor.yellow14A,
            ).rightPadded10(),
            Text18BlackSemiBold(
              'PERHATIAN!!!',
              alignment: TextAlign.left,
            ),
          ],
        ),
        content: Row(
          children: [
            Checkbox(activeColor: BaseColor.colorSecondary, value: true, onChanged: (value) {}),
            Expanded(child: Text14BlackRegular("Saya menyatakan bahwa Data yang telah diisi merupakan tanggung jawab penuh dari Pemohon")),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: Text14BlueBold('Batal'),
            onPressed: () {
              ctx.router.pop();
            },
          ),
          TextButton(
            child: Text14BlueBold('Setuju, Ajukan'),
            onPressed: yes,
          ),
        ],
      );
    },
  );
}

void showPopUp(BuildContext context, bool value) {
  showDialog(
    context: context,
    anchorPoint: Offset(0.2, 0.2),
    builder: (BuildContext buildContext) {
      return StatefulBuilder(builder: (context, setStateDialog) {
        return AlertDialog(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: BaseColor.yellow14A,
              ).rightPadded10(),
              Text18BlackBold(
                'PERHATIAN!!!',
                alignment: TextAlign.left,
              ),
            ],
          ),
          content: LeftAlignedColumn(
            children: [
              // textUU
              Divider(),
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                child: SingleChildScrollView(
                  child: CenterAlignedColumn(children: [
                    Text12BlackRegular(
                      "textUU",
                      maxLines: 100,
                      alignment: TextAlign.justify,
                    ),
                    Text12Black87Bold(
                      "pasal77",
                      maxLines: 100,
                      alignment: TextAlign.center,
                    ).topPadded(),
                    Text12BlackItalic(
                      "pasal77desc",
                      maxLines: 100,
                      alignment: TextAlign.center,
                    ),
                    Text12Black87Bold(
                      "pasal94",
                      maxLines: 100,
                      alignment: TextAlign.center,
                    ).topPadded(),
                    Text12BlackItalic(
                      "pasal94desc",
                      maxLines: 100,
                      alignment: TextAlign.center,
                    ),
                  ]),
                ),
              ),
              Divider(),
              CheckboxListTile(
                contentPadding: EdgeInsets.only(right: 0),
                title: Text12BlackRegular("Ya, saya mengerti. Jangan tampilkan pesan ini lagi."),
                value: value,
                activeColor: BaseColor.greenE87,
                onChanged: (newValue) {
                  setStateDialog(() {
                    value = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    disabledForegroundColor: Colors.white,
                    backgroundColor: Colors.lightGreen[800],
                  ),
                  child: Text14WhiteMedium("Konfirmasi"),
                  onPressed: () async {
                    if (value) {
                      log("log value $value");
                      await storage.write(StorageKey.popUpUU, value.toString());
                    }
                    context.router.pop();
                  },
                ),
              ),
            ],
          ),
        );
      });
    },
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black.withOpacity(0.2),
  );
}

class BottomDrawer extends StatelessWidget {
  final Widget child;

  final bool withBack;

  const BottomDrawer({
    Key? key,
    required this.child,
    this.withBack = false,
  }) : super(key: key);

  @override
  Widget build(ctx) => withBack
      ? Column(
          children: [
            Padding(
              child: _backButton(ctx),
              padding: const EdgeInsets.all(8),
            ),
            _main(),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        )
      : _main();

  Widget _main() => Container(
        child: child,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Colors.white,
        ),
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      );

  Widget _backButton(BuildContext ctx) => ElevatedButton(
        child: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.of(ctx).pop(),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          shape: const CircleBorder(),
        ),
      );
}

Widget loader() => BackdropFilter(
      child: Container(
        child: Center(
          child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Colors.white,
              ),
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
              child: CircularProgressIndicator(
                color: Colors.black.withOpacity(0.5),
                strokeWidth: 2,
              )),
        ),
        color: Colors.grey[200]!.withOpacity(0.4),
      ),
      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
    );

class Loadable extends StatefulWidget {
  final Widget? action;

  final Function()? onRefresh;

  final RefreshController? refreshController;

  final PreferredSizeWidget? appBar;

  final Color? backgroundColor;

  final Widget? bottomNavigationBar;

  final Widget? bottomSheet;

  final Widget child;

  final Drawer? drawer;

  final Widget? extra;

  final Widget? floatingActionButton;

  final bool loading;

  final bool safeTop;

  final bool extendBodyBehindAppBar;

  const Loadable({
    Key? key,
    this.action,
    this.appBar,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.bottomSheet,
    required this.child,
    this.extra,
    this.floatingActionButton,
    this.loading = false,
    this.safeTop = true,
    this.extendBodyBehindAppBar = false,
    this.onRefresh,
    this.drawer,
    this.refreshController,
  }) : super(key: key);

  @override
  createState() => _State();
}

class _State extends State<Loadable> {
  @override
  Widget build(ctx) => widget.refreshController != null
      ? MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: SmartRefresher(
            controller: widget.refreshController ?? RefreshController(initialRefresh: false),
            enablePullUp: true,
            onRefresh: () {
              widget.refreshController?.refreshCompleted();
              widget.refreshController?.loadComplete();
              widget.onRefresh?.call();
            },
            child: Stack(
              fit: StackFit.expand,
              children: [
                Scaffold(
                  drawer: widget.drawer,
                  appBar: widget.appBar,
                  backgroundColor: widget.backgroundColor,
                  extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
                  body: Stack(
                    children: [
                      widget.child,
                      if (widget.extra != null) widget.extra!,
                      Align(child: widget.bottomSheet ?? const SizedBox(), alignment: Alignment.bottomCenter),
                    ],
                    fit: StackFit.expand,
                  ),
                  bottomNavigationBar: widget.bottomNavigationBar,
                  floatingActionButton: widget.floatingActionButton,
                ),
                if (widget.loading) loader(),
              ],
            ),
          ),
        )
      : MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Scaffold(
                drawer: widget.drawer,
                appBar: widget.appBar,
                backgroundColor: widget.backgroundColor,
                extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
                body: Stack(
                  children: [
                    widget.child,
                    if (widget.extra != null) widget.extra!,
                    Align(child: widget.bottomSheet ?? const SizedBox(), alignment: Alignment.bottomCenter),
                  ],
                  fit: StackFit.expand,
                ),
                bottomNavigationBar: widget.bottomNavigationBar,
                floatingActionButton: widget.floatingActionButton,
              ),
              if (widget.loading) loader(),
            ],
          ),
        );
}

class GenericButton extends StatelessWidget {
  final VoidCallback ontap;
  final bool disable;
  final String text;
  final Color color;
  const GenericButton(this.text, {super.key, required this.ontap, this.disable = false, required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: !disable ? ontap : null,
      child: Ink(
        decoration: BoxDecoration(color: !disable ? color : BaseColor.colorGrey, borderRadius: BorderRadius.circular(12)),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: !disable
              ? Text16WhiteBold(
                  text,
                  alignment: TextAlign.center,
                )
              : Text16GreyInactiveBold(
                  text,
                  alignment: TextAlign.center,
                ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback ontap;
  final bool disable;
  final Color? color;
  final Widget? child;
  final double radius;
  const CustomButton({super.key, required this.ontap, this.disable = false, this.color, this.child, this.radius = 12.0});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(radius),
      onTap: !disable ? ontap : null,
      child: Ink(
        decoration: BoxDecoration(color: !disable ? (color == null ? BaseColor.colorBlueFacebook : color) : BaseColor.colorGrey, borderRadius: BorderRadius.circular(8)),
        child: child,
      ),
    );
  }
}

class BackAppBar extends AppBar {
  BackAppBar(
    BuildContext ctx,
    String text, {
    Key? key,
    List<Widget> actions = const [],
    PreferredSizeWidget? bottom,
    bool forceBack = false,
    bool center = false,
    double? elevation,
    Color? backgroundColor,
  }) : super(
          key: key,
          actions: actions,
          bottom: bottom,
          systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
          centerTitle: center,
          leading: (ModalRoute.of(ctx)?.canPop ?? false) || forceBack ? const AutoLeadingButton(color: Colors.white) : null,
          title: Text18WhitekBold(text),
          elevation: elevation,
          backgroundColor: backgroundColor,
        );
}

class Spinner<T> extends StatelessWidget {
  final bool autofocus;

  final bool dense;

  final String? helperText;

  final String? hintText;

  final List<DropdownMenuItem<T>> items;

  final String? label;

  final ValueChanged<T?>? onChanged;

  final FormFieldSetter<T>? onSaved;

  final FormFieldValidator<T>? validator;

  final T? value;

  final bool isExpanded;

  const Spinner({
    Key? key,
    this.autofocus = false,
    this.dense = false,
    this.helperText,
    this.hintText,
    this.items = const [],
    this.label,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.value,
    this.isExpanded = true,
  }) : super(key: key);

  @override
  Widget build(ctx) => DropdownButtonFormField(
        autofocus: autofocus,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          contentPadding: dense ? const EdgeInsets.fromLTRB(12, 9, 12, 10) : null,
          helperMaxLines: 3,
          helperText: helperText,
          hintText: hintText,
          isDense: dense,
          // filled: true,
        ),
        items: items,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator ??
            (value) {
              if (value == null) return "$hintText Wajib diisi";
              return null;
            },
        value: value,
        isExpanded: isExpanded,
      );
}

class WebviewContainerPage extends StatefulWidget {
  const WebviewContainerPage({
    super.key,
    this.title,
    required this.url,
    this.headers,
    this.isProgressIndicator = false,
    this.memberId = '',
    this.onWebViewLN = false,
    this.firstName,
    this.payment,
    this.orderId,
    this.isDisableValidationConsoleMessage = false,
  });

  final String? title;
  final String url;
  final bool isProgressIndicator;
  final String memberId;
  final Map<String, String>? headers;
  final bool onWebViewLN;
  final String? firstName;
  final String? payment;
  final String? orderId;
  final bool isDisableValidationConsoleMessage;

  @override
  State<WebviewContainerPage> createState() => _WebviewContainerPageState();
}

class _WebviewContainerPageState extends State<WebviewContainerPage> {
  bool _isloading = true;
  String _url = '';

  bool _isError = false;
  InAppWebViewController? _webViewController;
  double progress = 0;

  @override
  void initState() {
    _url = widget.url;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Loadable(
      appBar: widget.title == null ? null : BackAppBar(context, widget.title!, center: false, backgroundColor: Colors.white, elevation: 0.0),
      backgroundColor: Colors.white,
      loading: widget.isProgressIndicator ? false : _isloading,
      child: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            if (!_isError) {
              final isCanGoBack = widget.url.contains('') ? await _webViewController!.canGoBack() : await _webViewController!.canGoBackOrForward(steps: -2);
              if (_webViewController != null && isCanGoBack && !_url.contains('back') && !_url.contains('')) {
                _webViewController!.goBack();
                return false;
              } else if (_webViewController != null && isCanGoBack && widget.url.contains('')) {
                _webViewController!.goBack();
                return false;
              } else {
                return true;
              }
            } else {
              return true;
            }
          },
          child: _isError
              ? CenterAlignedColumn(
                  children: [
                    Icon(
                      size: 100,
                      Icons.wifi_tethering_error_rounded_rounded,
                      color: BaseColor.red821,
                    ),
                    Text22BlackBold(
                      "Oops! Sepertinya ada yang tidak beres...",
                      alignment: TextAlign.center,
                    ).bottomPadded(15).horizontalPadded(),
                    Text16GreyRegular(
                      "Silakan coba lagi nanti. Kami mohon maaf atas ketidaknyamanan ini dan sedang berupaya menyelesaikan masalah ini secepat mungkin. Terima kasih atas kesabaran Anda.",
                      alignment: TextAlign.center,
                      maxLines: 8,
                    ).leftPadded16().rightPadded16().bottomPadded16(),
                    Container(
                      margin: const EdgeInsets.only(left: 16, right: 16, top: 8),
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: BoxDecoration(color: BaseColor.primaryColor, borderRadius: BorderRadius.circular(4)),
                      child: InkWell(
                        onTap: () async {
                          context.router.pop();
                        },
                        child: CenterAlignedRow(
                          children: [
                            Text16WhiteMedium(
                              "Kembali",
                            )
                          ],
                        ),
                      ),
                    ).bottomPadded(32),
                  ],
                )
              : Stack(
                  children: [
                    InAppWebView(
                      initialUrlRequest: URLRequest(
                        url: Uri.parse(widget.url),
                        headers: widget.headers,
                      ),
                      androidShouldInterceptRequest: // <--
                          (controller, request) async {
                        log("requestt ${request}");
                      },
                      androidOnGeolocationPermissionsShowPrompt: (InAppWebViewController controller, String origin) async {
                        return GeolocationPermissionShowPromptResponse(origin: origin, allow: true, retain: true);
                      },
                      initialOptions: InAppWebViewGroupOptions(
                        crossPlatform: InAppWebViewOptions(
                          useOnDownloadStart: true,
                          useShouldOverrideUrlLoading: true,
                        ),
                        android: AndroidInAppWebViewOptions(
                          useShouldInterceptRequest: true, // <--
                        ),
                      ),
                      onWebViewCreated: (controller) {
                        _webViewController = controller;
                      },
                      shouldOverrideUrlLoading: (controller, request) async {},
                      onLoadStart: (controller, url) async {},
                      onLoadError: (controller, url, code, message) {
                        _isError = true;
                        _setLoading(false);
                      },
                      onLoadHttpError: (controller, url, statusCode, description) {
                        _isError = true;
                        _setLoading(false);
                      },
                      onLoadStop: (controller, url) {
                        _setLoading(false);
                      },
                      onDownloadStartRequest: (controller, downloadStartRequest) async {},
                      onProgressChanged: (controller, progress) {
                        setState(() {
                          this.progress = progress / 100;
                        });
                      },
                      onConsoleMessage: (controller, consoleMessage) {
                        if (!widget.isDisableValidationConsoleMessage) {
                          if (consoleMessage.toString().contains('ERR_TIME_OUT')) {
                            setState(() {
                              _isError = true;
                            });
                            _setLoading(false);
                          }
                        }
                      },
                    ),
                    widget.isProgressIndicator
                        ? progress < 1.0
                            ? LinearProgressIndicator(value: progress)
                            : const SizedBox()
                        : const SizedBox(),
                  ],
                ),
        ),
      ),
    );
  }

  void _setLoading(bool value) {
    setState(() => _isloading = value);
  }
}
