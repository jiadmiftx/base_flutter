import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgn_mobile/core/core.dart';
import 'package:pgn_mobile/core/utils/extensions/widget_util.dart';
import 'package:pgn_mobile/features/profile/bloc/profile_bloc.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      builder: (context, state) => Loadable(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: BaseColor.primaryColor,
          title: Text18WhitekBold("Profile"),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: LeftAlignedColumn(
              children: [],
            ),
          ),
        ),
        loading: state.isLoading,
      ),
      listener: (context, state) {},
    );
  }
}
