import 'package:mothercare_mobile/core/widgets/copyritght.dart';
import 'package:mothercare_mobile/features/ektp/ektp.dart';
import 'package:mothercare_mobile/features/profile/bloc/profile_bloc.dart';
import 'package:mothercare_mobile/features/profile/model/user_profile_response.dart';

@RoutePage()
class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  void initState() {
    sl<ProfileBloc>().add(DataProfileEvent());
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
