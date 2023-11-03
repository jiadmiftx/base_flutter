import 'package:flutter/material.dart';
import 'package:pgn_mobile/core/core.dart';
import 'package:pgn_mobile/core/utils/color/color_util.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({Key? key, this.height, this.width}) : super(key: key);

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: BaseColor.grey0E5,
        highlightColor: BaseColor.grey6F6,
        child: Card(
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          child: const SizedBox(height: 80),
        ),
      ),
    );
  }
}

class LoadingListShimmer extends StatelessWidget {
  const LoadingListShimmer({Key? key, this.height, this.width, this.circural, this.heightItem, this.widthItem}) : super(key: key);

  final double? height, width, circural, heightItem, widthItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: BaseColor.grey0E5,
        highlightColor: BaseColor.grey6F6,
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, index) {
            // var data = state.categorySliderResponse?.categorySlider;
            // var url = imageUrlPub + (data?[index].imageUrl ?? "");
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(circural ?? 100),
                  ),
                  child: SizedBox(
                    width: widthItem ?? MediaQuery.of(context).size.height / 10,
                    height: heightItem ?? MediaQuery.of(context).size.height / 10,
                  ),
                ),
                Card(
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 4.5,
                    height: 20,
                  ),
                ),
              ],
            ).horizontalPadded(18);
          },
        ),
      ),
    );
  }
}

class CircleLoadingShimmer extends StatelessWidget {
  const CircleLoadingShimmer({Key? key, this.size = 24}) : super(key: key);

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      loop: 100,
      child: Container(
        height: size,
        width: size,
      ),
    );
  }
}
