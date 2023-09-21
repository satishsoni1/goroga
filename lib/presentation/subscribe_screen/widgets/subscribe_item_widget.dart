import '../controller/subscribe_controller.dart';
import '../models/subscribe_item_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';

// ignore: must_be_immutable
class SubscribeItemWidget extends StatelessWidget {
  SubscribeItemWidget(this.subscribeItemModelObj, {this.onTapColumnvector});

  SubscribeItemModel subscribeItemModelObj;

  var controller = Get.find<SubscribeController>();

  VoidCallback? onTapColumnvector;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: GestureDetector(
        onTap: () {
          onTapColumnvector?.call();
        },
        child: Container(
          padding: getPadding(
            all: 24,
          ),
          decoration: AppDecoration.gradientOrangeA400OrangeA200.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder32,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgVector,
                height: getVerticalSize(
                  44,
                ),
                width: getHorizontalSize(
                  50,
                ),
                alignment: Alignment.center,
                margin: getMargin(
                  top: 7,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: getPadding(
                    top: 23,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => Text(
                          subscribeItemModelObj.priceTxt.value,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtUrbanistRomanBold32WhiteA700,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 8,
                          top: 8,
                          bottom: 8,
                        ),
                        child: Obx(
                          () => Text(
                            subscribeItemModelObj.periodTxt.value,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtUrbanistRomanMedium18Gray100
                                .copyWith(
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
              Padding(
                padding: getPadding(
                  top: 15,
                ),
                child: Divider(
                  height: getVerticalSize(
                    1,
                  ),
                  thickness: getVerticalSize(
                    1,
                  ),
                  color: ColorConstant.blueGray100,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 15,
                  right: 27,
                ),
                child: Row(
                  children: [
                    CustomImageView(
                      svgPath: ImageConstant.imgCheckmark2,
                      height: getSize(
                        32,
                      ),
                      width: getSize(
                        32,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 20,
                        top: 8,
                        bottom: 4,
                      ),
                      child: Text(
                        "msg_listening_with".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style:
                            AppStyle.txtUrbanistRomanMedium16WhiteA700.copyWith(
                          letterSpacing: getHorizontalSize(
                            0.2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 4,
                  right: 22,
                ),
                child: Row(
                  children: [
                    CustomImageView(
                      svgPath: ImageConstant.imgCheckmark2,
                      height: getSize(
                        32,
                      ),
                      width: getSize(
                        32,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 20,
                        top: 8,
                        bottom: 4,
                      ),
                      child: Text(
                        "msg_listening_witho".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style:
                            AppStyle.txtUrbanistRomanMedium16WhiteA700.copyWith(
                          letterSpacing: getHorizontalSize(
                            0.2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 4,
                  right: 25,
                ),
                child: Row(
                  children: [
                    CustomImageView(
                      svgPath: ImageConstant.imgCheckmark2,
                      height: getSize(
                        32,
                      ),
                      width: getSize(
                        32,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 20,
                        top: 7,
                        bottom: 4,
                      ),
                      child: Text(
                        "msg_shuffle_play".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style:
                            AppStyle.txtUrbanistRomanMedium16WhiteA700.copyWith(
                          letterSpacing: getHorizontalSize(
                            0.2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
