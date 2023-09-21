import '../controller/podcasts_controller.dart';
import '../models/listloremipsumdolor1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';

// ignore: must_be_immutable
class Listloremipsumdolor1ItemWidget extends StatelessWidget {
  Listloremipsumdolor1ItemWidget(this.listloremipsumdolor1ItemModelObj);

  Listloremipsumdolor1ItemModel listloremipsumdolor1ItemModelObj;

  var controller = Get.find<PodcastsController>();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: getPadding(
            right: 12,
            bottom: 4,
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
              Container(
                width: getHorizontalSize(
                  150,
                ),
                margin: getMargin(
                  top: 9,
                ),
                child: Obx(
                  () => Text(
                    listloremipsumdolor1ItemModelObj.loremIpsumDolorTxt.value,
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
          ),
        ),
      ),
    );
  }
}
