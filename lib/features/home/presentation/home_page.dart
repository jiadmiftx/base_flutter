import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgn_mobile/core/core.dart';
import 'package:pgn_mobile/core/utils/extensions/widget_util.dart';
import 'package:pgn_mobile/core/widgets/app_bars.dart';
import 'package:pgn_mobile/features/home/bloc/home_bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var isExpanded = false;
  List<String> accesses = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      builder: (context, state) {
        return Loadable(
          extendBodyBehindAppBar: true,
          appBar: AppBarsCenterLogo(),
          child: RefreshIndicator(
            edgeOffset: 100,
            color: BaseColor.primaryColor,
            onRefresh: () async {},
            child: SafeArea(
              child: SingleChildScrollView(
                child: CenterAlignedColumn(
                  children: [
                    //HEADER MENU
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}

class ServiceItem extends StatelessWidget {
  final Function() onTap;
  final String title;
  final String description;
  final String imageAssets;

  const ServiceItem({
    Key? key,
    required this.onTap,
    required this.title,
    required this.description,
    required this.imageAssets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 2, right: 2),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    getSourceByPng(imageAssets),
                    height: 40,
                    width: 40,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              child: Text12GreyDefaultRegular(
                title,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                alignment: TextAlign.center,
              ).topPadded(5),
            ),
          ],
        ),
      ),
    );
  }
}
