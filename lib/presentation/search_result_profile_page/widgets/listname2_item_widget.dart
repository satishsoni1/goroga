import '../controller/search_result_profile_controller.dart';
import '../models/listname2_item_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/custom_button.dart';

// ignore: must_be_immutable
class Listname2ItemWidget extends StatelessWidget {
  Listname2ItemWidget(this.listname2ItemModelObj, {this.onTapRowname});

  Listname2ItemModel listname2ItemModelObj;

  var controller = Get.find<SearchResultProfileController>();

  VoidCallback? onTapRowname;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapRowname?.call();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgImage80x8025,
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
              top: 17,
              bottom: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    listname2ItemModelObj.nameTxt.value,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtUrbanistRomanBold18,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 9,
                  ),
                  child: Obx(
                    () => Text(
                      listname2ItemModelObj.followersCounterTxt.value,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtUrbanistRomanMedium12.copyWith(
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
