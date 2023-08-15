import 'package:mothercare_mobile/core/widgets/copyritght.dart';
import 'package:mothercare_mobile/features/ektp/ektp.dart';
import 'package:mothercare_mobile/features/profile/bloc/profile_bloc.dart';
import 'package:mothercare_mobile/features/profile/model/user_profile_response.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    sl<ProfileBloc>().add(DataProfileEvent());
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
