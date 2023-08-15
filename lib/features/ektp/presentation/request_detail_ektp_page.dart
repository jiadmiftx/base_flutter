import 'dart:developer';
import 'package:mothercare_mobile/core/helpers/copiable_text_helper.dart';
import 'package:mothercare_mobile/core/helpers/permission_role/permission_role.dart';
import 'package:mothercare_mobile/features/ektp/ektp.dart';
import 'package:photo_view/photo_view.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:timeline_list/timeline.dart';

@RoutePage()
class RequestDetailEktpPage extends StatefulWidget {
  final String id;
  final String noPermohonan;
  const RequestDetailEktpPage({super.key, required this.id, required this.noPermohonan});

  @override
  State<RequestDetailEktpPage> createState() => _RequestDetailEktpPageState();
}

class _RequestDetailEktpPageState extends State<RequestDetailEktpPage> {
  @override
  void initState() {
    sl<EktpBloc>().add(DataDetailRequestedEktpEvent(id: widget.id));
    _getAccess();
    super.initState();
  }

  List<String> accesses = [];

  _getAccess() async {
    accesses = await roleHelper.getListAccess();
    setState(() {});
  }

  final _formKey = GlobalKey<FormState>();
  XFile? fileF102;
  XFile? fileKK;
  XFile? fileSuratPerekaman;
  XFile? fileSuratKehilangan;
  XFile? fileEktp;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EktpBloc, EktpState>(
      listener: (context, state) {
        log("APA ISINYA NIHHHH: ${state.responseSaveKtp && state.errorMessage == '' && !state.isLoading}");
        if (state.responseSaveKtp && state.errorMessage == '' && !state.isLoading) {
          showSuccess(context, "Gambar berhasil disimpan!", 4);
        } else if (!state.responseSaveKtp && state.errorMessage != '' && state.statusCode != 200) {
          showError(context, state.errorMessage);
        } else if (state.statusCode == 200 && state.errorMessage != '') {
          sl<EktpBloc>().add(DataGetRequestedEktpEvent());
          context.router.pop();
          showWarning(context, state.errorMessage, 4);
        }
      },
      builder: (context, state) {
        return Loadable(
          loading: state.isLoading,
          appBar: BackAppBar(
            backgroundColor: BaseColor.primaryColor,
            context,
            "Detail ${state.ektpDetailResponse?.response?.data?.item?.noPermohonan}",
            elevation: 0.0,
            actions: [
              Visibility(
                visible: accesses.contains('ktp_delete'),
                child: IconButton(
                    onPressed: () {
                      showAlert(context, text: "Hapus data permohonan dengan nomor ${state.ektpDetailResponse?.response?.data?.item?.noPermohonan}", yes: () {
                        sl<EktpBloc>().add(DataDeleteRequestedEktpEvent(id: widget.id));
                        context.router.pop();
                      });
                    },
                    icon: Icon(Icons.delete_outline)),
              )
            ],
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: LeftAlignedColumn(
                children: [
                  _buildInformation(state),
                  _buildAttachment(state),
                  _buildTracking(state),
                ],
              ).bottomPadded(100),
            ),
          ),
          bottomNavigationBar: Visibility(
            visible: accesses.contains('ktp_update'),
            child: CenterAlignedColumn(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      disabledForegroundColor: BaseColor.grey,
                      backgroundColor: BaseColor.primaryColor,
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        context.router.push(RequestEktpFormPageRoute(isEdit: true, requKtpId: widget.id)).then((value) {
                          sl<EktpBloc>().add(DataDetailRequestedEktpEvent(id: widget.id));
                        });
                      }
                    },
                    child: Text14WhiteMedium("Ubah").padded(8),
                  ),
                ).paddedLTRB(left: 24, right: 24, top: 8, bottom: 32),
              ],
            ),
          ),
        );
      },
    );
  }

  _buildTracking(EktpState state) {
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
          Text16GreyRegular("Tracking").padded(8),
          Timeline(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: (state.ektpDetailResponse?.response?.data?.item?.tracking?.isEmpty ?? true)
                ? [
                    TimelineModel(
                      iconBackground: Colors.white,
                      icon: Icon(
                        Icons.query_builder_rounded,
                        color: Colors.grey,
                        size: 4,
                      ),
                      Text12BlackRegular("Menunggu diupdate").padded(8),
                    )
                  ]
                : List.generate(
                    state.ektpDetailResponse?.response?.data?.item?.tracking?.length ?? 0,
                    (idx) => TimelineModel(
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text12BlackRegular(
                            state.ektpDetailResponse?.response?.data?.item?.tracking?[idx].description ?? "",
                            maxLines: 6,
                          ).horizontalPadded(),
                          Text12GreyF45Light(state.ektpDetailResponse?.response?.data?.item?.tracking?[idx].createdAt ?? "").horizontalPadded().verticalPadded(8),
                        ],
                      ),
                      position: TimelineItemPosition.right,
                      iconBackground: BaseColor.primaryColor,
                      icon: Icon(
                        Icons.check_circle_outline_rounded,
                        color: Colors.white,
                        size: 4,
                      ),
                    ),
                  ),
            lineColor: Colors.blue,
            reverse: true,
            iconSize: 10,
            position: TimelinePosition.Left,
            primary: false,
          ).padded(),
        ],
      ).padded(8),
    ).padded(8);
  }

  _buildAttachment(EktpState state) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.white, boxShadow: [
        BoxShadow(
          blurRadius: 4,
          color: Colors.black.withOpacity(0.15),
          spreadRadius: 0,
        ),
      ]),
      child: LeftAlignedColumn(
        children: [
          Text16GreyRegular("Lampiran").padded(8),
          Wrap(
              children: List.generate(
            state.ektpDetailResponse?.response?.data?.item?.attachments?.length ?? 0,
            (index) => InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return Scaffold(
                      backgroundColor: Colors.black.withOpacity(0),
                      body: Stack(
                        children: [
                          PhotoView(
                            imageProvider: CachedNetworkImageProvider(state.ektpDetailResponse?.response?.data?.item?.attachments?[index].url ?? "",
                                cacheKey: state.ektpDetailResponse?.response?.data?.item?.attachments?[index].id.toString()),
                            minScale: PhotoViewComputedScale.contained * 0.8,
                            // Covered = the smallest possible size to fit the whole screen
                            maxScale: PhotoViewComputedScale.covered * 2,
                            enableRotation: true,
                            // Set the background color to the "classic white"
                            backgroundDecoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                            ),
                            loadingBuilder: (context, event) => Center(
                              child: Container(
                                width: 20.0,
                                height: 20.0,
                                child: CircularProgressIndicator(
                                  value: event == null ? 0 : event.cumulativeBytesLoaded / 0.5,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 16,
                            left: 12,
                            right: 12,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    context.router.pop();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ).horizontalPadded(),
                                Expanded(
                                    child: Text14WhiteRegular(
                                  state.ektpDetailResponse?.response?.data?.item?.attachments?[index].type ?? "",
                                  overflow: TextOverflow.ellipsis,
                                )),
                                IconButton(
                                  onPressed: () {
                                    sl<EktpBloc>().add(DownloadImageKtp(imageUrl: state.ektpDetailResponse?.response?.data?.item?.attachments?[index].url));
                                  },
                                  icon: Icon(
                                    Icons.download,
                                    color: Colors.white,
                                  ),
                                ).horizontalPadded(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      // color: Colors.red,
                      child: CachedNetworkImage(
                        cacheKey: state.ektpDetailResponse?.response?.data?.item?.attachments?[index].id.toString(),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.width / 4,
                        imageUrl: state.ektpDetailResponse?.response?.data?.item?.attachments?[index].url ?? "",
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.white,
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          getSourceByPng('ic_blank_n'),
                        ),
                      ),
                    ),
                  ).padded(8),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: Text12GreyDefaultRegular(state.ektpDetailResponse?.response?.data?.item?.attachments?[index].type?.replaceAll('file_', '').replaceAll('_', '-').toUpperCase() ?? "")
                          .horizontalPadded(8)),
                ],
              ),
            ),
          )),
        ],
      ).padded(8),
    ).padded(8);
  }

  _buildInformation(EktpState state) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.white, boxShadow: [
        BoxShadow(
          blurRadius: 4,
          color: Colors.black.withOpacity(0.15),
          spreadRadius: 0,
        ),
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CopiableText(state.ektpDetailResponse?.response?.data?.item?.noPermohonan ?? "").bottomPadded(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text11BlackF45Medium("Nama Lengkap: "),
              Text11BlackF45Medium("Jenis Kelamin: "),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text16BlackBold(
                "${state.ektpDetailResponse?.response?.data?.item?.nama?.toUpperCase() ?? ""}",
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
              Text14BlackRegular(
                getGender(state.ektpDetailResponse?.response?.data?.item?.jenisKelamin ?? ""),
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
                "${state.ektpDetailResponse?.response?.data?.item?.nik?.toUpperCase() ?? ""}",
              ),
              Text14BlackMedium(
                "${state.ektpDetailResponse?.response?.data?.item?.noKk}",
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
              Text13BlackRegular(state.ektpDetailResponse?.response?.data?.item?.createdAt ?? ""),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: getColorStatus(state.ektpDetailResponse?.response?.data?.item?.status ?? ""),
                ),
                child: Text14WhiteMedium(
                  "${state.ektpDetailResponse?.response?.data?.item?.status?.toUpperCase() ?? ""}",
                  alignment: TextAlign.center,
                ).horizontalPadded(8).verticalPadded(2),
              ).leftPadded(24),
            ],
          ),
          Text11BlackF45Medium("Waktu Pengambilan:"),
          Text13BlackRegular(
            state.ektpDetailResponse?.response?.data?.item?.tglPengambilan ?? "-",
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ],
      ).padded(),
    ).padded(8);
  }
}
