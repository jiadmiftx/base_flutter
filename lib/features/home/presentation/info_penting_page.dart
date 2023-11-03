import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgn_mobile/core/core.dart';
import 'package:pgn_mobile/core/utils/extensions/widget_util.dart';
import 'package:pgn_mobile/features/home/bloc/home_bloc.dart';

@RoutePage()
class InfoPentingPage extends StatefulWidget {
  const InfoPentingPage({super.key});

  @override
  State<InfoPentingPage> createState() => _InfoPentingPageState();
}

class _InfoPentingPageState extends State<InfoPentingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      builder: (context, state) => Loadable(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: BaseColor.primaryColor,
          title: Text18WhitekBold("Informasi Umum / FAQ"),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: LeftAlignedColumn(children: []),
          ),
        ),
        loading: state.isLoading,
      ),
      listener: (context, state) {},
    );
  }
}
