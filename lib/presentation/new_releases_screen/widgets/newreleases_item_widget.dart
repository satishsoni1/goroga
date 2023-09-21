import '../controller/new_releases_controller.dart';
import '../models/newreleases_item_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';

// ignore: must_be_immutable
class NewreleasesItemWidget extends StatelessWidget {
  NewreleasesItemWidget(this.newreleasesItemModelObj);

  NewreleasesItemModel newreleasesItemModelObj;

  var controller = Get.find<NewReleasesController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgImage184x18416,
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
              newreleasesItemModelObj.typeTxt.value,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtUrbanistRomanBold20,
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            top: 7,
          ),
          child: Obx(
            () => Text(
              newreleasesItemModelObj.nameTxt.value,
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
    );
  }
}
