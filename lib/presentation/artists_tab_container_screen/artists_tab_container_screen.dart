import 'package:google_fonts/google_fonts.dart';

import 'controller/artists_tab_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/artists_page/artists_page.dart';
import 'package:goroga/presentation/podcasters_page/podcasters_page.dart';
import 'package:goroga/widgets/app_bar/appbar_image.dart';
import 'package:goroga/widgets/app_bar/appbar_title.dart';
import 'package:goroga/widgets/app_bar/custom_app_bar.dart';

class ArtistsTabContainerScreen
    extends GetWidget<ArtistsTabContainerController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(39),
                leadingWidth: 52,
                leading: AppbarImage(
                    height: getSize(28),
                    width: getSize(28),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 24, bottom: 1),
                    onTap: () {
                      onTapArrowleft30();
                    }),
                title: AppbarTitle(
                    text: "lbl_artists".tr, margin: getMargin(left: 16)),
                actions: [
                  AppbarImage(
                      height: getSize(28),
                      width: getSize(28),
                      svgPath: ImageConstant.imgSearch,
                      margin: getMargin(left: 24, right: 1)),
                  AppbarImage(
                      height: getSize(28),
                      width: getSize(28),
                      svgPath: ImageConstant.imgClock28x28,
                      margin: getMargin(left: 20, right: 25))
                ]),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: getPadding(top: 36),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: getVerticalSize(39),
                                  width: double.maxFinite,
                                  child: TabBar(
                                      controller: controller.group44Controller,
                                      labelColor: ColorConstant.redA70002,
                                      labelStyle: TextStyle(
                                          fontSize: getFontSize(18),
    fontFamily: GoogleFonts.nunito().fontFamily,
                                          fontWeight: FontWeight.w600),
                                      unselectedLabelColor:
                                          ColorConstant.gray500,
                                      unselectedLabelStyle: TextStyle(
                                          fontSize: getFontSize(18),
    fontFamily: GoogleFonts.nunito().fontFamily,
                                          fontWeight: FontWeight.w600),
                                      indicatorColor: ColorConstant.redA70002,
                                      tabs: [
                                        Tab(
                                            child: Text("lbl_singers".tr,
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        Tab(
                                            child: Text("lbl_podcasters".tr,
                                                overflow:
                                                    TextOverflow.ellipsis))
                                      ])),
                              Container(
                                  height: getVerticalSize(831),
                                  child: TabBarView(
                                      controller: controller.group44Controller,
                                      children: [
                                        ArtistsPage(),
                                        PodcastersPage()
                                      ]))
                            ]))))));
  }

  onTapArrowleft30() {
    Get.back();
  }
}
