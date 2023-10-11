import '../popular_artists_screen/widgets/gridname_item_widget.dart';
import 'controller/popular_artists_controller.dart';
import 'models/gridname_item_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/app_bar/appbar_image.dart';
import 'package:goroga/widgets/app_bar/appbar_title.dart';
import 'package:goroga/widgets/app_bar/custom_app_bar.dart';

class PopularArtistsScreen extends GetWidget<PopularArtistsController> {
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
                      onTapArrowleft9();
                    }),
                title: AppbarTitle(
                    text: "lbl_popular_artists".tr,
                    margin: getMargin(left: 16)),
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
                                      mainAxisExtent: getVerticalSize(220),
                                      crossAxisCount: 2,
                                      mainAxisSpacing: getHorizontalSize(12),
                                      crossAxisSpacing: getHorizontalSize(12)),
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.popularArtistsModelObj.value
                                  .gridnameItemList.value.length,
                              itemBuilder: (context, index) {
                                GridnameItemModel model = controller
                                    .popularArtistsModelObj
                                    .value
                                    .gridnameItemList
                                    .value[index];
                                return GridnameItemWidget(model);
                              }))
                        ])))));
  }

  onTapArrowleft9() {
    Get.back();
  }
}
