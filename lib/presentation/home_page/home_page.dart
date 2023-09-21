import '../home_page/widgets/listloremipsumdolor_item_widget.dart';
import '../home_page/widgets/listname_item_widget.dart';
import 'controller/home_controller.dart';
import 'models/home_model.dart';
import 'models/listloremipsumdolor_item_model.dart';
import 'models/listname_item_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/app_bar/appbar_image.dart';
import 'package:goroga/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatelessWidget {
  HomeController controller = Get.put(HomeController(HomeModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(51),
                leadingWidth: 72,
                leading: CustomImageView(
                    imagePath: ImageConstant.imgEllipse48x481,
                    height: getSize(48),
                    width: getSize(48),
                    radius: BorderRadius.circular(getHorizontalSize(24)),
                    margin: getMargin(left: 24, bottom: 1)),
                title: Padding(
                    padding: getPadding(left: 16),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: getPadding(right: 18),
                                  child: Text("lbl_good_morning".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtUrbanistRegular16Gray600
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(0.2))))),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: getPadding(top: 6),
                                  child: Text("lbl_andrew_ainsley".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtUrbanistRomanBold20)))
                        ])),
                actions: [
                  AppbarImage(
                      height: getSize(28),
                      width: getSize(28),
                      svgPath: ImageConstant.imgSearch,
                      margin: getMargin(left: 24, top: 10, right: 11)),
                  AppbarImage(
                      height: getSize(28),
                      width: getSize(28),
                      svgPath: ImageConstant.imgLightbulb,
                      margin: getMargin(left: 20, top: 10, right: 35))
                ]),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: getPadding(left: 24, top: 29),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: getPadding(right: 24),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: getPadding(top: 1),
                                            child: Text("lbl_trending_now".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtUrbanistRomanBold24)),
                                        GestureDetector(
                                            onTap: () {
                                              onTapTxtSeeAll();
                                            },
                                            child: Padding(
                                                padding: getPadding(bottom: 10),
                                                child: Text("lbl_see_all".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtUrbanistRomanBold16RedA70002
                                                        .copyWith(
                                                            letterSpacing:
                                                                getHorizontalSize(
                                                                    0.2)))))
                                      ])),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                      height: getVerticalSize(229),
                                      child: Obx(() => ListView.separated(
                                          padding: getPadding(top: 13),
                                          scrollDirection: Axis.horizontal,
                                          separatorBuilder: (context, index) {
                                            return SizedBox(
                                                height: getVerticalSize(12));
                                          },
                                          itemCount: controller
                                              .homeModelObj
                                              .value
                                              .listloremipsumdolorItemList
                                              .value
                                              .length,
                                          itemBuilder: (context, index) {
                                            ListloremipsumdolorItemModel model =
                                                controller
                                                    .homeModelObj
                                                    .value
                                                    .listloremipsumdolorItemList
                                                    .value[index];
                                            return ListloremipsumdolorItemWidget(
                                                model);
                                          })))),
                              Padding(
                                  padding: getPadding(top: 35, right: 24),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("lbl_popular_artists".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtUrbanistRomanBold24),
                                        GestureDetector(
                                            onTap: () {
                                              onTapTxtSeeAllOne();
                                            },
                                            child: Padding(
                                                padding: getPadding(
                                                    top: 1, bottom: 7),
                                                child: Text("lbl_see_all".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtUrbanistRomanBold16RedA70002
                                                        .copyWith(
                                                            letterSpacing:
                                                                getHorizontalSize(
                                                                    0.2)))))
                                      ])),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                      height: getVerticalSize(206),
                                      child: Obx(() => ListView.separated(
                                          padding: getPadding(top: 13),
                                          scrollDirection: Axis.horizontal,
                                          separatorBuilder: (context, index) {
                                            return SizedBox(
                                                height: getVerticalSize(12));
                                          },
                                          itemCount: controller
                                              .homeModelObj
                                              .value
                                              .listnameItemList
                                              .value
                                              .length,
                                          itemBuilder: (context, index) {
                                            ListnameItemModel model = controller
                                                .homeModelObj
                                                .value
                                                .listnameItemList
                                                .value[index];
                                            return ListnameItemWidget(model);
                                          })))),
                              // Padding(
                              //     padding: getPadding(top: 32, right: 24),
                              //     child: Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.spaceBetween,
                              //         crossAxisAlignment:
                              //             CrossAxisAlignment.start,
                              //         children: [
                              //           Padding(
                              //               padding: getPadding(top: 1),
                              //               child: Text("lbl_top_charts".tr,
                              //                   overflow: TextOverflow.ellipsis,
                              //                   textAlign: TextAlign.left,
                              //                   style: AppStyle
                              //                       .txtUrbanistRomanBold24)),
                              //           Padding(
                              //               padding: getPadding(bottom: 10),
                              //               child: Text("lbl_see_all".tr,
                              //                   overflow: TextOverflow.ellipsis,
                              //                   textAlign: TextAlign.left,
                              //                   style: AppStyle
                              //                       .txtUrbanistRomanBold16RedA70002
                              //                       .copyWith(
                              //                           letterSpacing:
                              //                               getHorizontalSize(
                              //                                   0.2))))
                              //         ])),
                              /*
                              SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  padding: getPadding(top: 13),
                                  child: IntrinsicWidth(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                        Expanded(
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                              Padding(
                                                  padding:
                                                      getPadding(bottom: 25),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                            height:
                                                                getSize(160),
                                                            width: getSize(160),
                                                            child: Stack(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                children: [
                                                                  CustomImageView(
                                                                      imagePath:
                                                                          ImageConstant
                                                                              .imgImage160x1607,
                                                                      height:
                                                                          getSize(
                                                                              160),
                                                                      width: getSize(
                                                                          160),
                                                                      radius: BorderRadius.circular(
                                                                          getHorizontalSize(
                                                                              24)),
                                                                      alignment:
                                                                          Alignment
                                                                              .center),
                                                                  Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child: Padding(
                                                                          padding: getPadding(left: 20, right: 20),
                                                                          child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, children: [
                                                                            Text("lbl_top_100".tr,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                textAlign: TextAlign.left,
                                                                                style: AppStyle.txtUrbanistRomanBold24WhiteA700),
                                                                            Padding(
                                                                                padding: getPadding(top: 15),
                                                                                child: SizedBox(width: getHorizontalSize(120), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray100))),
                                                                            Padding(
                                                                                padding: getPadding(top: 14),
                                                                                child: Text("lbl_global".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtUrbanistRomanBold12.copyWith(letterSpacing: getHorizontalSize(0.2))))
                                                                          ])))
                                                                ])),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 9),
                                                            child: Text(
                                                                "msg_top_100_globa"
                                                                    .tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtUrbanistRomanBold18
                                                                    .copyWith(
                                                                        letterSpacing:
                                                                            getHorizontalSize(0.2))))
                                                      ])),
                                              Padding(
                                                  padding: getPadding(left: 12),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                            height:
                                                                getSize(160),
                                                            width: getSize(160),
                                                            child: Stack(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                children: [
                                                                  CustomImageView(
                                                                      imagePath:
                                                                          ImageConstant
                                                                              .imgImage160x1608,
                                                                      height:
                                                                          getSize(
                                                                              160),
                                                                      width: getSize(
                                                                          160),
                                                                      radius: BorderRadius.circular(
                                                                          getHorizontalSize(
                                                                              24)),
                                                                      alignment:
                                                                          Alignment
                                                                              .center),
                                                                  Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child: Padding(
                                                                          padding: getPadding(left: 20, right: 20),
                                                                          child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, children: [
                                                                            Text("lbl_top_50".tr,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                textAlign: TextAlign.left,
                                                                                style: AppStyle.txtUrbanistRomanBold24WhiteA700),
                                                                            Padding(
                                                                                padding: getPadding(top: 15),
                                                                                child: SizedBox(width: getHorizontalSize(120), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray100))),
                                                                            Padding(
                                                                                padding: getPadding(top: 14),
                                                                                child: Text("lbl_united_states".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtUrbanistRomanBold12.copyWith(letterSpacing: getHorizontalSize(0.2))))
                                                                          ])))
                                                                ])),
                                                        Container(
                                                            width:
                                                                getHorizontalSize(
                                                                    139),
                                                            margin: getMargin(
                                                                top: 9),
                                                            child: Text(
                                                                "msg_top_100_unite"
                                                                    .tr,
                                                                maxLines: null,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtUrbanistRomanBold18
                                                                    .copyWith(
                                                                        letterSpacing:
                                                                            getHorizontalSize(0.2))))
                                                      ]))
                                            ])),
                                        Padding(
                                            padding: getPadding(left: 12),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      height: getSize(160),
                                                      width: getSize(160),
                                                      child: Stack(
                                                          alignment:
                                                              Alignment.center,
                                                          children: [
                                                            CustomImageView(
                                                                imagePath:
                                                                    ImageConstant
                                                                        .imgImage160x1609,
                                                                height: getSize(
                                                                    160),
                                                                width: getSize(
                                                                    160),
                                                                radius: BorderRadius
                                                                    .circular(
                                                                        getHorizontalSize(
                                                                            24)),
                                                                alignment:
                                                                    Alignment
                                                                        .center),
                                                            Align(
                                                                alignment: Alignment
                                                                    .center,
                                                                child: Text(
                                                                    "lbl_top_hits"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: AppStyle
                                                                        .txtUrbanistRomanBold24WhiteA700))
                                                          ])),
                                                  Container(
                                                      width: getHorizontalSize(
                                                          160),
                                                      margin: getMargin(top: 9),
                                                      child: Text(
                                                          "msg_top_hits_indo"
                                                              .tr,
                                                          maxLines: null,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtUrbanistRomanBold18
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.2))))
                                                ]))
                                      ])))
                                      */
                            ]))))));
  }

  onTapTxtSeeAll() {
    Get.toNamed(
      AppRoutes.trendingNowScreen,
    );
  }

  onTapTxtSeeAllOne() {
    Get.toNamed(
      AppRoutes.popularArtistsScreen,
    );
  }
}
