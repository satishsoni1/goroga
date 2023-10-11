import 'controller/profile_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/app_bar/appbar_image.dart';
import 'package:goroga/widgets/app_bar/custom_app_bar.dart';
import 'package:goroga/widgets/custom_button.dart';

class ProfileDetailsScreen extends GetWidget<ProfileDetailsController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(38),
                leadingWidth: 52,
                leading: AppbarImage(
                    height: getSize(28),
                    width: getSize(28),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 24),
                    onTap: () {
                      onTapArrowleft21();
                    }),
                actions: [
                  AppbarImage(
                      height: getSize(28),
                      width: getSize(28),
                      svgPath: ImageConstant.imgClock28x28,
                      margin: getMargin(left: 24, right: 24))
                ]),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding:
                            getPadding(left: 24, top: 42, right: 24, bottom: 5),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgEllipse1,
                                  height: getSize(250),
                                  width: getSize(250),
                                  radius: BorderRadius.circular(
                                      getHorizontalSize(125))),
                              Padding(
                                  padding: getPadding(top: 29),
                                  child: Text("lbl_jenny_wilson".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtUrbanistRomanBold32)),
                              CustomButton(
                                  height: getVerticalSize(45),
                                  width: getHorizontalSize(101),
                                  text: "lbl_follow".tr,
                                  margin: getMargin(top: 16),
                                  shape: ButtonShape.RoundedBorder22,
                                  padding: ButtonPadding.PaddingAll11,
                                  fontStyle: ButtonFontStyle
                                      .UrbanistRomanBold18WhiteA700),
                              Padding(
                                  padding: getPadding(top: 20),
                                  child: Divider(
                                      height: getVerticalSize(1),
                                      thickness: getVerticalSize(1),
                                      color: ColorConstant.blueGray100)),
                              Padding(
                                  padding: getPadding(top: 11),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              onTapColumn9489();
                                            },
                                            child: Padding(
                                                padding: getPadding(bottom: 2),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text("lbl_9_489".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtUrbanistRomanBold24),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 8),
                                                          child: Text(
                                                              "lbl_followers"
                                                                  .tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtUrbanistRomanMedium18Gray700
                                                                  .copyWith(
                                                                      letterSpacing:
                                                                          getHorizontalSize(
                                                                              0.2))))
                                                    ]))),
                                        Padding(
                                            padding: getPadding(left: 70),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text("lbl_2_475".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtUrbanistRomanBold24),
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 10),
                                                      child: Text(
                                                          "lbl_following".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtUrbanistRomanMedium18Gray700
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.2))))
                                                ]))
                                      ])),
                              Padding(
                                  padding: getPadding(top: 29),
                                  child: Divider(
                                      height: getVerticalSize(1),
                                      thickness: getVerticalSize(1),
                                      color: ColorConstant.blueGray100)),
                              Padding(
                                  padding: getPadding(top: 15),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("lbl_playlists".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtUrbanistRomanBold24),
                                        Padding(
                                            padding:
                                                getPadding(top: 2, bottom: 6),
                                            child: Text("lbl_see_all".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtUrbanistRomanBold16RedA70002
                                                    .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.2))))
                                      ])),
                              Padding(
                                  padding: getPadding(top: 13),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: Padding(
                                                padding: getPadding(right: 6),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      CustomImageView(
                                                          imagePath: ImageConstant
                                                              .imgImage116x1162,
                                                          height: getSize(184),
                                                          width: getSize(184),
                                                          radius: BorderRadius
                                                              .circular(
                                                                  getHorizontalSize(
                                                                      20))),
                                                      Container(
                                                          width:
                                                              getHorizontalSize(
                                                                  162),
                                                          margin: getMargin(
                                                              top: 13),
                                                          child: Text(
                                                              "msg_ariana_grande"
                                                                  .tr,
                                                              maxLines: null,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtUrbanistRomanBold18
                                                                  .copyWith(
                                                                      letterSpacing:
                                                                          getHorizontalSize(
                                                                              0.2))))
                                                    ]))),
                                        Expanded(
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 6, bottom: 4),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      CustomImageView(
                                                          imagePath: ImageConstant
                                                              .imgImage116x1161,
                                                          height: getSize(184),
                                                          width: getSize(184),
                                                          radius: BorderRadius
                                                              .circular(
                                                                  getHorizontalSize(
                                                                      20))),
                                                      Container(
                                                          width:
                                                              getHorizontalSize(
                                                                  172),
                                                          margin: getMargin(
                                                              top: 13),
                                                          child: Text(
                                                              "msg_ariana_grande2"
                                                                  .tr,
                                                              maxLines: null,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtUrbanistRomanBold18
                                                                  .copyWith(
                                                                      letterSpacing:
                                                                          getHorizontalSize(
                                                                              0.2))))
                                                    ])))
                                      ]))
                            ]))))));
  }

  onTapColumn9489() {
    Get.toNamed(
      AppRoutes.followersDetailsTabContainerScreen,
    );
  }

  onTapArrowleft21() {
    Get.back();
  }
}
