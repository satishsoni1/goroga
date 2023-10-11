import '../playlist_details_one_screen/widgets/listartistname_item_widget.dart';
import 'controller/playlist_details_one_controller.dart';
import 'models/listartistname_item_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/app_bar/appbar_image.dart';
import 'package:goroga/widgets/app_bar/custom_app_bar.dart';
import 'package:goroga/widgets/custom_button.dart';

class PlaylistDetailsOneScreen extends GetWidget<PlaylistDetailsOneController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(48),
                leadingWidth: 52,
                leading: AppbarImage(
                    height: getSize(28),
                    width: getSize(28),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 24, top: 10, bottom: 10),
                    onTap: () {
                      onTapArrowleft20();
                    }),
                actions: [
                  AppbarImage(
                      height: getSize(28),
                      width: getSize(28),
                      svgPath: ImageConstant.imgClock28x28,
                      margin:
                          getMargin(left: 24, top: 10, right: 24, bottom: 10))
                ]),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, top: 18, right: 24, bottom: 18),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgImage184x18419,
                          height: getVerticalSize(256),
                          width: getHorizontalSize(250),
                          radius: BorderRadius.circular(getHorizontalSize(28))),
                      Padding(
                          padding: getPadding(top: 19),
                          child: Text("lbl_sweetener".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtUrbanistRomanBold32)),
                      Padding(
                          padding: getPadding(top: 12),
                          child: Text("lbl_ariana_grande".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtUrbanistRomanMedium18Gray80001
                                  .copyWith(
                                      letterSpacing: getHorizontalSize(0.2)))),
                      Padding(
                          padding: getPadding(top: 15),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: getPadding(top: 1),
                                    child: Text("lbl_playlist".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtUrbanistRomanMedium14Gray700
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.2)))),
                                Padding(
                                    padding: getPadding(left: 12, top: 1),
                                    child: Text("lbl".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtUrbanistRomanMedium14Gray700
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.2)))),
                                Padding(
                                    padding: getPadding(left: 12, bottom: 1),
                                    child: Text("lbl_2022".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtUrbanistRomanMedium14Gray700
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.2))))
                              ])),
                      Padding(
                          padding: getPadding(top: 12),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgFavorite,
                                    height: getSize(24),
                                    width: getSize(24),
                                    margin: getMargin(top: 10, bottom: 11)),
                                CustomImageView(
                                    svgPath: ImageConstant.imgSort,
                                    height: getSize(24),
                                    width: getSize(24),
                                    margin: getMargin(
                                        left: 32, top: 10, bottom: 11)),
                                CustomImageView(
                                    svgPath: ImageConstant.imgArrowdown2,
                                    height: getSize(24),
                                    width: getSize(24),
                                    margin: getMargin(
                                        left: 32, top: 10, bottom: 11)),
                                CustomImageView(
                                    svgPath: ImageConstant.imgOverflowmenu,
                                    height: getSize(24),
                                    width: getSize(24),
                                    margin: getMargin(
                                        left: 32, top: 10, bottom: 11)),
                                Spacer(),
                                CustomButton(
                                    height: getVerticalSize(46),
                                    width: getHorizontalSize(112),
                                    text: "lbl_play".tr,
                                    shape: ButtonShape.RoundedBorder22,
                                    padding: ButtonPadding.PaddingT9,
                                    fontStyle: ButtonFontStyle
                                        .UrbanistRomanBold18WhiteA700,
                                    prefixWidget: Container(
                                        margin: getMargin(right: 8),
                                        child: CustomImageView(
                                            svgPath: ImageConstant.imgPlay1)))
                              ])),
                      Padding(
                          padding: getPadding(top: 22),
                          child: Divider(
                              height: getVerticalSize(1),
                              thickness: getVerticalSize(1),
                              color: ColorConstant.blueGray100)),
                      Padding(
                          padding: getPadding(top: 25),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("lbl_songs".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtUrbanistRomanBold24),
                                Padding(
                                    padding: getPadding(top: 2, bottom: 6),
                                    child: Text("lbl_see_all".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtUrbanistRomanBold16RedA70002
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.2))))
                              ])),
                      Padding(
                          padding: getPadding(top: 21),
                          child: Obx(() => ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: getVerticalSize(16));
                              },
                              itemCount: controller.playlistDetailsOneModelObj
                                  .value.listartistnameItemList.value.length,
                              itemBuilder: (context, index) {
                                ListartistnameItemModel model = controller
                                    .playlistDetailsOneModelObj
                                    .value
                                    .listartistnameItemList
                                    .value[index];
                                return ListartistnameItemWidget(model);
                              })))
                    ]))));
  }

  onTapArrowleft20() {
    Get.back();
  }
}
