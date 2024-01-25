import 'package:google_fonts/google_fonts.dart';

import 'controller/history_podcast_tab_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/history_music_page/history_music_page.dart';
import 'package:goroga/presentation/history_podcast_page/history_podcast_page.dart';
import 'package:goroga/widgets/app_bar/appbar_image.dart';
import 'package:goroga/widgets/app_bar/appbar_title.dart';
import 'package:goroga/widgets/app_bar/custom_app_bar.dart';

class HistoryPodcastTabContainerScreen
    extends GetWidget<HistoryPodcastTabContainerController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(52),
                leadingWidth: 52,
                leading: AppbarImage(
                    height: getSize(28),
                    width: getSize(28),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 24, top: 10, bottom: 14),
                    onTap: () {
                      onTapArrowleft23();
                    }),
                title: AppbarTitle(
                    text: "lbl_history".tr, margin: getMargin(left: 16)),
                actions: [
                  AppbarImage(
                      height: getSize(28),
                      width: getSize(28),
                      svgPath: ImageConstant.imgSearch,
                      margin: getMargin(left: 24, top: 10, right: 14)),
                  AppbarImage(
                      height: getSize(28),
                      width: getSize(28),
                      svgPath: ImageConstant.imgClock28x28,
                      margin: getMargin(left: 20, top: 10, right: 38))
                ]),
            body: Container(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: getVerticalSize(39),
                          width: double.maxFinite,
                          margin: getMargin(top: 29),
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
                                    child: Text("lbl_songs".tr,
                                        overflow: TextOverflow.ellipsis)),
                                Tab(
                                    child: Text("lbl_podcasts".tr,
                                        overflow: TextOverflow.ellipsis))
                              ])),
                      Container(
                          height: getVerticalSize(761),
                          child: TabBarView(
                              controller: controller.group44Controller,
                              children: [
                                HistoryMusicPage(),
                                HistoryPodcastPage()
                              ]))
                    ]))));
  }

  onTapArrowleft23() {
    Get.back();
  }
}
