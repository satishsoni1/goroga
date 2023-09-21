import '../controller/search_result_podcast_controller.dart';
import '../models/listcountry_item_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';

// ignore: must_be_immutable
class ListcountryItemWidget extends StatelessWidget {
  ListcountryItemWidget(this.listcountryItemModelObj,
      {this.onTapColumncountry});

  ListcountryItemModel listcountryItemModelObj;

  var controller = Get.find<SearchResultPodcastController>();

  VoidCallback? onTapColumncountry;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {
            onTapColumncountry?.call();
          },
          child: Padding(
            padding: getPadding(
              right: 12,
              bottom: 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgImage160x16010,
                  height: getSize(
                    160,
                  ),
                  width: getSize(
                    160,
                  ),
                  radius: BorderRadius.circular(
                    getHorizontalSize(
                      24,
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 9,
                  ),
                  child: Obx(
                    () => Text(
                      listcountryItemModelObj.countryTxt.value,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtUrbanistRomanBold18.copyWith(
                        letterSpacing: getHorizontalSize(
                          0.2,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
