import 'package:auto_route/annotations.dart';
import 'package:mothercare_mobile/core/utils/extensions/widget_util.dart';
import 'package:flutter/src/widgets/framework.dart';

@RoutePage()
class WebviewStaticPage extends StatefulWidget {
  final String url;
  final String title;

  const WebviewStaticPage({super.key, required this.url, required this.title});

  @override
  State<WebviewStaticPage> createState() => _WebviewStaticPageState();
}

class _WebviewStaticPageState extends State<WebviewStaticPage> {
  @override
  Widget build(BuildContext context) {
    return WebviewContainerPage(
      title: widget.title,
      url: widget.url,
    );
  }
}
