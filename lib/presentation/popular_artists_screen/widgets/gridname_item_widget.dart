import '../controller/popular_artists_controller.dart';
import '../models/gridname_item_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';

// ignore: must_be_immutable
class GridnameItemWidget extends StatelessWidget {
  GridnameItemWidget(this.gridnameItemModelObj);

  GridnameItemModel gridnameItemModelObj;

  var controller = Get.find<PopularArtistsController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgImage184x1847,
          height: getSize(
            184,
          ),
          width: getSize(
            184,
          ),
          radius: BorderRadius.circular(
            getHorizontalSize(
              92,
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            top: 13,
          ),
          child: Obx(
            () => Text(
              gridnameItemModelObj.nameTxt.value,
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
    );
  }
}
