import '../controller/podcasts_controller.dart';
import '../models/podcasts_item_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';

// ignore: must_be_immutable
class PodcastsItemWidget extends StatelessWidget {
  PodcastsItemWidget(this.podcastsItemModelObj);

  PodcastsItemModel podcastsItemModelObj;

  var controller = Get.find<PodcastsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.gradientRed700RedA70002.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: getPadding(
              top: 21,
              bottom: 76,
            ),
            child: Obx(
              () => Text(
                podcastsItemModelObj.politicsTxt.value,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtUrbanistRomanBold18WhiteA700.copyWith(
                  letterSpacing: getHorizontalSize(
                    0.2,
                  ),
                ),
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgImage91x81,
            height: getVerticalSize(
              91,
            ),
            width: getHorizontalSize(
              81,
            ),
            radius: BorderRadius.circular(
              getHorizontalSize(
                20,
              ),
            ),
            margin: getMargin(
              left: 26,
              top: 29,
            ),
          ),
        ],
      ),
    );
  }
}
