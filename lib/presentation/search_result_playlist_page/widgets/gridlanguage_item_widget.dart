import '../controller/search_result_playlist_controller.dart';
import '../models/gridlanguage_item_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';

// ignore: must_be_immutable
class GridlanguageItemWidget extends StatelessWidget {
  GridlanguageItemWidget(this.gridlanguageItemModelObj);

  GridlanguageItemModel gridlanguageItemModelObj;

  var controller = Get.find<SearchResultPlaylistController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgImage116x1162,
          height: getSize(
            184,
          ),
          width: getSize(
            184,
          ),
          radius: BorderRadius.circular(
            getHorizontalSize(
              20,
            ),
          ),
        ),
        Container(
          width: getHorizontalSize(
            162,
          ),
          margin: getMargin(
            top: 13,
          ),
          child: Obx(
            () => Text(
              gridlanguageItemModelObj.languageTxt.value,
              maxLines: null,
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
    );
  }
}
