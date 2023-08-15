import 'package:carousel_slider/carousel_slider.dart';
import 'package:mothercare_mobile/core/helpers/permission_role/permission_role.dart';
import 'package:mothercare_mobile/core/helpers/price/price_utils.dart';
import 'package:mothercare_mobile/core/widgets/copyritght.dart';
import 'package:mothercare_mobile/core/widgets/shimmers/shimmer_card_widgets.dart';
import 'package:mothercare_mobile/core/widgets/shimmers/skleton.dart';
import 'package:mothercare_mobile/features/ektp/ektp.dart';
import 'package:mothercare_mobile/features/notifikasi/bloc/notification_bloc.dart';
import 'package:mothercare_mobile/features/profile/bloc/profile_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:mothercare_mobile/core/widgets/app_bars.dart';
import 'package:mothercare_mobile/features/home/bloc/home_bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final formatCurrency = NumberFormat.simpleCurrency(
    name: "IDR",
    decimalDigits: 0,
  );

  var isExpanded = false;
  List<String> accesses = [];

  @override
  void initState() {
    sl<HomeBloc>().add(DataHomeSliderEvent());
    sl<HomeBloc>().add(DataHomeBottomBannerEvent());
    sl<HomeBloc>().add(DataHomeStripperBannerEvent());
    sl<HomeBloc>().add(DataHomeNewArrivalEvent());
    sl<HomeBloc>().add(DataHomeBestSellerEvent());
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
            onRefresh: () async {
              sl<HomeBloc>().add(DataHomeSliderEvent());
              sl<HomeBloc>().add(DataHomeBottomBannerEvent());
              sl<HomeBloc>().add(DataHomeStripperBannerEvent());
              sl<HomeBloc>().add(DataHomeNewArrivalEvent());
              sl<HomeBloc>().add(DataHomeBestSellerEvent());
            },
            child: SafeArea(
              child: SingleChildScrollView(
                child: CenterAlignedColumn(
                  children: [
                    //HEADER MENU
                    (!state.isLoading && state.sliderResponse != null)
                        ? _buildSlider(state)
                        : LoadingShimmer(
                            height: MediaQuery.of(context).size.height / 6,
                            width: MediaQuery.of(context).size.width,
                          ),
                    !state.isLoading
                        ? Text18BlackSemiBold("Shop by Category").padded()
                        : LoadingShimmer(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 2,
                          ),
                    !state.isLoading
                        ? _buildCategoryShop(state)
                        : LoadingListShimmer(
                            height: MediaQuery.of(context).size.height / 5.0,
                          ),
                    !state.isLoading
                        ? _buildStripBanner(state)
                        : LoadingShimmer(
                            height: MediaQuery.of(context).size.height / 6,
                            width: MediaQuery.of(context).size.width,
                          ),
                    !state.isLoading
                        ? _buildNewArrival(state)
                        : LoadingListShimmer(
                            height: MediaQuery.of(context).size.height / 2.8,
                            heightItem: MediaQuery.of(context).size.height / 3.5,
                            widthItem: MediaQuery.of(context).size.width / 3,
                            circural: 6,
                          ),
                    !state.isLoading
                        ? _buildBestSeller(state)
                        : LoadingListShimmer(
                            height: MediaQuery.of(context).size.height / 2.8,
                            heightItem: MediaQuery.of(context).size.height / 3.5,
                            widthItem: MediaQuery.of(context).size.width / 3,
                            circural: 6,
                          ),
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

  _buildSlider(HomeState state) {
    return SizedBox(
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.4,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          // autoPlay: false,
        ),
        items: state.sliderResponse?.response?.records
            ?.map(
              (item) => InkWell(
                onTap: () {
                  // context.router.push(ProductListRoute(id: item.dataId ?? "0", title: item.dataName ?? "", initial: 0));
                },
                child: CachedNetworkImage(
                  cacheKey: "${item.image}${DateTime.now().hour}",
                  fit: BoxFit.fitWidth,
                  imageUrl: item.image ?? "",
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
            )
            .toList(),
      ),
    );
  }

  _buildCategoryShop(HomeState state) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5.0,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: state.bottomBannerResponse?.response?.records?.length ?? 0,
        itemBuilder: (BuildContext context, index) {
          // var data = state.categorySliderResponse?.categorySlider;
          // var url = imageUrlPub + (data?[index].imageUrl ?? "");
          return InkWell(
            onTap: () {
              // context.router.push(ProductListRoute(id: data?[index].id ?? "", title: data?[index].entityName ?? "", initial: 0));
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: CachedNetworkImage(
                      cacheKey: "${DateTime.now()}",
                      imageUrl: state.bottomBannerResponse?.response?.records?[index].imageUrl ?? "",
                      width: MediaQuery.of(context).size.height / 10,
                      height: MediaQuery.of(context).size.height / 10,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: BaseColor.grey0E5,
                        highlightColor: BaseColor.grey6F6,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        getSourceByPng('No_Image_Available_Small'),
                      ),
                    ),
                  ),
                  Text16BlackRegular(
                    state.bottomBannerResponse?.response?.records?[index].entityName ?? "",
                    alignment: TextAlign.center,
                  )
                ],
              ).horizontalPadded(18),
            ),
          );
        },
      ),
    );
  }

  _buildStripBanner(HomeState state) {
    return ListView.builder(
      itemCount: state.stripperBannerResponse?.response?.records?.length ?? 0,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CachedNetworkImage(
          cacheKey: "${state.stripperBannerResponse?.response?.records?[index].imageUrl}${DateTime.now().hour}",
          fit: BoxFit.fitWidth,
          imageUrl: state.stripperBannerResponse?.response?.records?[index].imageUrl ?? "",
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
        );
      },
    );
  }

  _buildNewArrival(HomeState state) {
    return Container(
      color: Colors.grey,
      child: CenterAlignedColumn(children: [
        Text22WhiteBold(state.newArrivalResponse?.response?.mainTitle ?? "").padded(),
        Container(
          height: MediaQuery.of(context).size.height / 2,
          child: ListView.builder(
            itemCount: state.newArrivalResponse?.response?.products?.length ?? 0,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  // context.router.push(WebviewStaticPageRoute(url: state.beritaResponse?.response?.data?[index].url ?? "", title: ""));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.05),
                          spreadRadius: 0,
                        ),
                      ]),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: CachedNetworkImage(
                          cacheKey: "Key${state.newArrivalResponse?.response?.products?[index].imagePath}${DateTime.now().hour}",
                          fit: BoxFit.fitWidth,
                          imageUrl: baseImageUrlMedia + (state.newArrivalResponse?.response?.products?[index].imagePath ?? ""),
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.white,
                            child: Container(
                              color: Colors.white,
                            ),
                          ),
                          errorWidget: (context, url, error) => Image.asset(
                            getSourceByPng('No_Image_Available_Product_Listing'),
                          ),
                        ),
                      ),
                      Text16BlackRegular(
                        state.newArrivalResponse?.response?.products?[index].name ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        alignment: TextAlign.center,
                      ).topPadded(8),
                      state.newArrivalResponse?.response?.products?[index].kcCashback != ""
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  getSourceBySvg('ic_kc'),
                                  height: 22,
                                ).padded(4),
                                Expanded(child: Text14Grey(state.bestSellerResponse?.response?.products?[index].kcCashback ?? "")),
                              ],
                            )
                          : SizedBox(),
                      state.newArrivalResponse?.response?.products?[index].specialPrice != ""
                          ? RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: PriceUtils.formatterRp.format(state.newArrivalResponse?.response?.products?[index].price ?? "0"),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: BaseColor.grey4CB,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "  ${state.newArrivalResponse?.response?.products?[index].discount}",
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: BaseColor.redE1B),
                                  ),
                                ],
                              ),
                            ).topPadded(8)
                          : SizedBox(),
                      Text18BGreySemiBold(
                        PriceUtils.formatterRp.format(state.newArrivalResponse?.response?.products?[index].specialPrice != ""
                            ? (state.newArrivalResponse?.response?.products?[index].specialPrice ?? "")
                            : (state.newArrivalResponse?.response?.products?[index].price ?? "0")),
                        alignment: TextAlign.center,
                      ).topPadded(8),
                    ],
                  ),
                ).leftPadded(),
              );
            },
          ).bottomPadded(),
        ).topPadded(10).bottomPadded(),
      ]),
    );
  }

  _buildBestSeller(HomeState state) {
    return Container(
      color: Colors.grey[600],
      child: CenterAlignedColumn(
        children: [
          Text22WhiteBold(state.bestSellerResponse?.response?.mainTitle ?? "").padded(),
          Container(
            height: MediaQuery.of(context).size.height / 2.2,
            child: ListView.builder(
              itemCount: state.bestSellerResponse?.response?.products?.length ?? 0,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // context.router.push(WebviewStaticPageRoute(url: state.beritaResponse?.response?.data?[index].url ?? "", title: ""));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Colors.black.withOpacity(0.05),
                            spreadRadius: 0,
                          ),
                        ]),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: CachedNetworkImage(
                                height: MediaQuery.of(context).size.height / 4,
                                cacheKey: "Key${state.bestSellerResponse?.response?.products?[index].imagePath}${DateTime.now().hour}",
                                fit: BoxFit.fitWidth,
                                imageUrl: baseImageUrlMedia + (state.bestSellerResponse?.response?.products?[index].imagePath ?? ""),
                                placeholder: (context, url) => Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.white,
                                  child: Container(
                                    color: Colors.white,
                                  ),
                                ),
                                errorWidget: (context, url, error) => Image.asset(
                                  getSourceByPng('No_Image_Available_Product_Listing'),
                                ),
                              ),
                            ),
                            Text16BlackRegular(
                              state.bestSellerResponse?.response?.products?[index].name ?? "",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              alignment: TextAlign.center,
                            ).topPadded(8),
                          ],
                        ),
                        Column(
                          children: [
                            state.bestSellerResponse?.response?.products?[index].kcCashback != ""
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        getSourceBySvg('ic_kc'),
                                        height: 22,
                                      ).padded(4),
                                      Expanded(child: Text14Grey(state.bestSellerResponse?.response?.products?[index].kcCashback ?? "")),
                                    ],
                                  )
                                : SizedBox(),
                            state.bestSellerResponse?.response?.products?[index].specialPrice != ""
                                ? RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: PriceUtils.formatterRp.format(state.bestSellerResponse?.response?.products?[index].price ?? "0"),
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: BaseColor.grey4CB,
                                            decoration: TextDecoration.lineThrough,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "  ${state.bestSellerResponse?.response?.products?[index].discount}",
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: BaseColor.redE1B),
                                        ),
                                      ],
                                    ),
                                  ).topPadded(8)
                                : SizedBox(),
                            Text18BGreySemiBold(
                              PriceUtils.formatterRp.format(state.bestSellerResponse?.response?.products?[index].specialPrice != ""
                                  ? (state.bestSellerResponse?.response?.products?[index].specialPrice ?? "")
                                  : (state.bestSellerResponse?.response?.products?[index].price ?? "0")),
                              alignment: TextAlign.center,
                            ).topPadded(8),
                          ],
                        )
                      ],
                    ),
                  ).leftPadded(),
                );
              },
            ).bottomPadded(),
          ).topPadded(10).bottomPadded(),
        ],
      ),
    );
  }

  //
  //   return Container(
  //     height: (state.beritaResponse?.response?.data?.isNotEmpty ?? false) ? MediaQuery.of(context).size.height / 2 : 0,
  //     child: ListView.builder(
  //       itemCount: state.beritaResponse?.response?.data?.length ?? 0,
  //       scrollDirection: Axis.horizontal,
  //       itemBuilder: (context, index) {
  //         return InkWell(
  //           onTap: () {
  //             context.router.push(WebviewStaticPageRoute(url: state.beritaResponse?.response?.data?[index].url ?? "", title: ""));
  //           },
  //           child: Container(
  //             width: MediaQuery.of(context).size.width - 100,
  //             decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 shape: BoxShape.rectangle,
  //                 borderRadius: BorderRadius.all(
  //                   Radius.circular(12),
  //                 ),
  //                 boxShadow: [
  //                   BoxShadow(
  //                     blurRadius: 4,
  //                     color: Colors.black.withOpacity(0.05),
  //                     spreadRadius: 0,
  //                   ),
  //                 ]),
  //             padding: const EdgeInsets.all(13),
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 ClipRRect(
  //                   borderRadius: BorderRadius.circular(8),
  //                   child: CachedNetworkImage(
  //                     cacheKey: "Key${state.beritaResponse?.response?.data?[index].cover}${DateTime.now().hour}",
  //                     height: MediaQuery.of(context).size.width / 2,
  //                     fit: BoxFit.cover,
  //                     imageUrl: state.beritaResponse?.response?.data?[index].cover ?? "",
  //                     placeholder: (context, url) => Shimmer.fromColors(
  //                       baseColor: Colors.grey,
  //                       highlightColor: Colors.white,
  //                       child: Container(
  //                         color: Colors.white,
  //                       ),
  //                     ),
  //                     errorWidget: (context, url, error) => Image.asset(
  //                       getSourceByPng('ic_blank_n'),
  //                     ),
  //                   ),
  //                 ),
  //                 Text16BlackRegular(
  //                   state.beritaResponse?.response?.data?[index].title ?? "",
  //                   maxLines: 5,
  //                 ),
  //                 Text14Grey(
  //                   state.beritaResponse?.response?.data?[index].content?.replaceAll("<p>", "") ?? "",
  //                   maxLines: 2,
  //                 ),
  //                 Expanded(
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.end,
  //                     crossAxisAlignment: CrossAxisAlignment.end,
  //                     children: [
  //                       Container(child: Text14BlackRegular("Selengkapnya")).bottomPadded(12),
  //                       Icon(
  //                         Icons.chevron_right_rounded,
  //                         color: BaseColor.blueLight,
  //                       ).bottomPadded(10)
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ).leftPadded(),
  //         );
  //       },
  //     ),
  //   ).topPadded(10).bottomPadded();
  // }
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
