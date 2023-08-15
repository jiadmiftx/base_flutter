import 'package:mothercare_mobile/features/ektp/ektp.dart';
import 'package:mothercare_mobile/features/profile/bloc/profile_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

@RoutePage()
class PusatBantuanPage extends StatefulWidget {
  const PusatBantuanPage({super.key});

  @override
  State<PusatBantuanPage> createState() => _PusatBantuanPageState();
}

class _PusatBantuanPageState extends State<PusatBantuanPage> {
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
          title: Text18WhitekBold("Pusat Bantuan"),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: LeftAlignedColumn(children: [
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.userProfileResponse?.response?.data?.item?.pusatBantuan?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.white, boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.15),
                          spreadRadius: 0,
                        ),
                      ]),
                      child: LeftAlignedColumn(
                        children: [
                          Row(
                            children: [
                              ClipOval(
                                child: Container(
                                  child: CachedNetworkImage(
                                    cacheKey: "${state.userProfileResponse?.response?.data?.item?.pusatBantuan?[index].foto}${DateTime.now()}",
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width / 6,
                                    height: MediaQuery.of(context).size.width / 6,
                                    imageUrl: state.userProfileResponse?.response?.data?.item?.pusatBantuan?[index].foto ?? "",
                                    placeholder: (context, url) => Shimmer.fromColors(
                                      baseColor: Colors.grey,
                                      highlightColor: Colors.white,
                                      child: Container(
                                        color: Colors.white,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) => Image.asset(
                                      getSourceByPng('ic_profile_blank'),
                                    ),
                                  ),
                                ),
                              ).padded(8),
                              LeftAlignedColumn(children: [
                                Text16BlackSemiBold("${state.userProfileResponse?.response?.data?.item?.pusatBantuan?[index].nama ?? ""}"),
                                Text14BlackRegular("${state.userProfileResponse?.response?.data?.item?.pusatBantuan?[index].jabatan ?? ""}"),
                                Text14BlackRegular("Telp: +62${state.userProfileResponse?.response?.data?.item?.pusatBantuan?[index].noHp ?? ""}"),
                              ]),
                            ],
                          ),
                          TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                disabledForegroundColor: BaseColor.grey,
                                backgroundColor: Colors.white,
                                shadowColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 2, color: BaseColor.primaryColor),
                                  borderRadius: BorderRadius.circular(12), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                launchUrlString(
                                  "https://api.whatsapp.com/send/?phone=62${state.userProfileResponse?.response?.data?.item?.pusatBantuan?[index].noHp}",
                                  mode: LaunchMode.externalApplication,
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    getSourceByPng("whatsapp"),
                                    height: 24,
                                  ).rightPadded10(),
                                  Text16PrimaryBlueSemiBold("Whatsapp")
                                ],
                              ))
                        ],
                      ).padded(),
                    ).horizontalPadded(8).topPadded(8);
                  }),
            ]),
          ),
        ),
        loading: state.isLoading,
      ),
      listener: (context, state) {},
    );
  }
}
