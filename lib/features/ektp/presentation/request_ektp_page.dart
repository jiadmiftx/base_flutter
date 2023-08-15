import 'package:mothercare_mobile/core/helpers/copiable_text_helper.dart';
import 'package:mothercare_mobile/core/helpers/permission_role/permission_role.dart';
import 'package:mothercare_mobile/core/widgets/copyritght.dart';
import 'package:mothercare_mobile/features/ektp/ektp.dart';
import 'package:mothercare_mobile/features/profile/bloc/profile_bloc.dart';

@RoutePage()
class RequestEktpPage extends StatefulWidget {
  const RequestEktpPage({super.key});

  @override
  State<RequestEktpPage> createState() => _RequestEktpPageState();
}

class _RequestEktpPageState extends State<RequestEktpPage> {
  @override
  void initState() {
    sl<EktpBloc>().add(DataGetRequestedEktpEvent());
    _getAccess();
    super.initState();
  }

  List<String> accesses = [];

  _getAccess() async {
    accesses = await roleHelper.getListAccess();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EktpBloc, EktpState>(
      builder: (context, state) => Loadable(
        loading: state.isLoading,
        extendBodyBehindAppBar: true,
        appBar: BackAppBar(
          backgroundColor: BaseColor.primaryColor,
          context,
          "E-KTP",
          elevation: 0.0,
        ),
        child: (state.ektpListResponse?.response?.data?.data?.isEmpty ?? true)
            ? _buildEmptyWidget()
            : SafeArea(
                child: SingleChildScrollView(
                  child: CenterAlignedColumn(
                    children: [
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.ektpListResponse?.response?.data?.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          final data = state.ektpListResponse?.response?.data?.data?[index];
                          return InkWell(
                            onTap: () {
                              context.router.push(RequestDetailEktpPageRoute(id: data?.id.toString() ?? "0", noPermohonan: data?.noPermohonan ?? "0"));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: .1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      CopiableText(data?.noPermohonan ?? "").bottomPadded(),
                                      Row(
                                        children: [
                                          IconButton(tooltip: 'Tracking', onPressed: () {}, icon: Icon(Icons.query_stats_rounded)).rightPadded10(),
                                          Icon(Icons.remove_red_eye_outlined),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text11BlackF45Medium("Nama Lengkap: "),
                                      Text11BlackF45Medium("Jenis Kelamin: "),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text16BlackBold(
                                        "${data?.nama?.toUpperCase() ?? ""}",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                      ),
                                      Text14BlackRegular(
                                        getGender(data?.jenisKelamin ?? ""),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text11BlackF45Medium("No. NIK:"),
                                      Text11BlackF45Medium("No. KK: "),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text14BlackMedium(
                                        "${data?.nik?.toUpperCase() ?? ""}",
                                      ),
                                      Text14BlackMedium(
                                        "${data?.noKk}",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                      )
                                    ],
                                  ).bottomPadded(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text11BlackF45Medium("Waktu Pengajuan: "),
                                      Text11BlackF45Medium("Status: "),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text13BlackRegular(data?.createdAt ?? ""),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: getColorStatus(data?.status ?? ""),
                                        ),
                                        child: Text14WhiteMedium(
                                          "${data?.status?.toUpperCase() ?? ""}",
                                          alignment: TextAlign.center,
                                        ).horizontalPadded(8).verticalPadded(2),
                                      ).leftPadded(24),
                                    ],
                                  ),
                                  Text11BlackF45Medium("Waktu Pengambilan:"),
                                  Text13BlackRegular(
                                    data?.tglPengambilan ?? "-",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ],
                              ).padded(),
                            ).horizontalPadded().topPadded(),
                          );
                        },
                      ),
                      buildCopyright().topPadded().bottomPadded(64)
                    ],
                  ),
                ),
              ),
        floatingActionButton: Visibility(
          visible: accesses.contains('ktp_create'),
          child: FloatingActionButton.extended(
            backgroundColor: BaseColor.primaryColor,
            tooltip: 'Buat Pengajuan EKTP',
            onPressed: () => context.router.push(RequestEktpFormPageRoute()),
            label: Row(
              children: [Icon(Icons.add_box_outlined), Text('Ajukan Permohonan')],
            ),
          ),
        ),
      ),
      listener: (context, state) {
        if (state.ektpListResponse?.statusCode == 401 && state.ektpListResponse?.errorMessage != '' && !(state.ektpListResponse?.status ?? false)) {
          sl<ProfileBloc>().add(DataProfileLogoutEvent());
          context.router.replaceAll([BoardingPageRoute(), LoginPageRoute()]);
          showError(context, state.ektpListResponse?.errorMessage ?? "", 4);
        }
      },
    );
  }

  _buildEmptyWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            getSourceByPng('ktp'),
            height: 100,
          ),
        ).padded(),
        Text16BlackRegular("Belum ada data pengajuan...")
      ],
    );
  }
}
