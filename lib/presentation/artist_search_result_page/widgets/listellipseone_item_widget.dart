import '../controller/artist_search_result_controller.dart';
import '../models/listellipseone_item_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/custom_button.dart';

// ignore: must_be_immutable
class ListellipseoneItemWidget extends StatelessWidget {
  ListellipseoneItemWidget(this.listellipseoneItemModelObj,
      {this.onTapRowellipseone});

  ListellipseoneItemModel listellipseoneItemModelObj;

  var controller = Get.find<ArtistSearchResultController>();

  VoidCallback? onTapRowellipseone;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapRowellipseone?.call();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgEllipse180x80,
            height: getSize(
              80,
            ),
            width: getSize(
              80,
            ),
            radius: BorderRadius.circular(
              getHorizontalSize(
                40,
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 16,
              top: 28,
              bottom: 29,
            ),
            child: Obx(
              () => Text(
                listellipseoneItemModelObj.artistnameTxt.value,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtUrbanistRomanBold18,
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgCategoriesverified,
            height: getSize(
              20,
            ),
            width: getSize(
              20,
            ),
            margin: getMargin(
              left: 4,
              top: 30,
              bottom: 30,
            ),
          ),
          Spacer(),
          CustomButton(
            height: getVerticalSize(
              32,
            ),
            width: getHorizontalSize(
              73,
            ),
            text: "lbl_follow".tr,
            margin: getMargin(
              top: 24,
              bottom: 24,
            ),
            shape: ButtonShape.RoundedBorder16,
            fontStyle: ButtonFontStyle.UrbanistSemiBold14WhiteA700,
          ),
        ],
      ),
    );
  }
}
