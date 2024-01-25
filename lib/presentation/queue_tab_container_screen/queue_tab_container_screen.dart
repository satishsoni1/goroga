import 'package:google_fonts/google_fonts.dart';

import 'controller/queue_tab_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/downloaded_page/downloaded_page.dart';
import 'package:goroga/presentation/queue_page/queue_page.dart';
import 'package:goroga/presentation/your_likes_page/your_likes_page.dart';
import 'package:goroga/widgets/app_bar/appbar_image.dart';
import 'package:goroga/widgets/app_bar/appbar_title.dart';
import 'package:goroga/widgets/app_bar/custom_app_bar.dart';

class QueueTabContainerScreen extends GetWidget<QueueTabContainerController> {
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
                      onTapArrowleft27();
                    }),
                title: AppbarTitle(
                    text: "lbl_podcasts".tr, margin: getMargin(left: 16)),
                actions: [
                  AppbarImage(
                      height: getSize(28),
                      width: getSize(28),
                      svgPath: ImageConstant.imgSearch,
                      margin: getMargin(left: 24)),
                  AppbarImage(
                      height: getSize(28),
                      width: getSize(28),
                      svgPath: ImageConstant.imgClock28x28,
                      margin: getMargin(left: 20, right: 24))
                ]),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: getPadding(top: 42),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: getVerticalSize(39),
                                  width: double.maxFinite,
                                  child: TabBar(
                                      controller: controller.group244Controller,
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
                                            child: Text("lbl_your_likes".tr,
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        Tab(
                                            child: Text("lbl_queue".tr,
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        Tab(
                                            child: Text("lbl_downloaded".tr,
                                                overflow:
                                                    TextOverflow.ellipsis))
                                      ])),
                              Container(
                                  height: getVerticalSize(797),
                                  child: TabBarView(
                                      controller: controller.group244Controller,
                                      children: [
                                        YourLikesPage(),
                                        QueuePage(),
                                        DownloadedPage()
                                      ]))
                            ]))))));
  }

  onTapArrowleft27() {
    Get.back();
  }
}
