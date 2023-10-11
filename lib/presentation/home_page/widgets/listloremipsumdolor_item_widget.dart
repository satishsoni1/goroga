import '../controller/home_controller.dart';
import '../models/listloremipsumdolor_item_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';

// ignore: must_be_immutable
class ListloremipsumdolorItemWidget extends StatelessWidget {
  ListloremipsumdolorItemWidget(this.listloremipsumdolorItemModelObj, {required Null Function() onTapTypeRoundedC});

  ListloremipsumdolorItemModel listloremipsumdolorItemModelObj;

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: getPadding(
            right: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgImage184x18410,
                height: getSize(
                  165,
                ),
                width: getSize(
                  460,
                ),
                radius: BorderRadius.circular(
                  getHorizontalSize(
                    9,
                  ),
                ),
              ),
              Container(
                width: getHorizontalSize(
                  139,
                ),
                margin: getMargin(
                  top: 8,
                ),
                child: Obx(
                  () => Text(
                    listloremipsumdolorItemModelObj.loremIpsumDolorTxt.value,
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
