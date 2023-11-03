import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pgn_mobile/core/core.dart';
import 'package:pgn_mobile/core/utils/extensions/widget_util.dart';

@RoutePage()
class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Loadable(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: BaseColor.primaryColor,
        title: Text18WhitekBold("Article"),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: LeftAlignedColumn(
            children: [Center(child: Text("Article"))],
          ),
        ),
      ),
    );
  }
}
