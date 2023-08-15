import 'package:mothercare_mobile/features/ektp/ektp.dart';
import 'package:mothercare_mobile/features/home/bloc/home_bloc.dart';
import 'package:mothercare_mobile/features/profile/bloc/profile_bloc.dart';
import 'package:mothercare_mobile/features/profile/model/user_profile_response.dart';
import 'package:flutter_html/flutter_html.dart' as html;

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
            child: LeftAlignedColumn(children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.userProfileResponse?.response?.data?.item?.faq?.length ?? 0,
                itemBuilder: (context, index) {
                  return Theme(
                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Colors.black.withOpacity(0.05),
                              spreadRadius: 0,
                            ),
                          ]),
                      child: ExpansionTile(
                        onExpansionChanged: (value) {},
                        title: LeftAlignedColumn(
                          children: [
                            Text12BlueRegular(state.userProfileResponse?.response?.data?.item?.faq?[index].kategori?.toUpperCase() ?? ""),
                            Text16BlackSemiBold("${state.userProfileResponse?.response?.data?.item?.faq?[index].pertanyaan}", alignment: TextAlign.left),
                          ],
                        ).verticalPadded(8),
                        expandedAlignment: Alignment.centerLeft,
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: html.Html(
                              data: (state.userProfileResponse?.response?.data?.item?.faq?[index].jawaban ?? ""),
                              onLinkTap: (url, context, attributes, element) {
                                launchUrl(Uri.parse("$url"));
                              },
                            ).padded(),
                          ),
                        ],
                      ),
                    ).horizontalPadded(16).topPadded(16),
                  );
                },
              ),
            ]),
          ),
        ),
        loading: state.isLoading,
      ),
      listener: (context, state) {},
    );
  }
}
