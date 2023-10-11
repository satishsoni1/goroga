import '../trending_now_screen/widgets/trendingnow_item_widget.dart';
import 'controller/trending_now_controller.dart';
import 'models/trendingnow_item_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/app_bar/appbar_image.dart';
import 'package:goroga/widgets/app_bar/appbar_title.dart';
import 'package:goroga/widgets/app_bar/custom_app_bar.dart';

class TrendingNowScreen extends GetWidget<TrendingNowController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(51),
                leadingWidth: 52,
                leading: AppbarImage(
                    height: getSize(28),
                    width: getSize(28),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 24, top: 10, bottom: 13),
                    onTap: () {
                      onTapArrowleft8();
                    }),
                title: AppbarTitle(
                    text: "lbl_trending_now".tr, margin: getMargin(left: 16)),
                actions: [
                  AppbarImage(
                      height: getSize(28),
                      width: getSize(28),
                      svgPath: ImageConstant.imgSearch,
                      margin:
                          getMargin(left: 24, top: 10, right: 24, bottom: 13))
                ]),
            body: Container(
                width: double.maxFinite,
                child: Container(
                    width: getHorizontalSize(380),
                    margin: getMargin(left: 24, top: 28, right: 24, bottom: 5),
                    decoration: AppDecoration.fillWhiteA700,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx(() => GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: getVerticalSize(245),
                                      crossAxisCount: 2,
                                      mainAxisSpacing: getHorizontalSize(12),
                                      crossAxisSpacing: getHorizontalSize(12)),
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.trendingNowModelObj.value
                                  .trendingnowItemList.value.length,
                              itemBuilder: (context, index) {
                                TrendingnowItemModel model = controller
                                    .trendingNowModelObj
                                    .value
                                    .trendingnowItemList
                                    .value[index];
                                return TrendingnowItemWidget(model);
                              }))
                        ])))));
  }

  onTapArrowleft8() {
    Get.back();
  }
}
