import '../controller/search_result_album_controller.dart';
import '../models/gridsweetener_item_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';

// ignore: must_be_immutable
class GridsweetenerItemWidget extends StatelessWidget {
  GridsweetenerItemWidget(this.gridsweetenerItemModelObj,
      {this.onTapColumnsweetener});

  GridsweetenerItemModel gridsweetenerItemModelObj;

  var controller = Get.find<SearchResultAlbumController>();

  VoidCallback? onTapColumnsweetener;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapColumnsweetener?.call();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgImage184x18419,
            height: getSize(
              184,
            ),
            width: getSize(
              184,
            ),
            radius: BorderRadius.circular(
              getHorizontalSize(
                28,
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              top: 12,
            ),
            child: Obx(
              () => Text(
                gridsweetenerItemModelObj.sweetenerTxt.value,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtUrbanistRomanBold20,
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              top: 5,
            ),
            child: Text(
              "lbl_ariana_grande".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtUrbanistSemiBold14Gray700.copyWith(
                letterSpacing: getHorizontalSize(
                  0.2,
                ),
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              top: 7,
            ),
            child: Obx(
              () => Text(
                gridsweetenerItemModelObj.zipcodeTxt.value,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtUrbanistSemiBold14Gray700.copyWith(
                  letterSpacing: getHorizontalSize(
                    0.2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
