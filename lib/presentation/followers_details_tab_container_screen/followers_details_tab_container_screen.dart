import 'package:google_fonts/google_fonts.dart';

import 'controller/followers_details_tab_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/followers_details_page/followers_details_page.dart';
import 'package:goroga/widgets/app_bar/appbar_image.dart';
import 'package:goroga/widgets/app_bar/custom_app_bar.dart';

class FollowersDetailsTabContainerScreen
    extends GetWidget<FollowersDetailsTabContainerController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(50),
                leadingWidth: 52,
                leading: AppbarImage(
                    height: getSize(28),
                    width: getSize(28),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 24, top: 11, bottom: 11),
                    onTap: () {
                      onTapArrowleft22();
                    }),
                actions: [
                  AppbarImage(
                      height: getSize(28),
                      width: getSize(28),
                      svgPath: ImageConstant.imgSearch,
                      margin: getMargin(left: 24, top: 11, right: 11)),
                  AppbarImage(
                      height: getSize(28),
                      width: getSize(28),
                      svgPath: ImageConstant.imgClock28x28,
                      margin: getMargin(left: 20, top: 11, right: 35))
                ]),
            body: Container(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: getVerticalSize(39),
                          width: double.maxFinite,
                          margin: getMargin(top: 25),
                          child: TabBar(
                              controller: controller.group44Controller,
                              labelColor: ColorConstant.redA70002,
                              labelStyle: TextStyle(
                                  fontSize: getFontSize(18),
    fontFamily: GoogleFonts.nunito().fontFamily,
                                  fontWeight: FontWeight.w600),
                              unselectedLabelColor: ColorConstant.gray500,
                              unselectedLabelStyle: TextStyle(
                                  fontSize: getFontSize(18),
    fontFamily: GoogleFonts.nunito().fontFamily,
                                  fontWeight: FontWeight.w600),
                              indicatorColor: ColorConstant.redA70002,
                              tabs: [
                                Tab(
                                    child: Text("lbl_followers".tr,
                                        overflow: TextOverflow.ellipsis)),
                                Tab(
                                    child: Text("lbl_following".tr,
                                        overflow: TextOverflow.ellipsis))
                              ])),
                      Container(
                          height: getVerticalSize(767),
                          child: TabBarView(
                              controller: controller.group44Controller,
                              children: [
                                FollowersDetailsPage(),
                                FollowersDetailsPage()
                              ]))
                    ]))));
  }

  onTapArrowleft22() {
    Get.back();
  }
}
