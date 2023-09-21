import 'controller/profile_settings_controller.dart';
import 'models/profile_settings_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/app_bar/appbar_image.dart';
import 'package:goroga/widgets/app_bar/appbar_title.dart';
import 'package:goroga/widgets/app_bar/custom_app_bar.dart';
import 'package:goroga/widgets/custom_button.dart';
import 'package:goroga/widgets/custom_switch.dart';

// ignore_for_file: must_be_immutable
class ProfileSettingsPage extends StatelessWidget {
  ProfileSettingsController controller =
      Get.put(ProfileSettingsController(ProfileSettingsModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(41),
                // leadingWidth: 56,
                // leading: AppbarImage(
                //     height: getSize(32),
                //     width: getSize(32),
                //     svgPath: ImageConstant.imgVectorRedA700102x102,
                //     margin: getMargin(left: 24)),
                title: AppbarTitle(
                    text: "lbl_profile".tr, margin: getMargin(left: 16)),
                actions: [
                  AppbarImage(
                      height: getSize(28),
                      width: getSize(28),
                      svgPath: ImageConstant.imgClock28x28,
                      margin: getMargin(left: 24, top: 2, right: 24, bottom: 2))
                ]),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: getPadding(left: 24, top: 39, right: 24),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(children: [
                                Container(
                                    height: getSize(80),
                                    width: getSize(80),
                                    child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgEllipse80x80,
                                              height: getSize(80),
                                              width: getSize(80),
                                              radius: BorderRadius.circular(
                                                  getHorizontalSize(40)),
                                              alignment: Alignment.center),
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgEdit20x20,
                                              height: getSize(20),
                                              width: getSize(20),
                                              alignment: Alignment.bottomRight)
                                        ])),
                                Padding(
                                    padding: getPadding(
                                        left: 20, top: 16, bottom: 14),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("lbl_andrew_ainsley".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtUrbanistRomanBold20),
                                          Padding(
                                              padding: getPadding(top: 8),
                                              child: Text(
                                                  "lbl_user_domain_com".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtUrbanistSemiBold14Gray900
                                                      .copyWith(
                                                          letterSpacing:
                                                              getHorizontalSize(
                                                                  0.2))))
                                        ]))
                              ]),
                              Container(
                                  margin: getMargin(top: 23),
                                  padding: getPadding(left: 23, right: 23),
                                  decoration: AppDecoration.fillRedA70002
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .roundedBorder32),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getPadding(
                                                left: 1, top: 30, bottom: 27),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text("msg_enjoy_all_benef".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtUrbanistRomanBold24WhiteA700),
                                                  Container(
                                                      width: getHorizontalSize(
                                                          202),
                                                      margin: getMargin(top: 8),
                                                      child: Text(
                                                          "msg_enjoy_listening"
                                                              .tr,
                                                          maxLines: null,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtUrbanistRegular12
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.2)))),
                                                  CustomButton(
                                                      height:
                                                          getVerticalSize(32),
                                                      width: getHorizontalSize(
                                                          116),
                                                      text:
                                                          "lbl_get_premium".tr,
                                                      margin:
                                                          getMargin(top: 11),
                                                      variant: ButtonVariant
                                                          .FillWhiteA700,
                                                      shape: ButtonShape
                                                          .RoundedBorder16,
                                                      fontStyle: ButtonFontStyle
                                                          .UrbanistSemiBold14RedA70002_1,
                                                      onTap: () {
                                                        onTapGetpremium();
                                                      })
                                                ])),
                                        CustomImageView(
                                            imagePath: ImageConstant
                                                .imgMusicfococlippingstandard169x115,
                                            height: getVerticalSize(169),
                                            width: getHorizontalSize(115),
                                            margin: getMargin(top: 13))
                                      ])),
                              GestureDetector(
                                  onTap: () {
                                    onTapRowuser();
                                  },
                                  child: Padding(
                                      padding: getPadding(top: 24),
                                      child: Row(children: [
                                        CustomImageView(
                                            svgPath: ImageConstant.imgUser20x20,
                                            height: getSize(28),
                                            width: getSize(28)),
                                        Padding(
                                            padding: getPadding(
                                                left: 20, top: 2, bottom: 3),
                                            child: Text("lbl_profile".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtUrbanistSemiBold18Gray900
                                                    .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.2)))),
                                        Spacer(),
                                        CustomImageView(
                                            svgPath: ImageConstant
                                                .imgArrowdownGray90020x20,
                                            height: getSize(20),
                                            width: getSize(20),
                                            margin:
                                                getMargin(top: 4, bottom: 4))
                                      ]))),
                              GestureDetector(
                                  onTap: () {
                                    onTapRowlightbulb();
                                  },
                                  child: Padding(
                                      padding: getPadding(top: 24),
                                      child: Row(children: [
                                        CustomImageView(
                                            svgPath: ImageConstant.imgLightbulb,
                                            height: getSize(28),
                                            width: getSize(28)),
                                        Padding(
                                            padding: getPadding(
                                                left: 20, top: 2, bottom: 3),
                                            child: Text("lbl_notification".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtUrbanistSemiBold18Gray900
                                                    .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.2)))),
                                        Spacer(),
                                        CustomImageView(
                                            svgPath: ImageConstant
                                                .imgArrowdownGray90020x20,
                                            height: getSize(20),
                                            width: getSize(20),
                                            margin:
                                                getMargin(top: 4, bottom: 4))
                                      ]))),
                              GestureDetector(
                                  onTap: () {
                                    onTapRowmicrophone();
                                  },
                                  child: Padding(
                                      padding: getPadding(top: 24),
                                      child: Row(children: [
                                        CustomImageView(
                                            svgPath: ImageConstant
                                                .imgMicrophoneGray900,
                                            height: getSize(28),
                                            width: getSize(28)),
                                        Padding(
                                            padding: getPadding(
                                                left: 20, top: 2, bottom: 3),
                                            child: Text("lbl_audio_video".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtUrbanistSemiBold18Gray900
                                                    .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.2)))),
                                        Spacer(),
                                        CustomImageView(
                                            svgPath: ImageConstant
                                                .imgArrowdownGray90020x20,
                                            height: getSize(20),
                                            width: getSize(20),
                                            margin:
                                                getMargin(top: 4, bottom: 4))
                                      ]))),
                              GestureDetector(
                                  onTap: () {
                                    onTapRowplay();
                                  },
                                  child: Padding(
                                      padding: getPadding(top: 24),
                                      child: Row(children: [
                                        CustomImageView(
                                            svgPath: ImageConstant.imgPlay20x20,
                                            height: getSize(28),
                                            width: getSize(28)),
                                        Padding(
                                            padding: getPadding(
                                                left: 20, top: 5, bottom: 1),
                                            child: Text("lbl_playback".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtUrbanistSemiBold18Gray900
                                                    .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.2)))),
                                        Spacer(),
                                        CustomImageView(
                                            svgPath: ImageConstant
                                                .imgArrowdownGray90020x20,
                                            height: getSize(20),
                                            width: getSize(20),
                                            margin:
                                                getMargin(top: 4, bottom: 4))
                                      ]))),
                              GestureDetector(
                                  onTap: () {
                                    onTapRowcheckmark();
                                  },
                                  child: Padding(
                                      padding: getPadding(top: 24),
                                      child: Row(children: [
                                        CustomImageView(
                                            svgPath:
                                                ImageConstant.imgCheckmark28x28,
                                            height: getSize(28),
                                            width: getSize(28)),
                                        Padding(
                                            padding:
                                                getPadding(left: 20, top: 5),
                                            child: Text("msg_data_saver_st".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtUrbanistSemiBold18Gray900
                                                    .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.2)))),
                                        Spacer(),
                                        CustomImageView(
                                            svgPath: ImageConstant
                                                .imgArrowdownGray90020x20,
                                            height: getSize(20),
                                            width: getSize(20),
                                            margin:
                                                getMargin(top: 4, bottom: 4))
                                      ]))),
                              GestureDetector(
                                  onTap: () {
                                    onTapRowcheckmarkone();
                                  },
                                  child: Padding(
                                      padding: getPadding(top: 24),
                                      child: Row(children: [
                                        CustomImageView(
                                            svgPath:
                                                ImageConstant.imgCheckmark1,
                                            height: getSize(28),
                                            width: getSize(28)),
                                        Padding(
                                            padding:
                                                getPadding(left: 20, top: 5),
                                            child: Text("lbl_security".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtUrbanistSemiBold18Gray900
                                                    .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.2)))),
                                        Spacer(),
                                        CustomImageView(
                                            svgPath: ImageConstant
                                                .imgArrowdownGray90020x20,
                                            height: getSize(20),
                                            width: getSize(20),
                                            margin:
                                                getMargin(top: 4, bottom: 4))
                                      ]))),
                              GestureDetector(
                                  onTap: () {
                                    onTapRowclockone();
                                  },
                                  child: Padding(
                                      padding: getPadding(top: 24),
                                      child: Row(children: [
                                        CustomImageView(
                                            svgPath: ImageConstant.imgClock1,
                                            height: getSize(28),
                                            width: getSize(28)),
                                        Padding(
                                            padding:
                                                getPadding(left: 20, top: 5),
                                            child: Text("lbl_language".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtUrbanistSemiBold18Gray900
                                                    .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.2)))),
                                        Spacer(),
                                        Padding(
                                            padding:
                                                getPadding(top: 5, bottom: 1),
                                            child: Text("lbl_english_us".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtUrbanistSemiBold18Gray900
                                                    .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.2)))),
                                        CustomImageView(
                                            svgPath: ImageConstant
                                                .imgArrowdownGray90020x20,
                                            height: getSize(20),
                                            width: getSize(20),
                                            margin: getMargin(
                                                left: 20, top: 4, bottom: 4))
                                      ]))),
                              Padding(
                                  padding: getPadding(top: 24),
                                  child: Row(children: [
                                    CustomImageView(
                                        svgPath: ImageConstant.imgEye,
                                        height: getSize(28),
                                        width: getSize(28)),
                                    Padding(
                                        padding: getPadding(
                                            left: 20, top: 2, bottom: 3),
                                        child: Text("lbl_dark_mode".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtUrbanistSemiBold18Gray900
                                                .copyWith(
                                                    letterSpacing:
                                                        getHorizontalSize(
                                                            0.2)))),
                                    Spacer(),
                                    Obx(() => CustomSwitch(
                                        margin: getMargin(top: 2, bottom: 2),
                                        value:
                                            controller.isSelectedSwitch.value,
                                        onChanged: (value) {
                                          controller.isSelectedSwitch.value =
                                              value;
                                        }))
                                  ])),
                              Padding(
                                  padding: getPadding(top: 24),
                                  child: Row(children: [
                                    CustomImageView(
                                        svgPath: ImageConstant.imgRefresh,
                                        height: getSize(28),
                                        width: getSize(28)),
                                    Padding(
                                        padding: getPadding(left: 20, top: 5),
                                        child: Text("lbl_logout".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtUrbanistSemiBold18RedA20001
                                                .copyWith(
                                                    letterSpacing:
                                                        getHorizontalSize(
                                                            0.2))))
                                  ]))
                            ]))))));
  }

  onTapGetpremium() {
    Get.toNamed(
      AppRoutes.subscribeScreen,
    );
  }

  onTapRowuser() {
    Get.toNamed(
      AppRoutes.profileDetailsOneScreen,
    );
  }

  onTapRowlightbulb() {
    Get.toNamed(
      AppRoutes.notificationSettingsScreen,
    );
  }

  onTapRowmicrophone() {
    Get.toNamed(
      AppRoutes.audioVideoScreen,
    );
  }

  onTapRowplay() {
    Get.toNamed(
      AppRoutes.playbackScreen,
    );
  }

  onTapRowcheckmark() {
    Get.toNamed(
      AppRoutes.dataSaverStorageScreen,
    );
  }

  onTapRowcheckmarkone() {
    Get.toNamed(
      AppRoutes.securityScreen,
    );
  }

  onTapRowclockone() {
    Get.toNamed(
      AppRoutes.languageScreen,
    );
  }
}
