import 'package:mothercare_mobile/core/helpers/price/price_utils.dart';
import 'package:mothercare_mobile/features/category/bloc/category_bloc.dart';
import 'package:mothercare_mobile/features/category/model/categroy_response.dart';
import 'package:mothercare_mobile/features/ektp/ektp.dart';
import 'package:mothercare_mobile/features/profile/bloc/profile_bloc.dart';
import 'package:mothercare_mobile/generated/l10n.dart';

@RoutePage()
class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int selectedIndex = 0;

  @override
  void initState() {
    sl<CategoryBloc>().add(DataCategoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, CategoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Loadable(
            loading: state.isLoading,
            appBar: AppBar(
              backgroundColor: BaseColor.primaryColor,
              title: Text18WhitekBold(S.of(context).category),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
                IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border_sharp)),
              ],
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3.5,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.categoryResponse?.response?.records?.first.childrenData?.length ?? 0,
                        itemBuilder: (context, index) {
                          final data = state.categoryResponse?.response?.records?.first.childrenData?[index];
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              color: selectedIndex == index ? Colors.grey[100] : Colors.grey[300],
                              child: selectedIndex == index ? Text16PrimaryBlueBold(data?.name ?? "").padded() : Text(data?.name ?? "").padded(),
                            ),
                          );
                        },
                      ),
                    ),
                    _buildPanelWidget(state.categoryResponse?.response?.records?.first.childrenData?[selectedIndex])
                  ],
                ),
              ),
            ),
          );
        });
  }

  _buildPanelWidget(ChildrenDatum? o) {
    return Expanded(
      child: Container(
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: o?.childrenData?.length ?? 0,
          itemBuilder: (context, index) {
            return Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(
                      Radius.circular(2),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Colors.black.withOpacity(0.05),
                        spreadRadius: 0,
                      ),
                    ]),
                child: ExpansionTile(
                  iconColor: BaseColor.primaryColorLight,
                  onExpansionChanged: (value) {},
                  title: Text16BlackSemiBold(o?.childrenData?[index].name ?? "", alignment: TextAlign.left),
                  expandedAlignment: Alignment.centerLeft,
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 1,
                      ),
                      itemCount: o?.childrenData?[index].childrenData?.length ?? 0, // + 1 For State On The Bottom
                      itemBuilder: (context, idx) {
                        return InkWell(
                          onTap: () {
                            // context.router.push(WebviewStaticPageRoute(url: state.beritaResponse?.response?.data?[index].url ?? "", title: ""));
                          },
                          child: Container(
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
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: CachedNetworkImage(
                                    cacheKey: "Key${o?.childrenData?[index].childrenData?[idx].image}${DateTime.now().hour}",
                                    fit: BoxFit.fitWidth,
                                    imageUrl: baseImageUrlMedia + (o?.childrenData?[index].childrenData?[idx].image ?? ""),
                                    placeholder: (context, url) => Shimmer.fromColors(
                                      baseColor: Colors.grey,
                                      highlightColor: Colors.white,
                                      child: Container(
                                        color: Colors.white,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) => Image.asset(
                                      getSourceByPng('No_Image_Available_Large'),
                                    ),
                                  ),
                                ),
                                Text16BlackRegular(
                                  o?.childrenData?[index].childrenData?[idx].name ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  alignment: TextAlign.center,
                                ).topPadded(8),
                              ],
                            ),
                          ).padded(6),
                        );
                      },
                    ).padded(8),
                  ],
                ),
              ).topPadded(2),
            );
          },
        ),
      ),
    );
  }
}
