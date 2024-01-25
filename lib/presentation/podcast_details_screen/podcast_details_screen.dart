import 'controller/podcast_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/app_bar/appbar_image.dart';
import 'package:goroga/widgets/app_bar/custom_app_bar.dart';

class PodcastDetailsScreen extends GetWidget<PodcastDetailsController> {
  bool isFavorite = false;
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
                      onTapArrowleft18();
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
                                imagePath: ImageConstant.imgImage91x81,
                                height: getSize(250),
                                width: getSize(250),
                                // radius: BorderRadius.circular(
                                //     getHorizontalSize(125))
                              ),
                              Padding(
                                  padding: getPadding(top: 14),
                                  child: Text("lbl_ariana_grande".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtUrbanistRomanBold32)),
                              Padding(
                                  padding: getPadding(top: 15),
                                  child: Text("msg_55_278_829_mont".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtUrbanistRomanMedium18Gray80001
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(0.2)))),
                              Padding(
                                  padding: getPadding(top: 15),
                                  child: IconButton(
                                    onPressed: () {
                                      controller.toggleFavorite();
                                      print("object");
                                    },
                                    icon: Icon(
                                      controller.isFavorite.value
                                          ? Icons.favorite
                                          : Icons.favorite_outline_rounded,
                                      color: controller.isFavorite.value
                                          ? Colors.red
                                          : null,
                                    ),
                                  )),
                              // Align(
                              //     alignment: Alignment.centerLeft,
                              //     child: Padding(
                              //         padding: getPadding(top: 19, right: 111),
                              //         child: Row(children: [
                              //           CustomButton(
                              //               height: getVerticalSize(45),
                              //               width: getHorizontalSize(101),
                              //               text: "lbl_follow".tr,
                              //               shape: ButtonShape.RoundedBorder22,
                              //               padding: ButtonPadding.PaddingAll11,
                              //               fontStyle: ButtonFontStyle
                              //                   .UrbanistRomanBold18WhiteA700),
                              //           CustomImageView(
                              //               svgPath: ImageConstant.imgLightbulb,
                              //               height: getSize(24),
                              //               width: getSize(24),
                              //               margin: getMargin(
                              //                   left: 32, top: 10, bottom: 10)),
                              //           CustomImageView(
                              //               svgPath: ImageConstant.imgShare,
                              //               height: getSize(24),
                              //               width: getSize(24),
                              //               margin: getMargin(
                              //                   left: 32, top: 10, bottom: 10)),
                              //           CustomImageView(
                              //               svgPath:
                              //                   ImageConstant.imgOverflowmenu,
                              //               height: getSize(24),
                              //               width: getSize(24),
                              //               margin: getMargin(
                              //                   left: 32, top: 10, bottom: 10))
                              //         ]))),
                              // Align(
                              //     alignment: Alignment.centerLeft,
                              //     child: GestureDetector(
                              //         onTap: () {
                              //           onTapTxtLoremipsumdol();
                              //         },
                              //         child: Container(
                              //             width: getHorizontalSize(366),
                              //             margin: getMargin(top: 21, right: 13),
                              //             child: RichText(
                              //                 text: TextSpan(children: [
                              //                   TextSpan(
                              //                       text: "msg_lorem_ipsum_dol2"
                              //                           .tr,
                              //                       style: TextStyle(
                              //                           color: ColorConstant
                              //                               .gray80001,
                              //                           fontSize:
                              //                               getFontSize(16),
                              //                           fontWeight:
                              //                               FontWeight.w500,
                              //                           letterSpacing:
                              //                               getHorizontalSize(
                              //                                   0.2))),
                              //                   TextSpan(
                              //                       text: "lbl_view_more".tr,
                              //                       style: TextStyle(
                              //                           color: ColorConstant
                              //                               .redA70002,
                              //                           fontSize:
                              //                               getFontSize(16),
                              //                           
                              //                           fontWeight:
                              //                               FontWeight.w500,
                              //                           letterSpacing:
                              //                               getHorizontalSize(
                              //                                   0.2)))
                              //                 ]),
                              //                 textAlign: TextAlign.left)))),
                              // Padding(
                              //     padding: getPadding(top: 21),
                              //     child: Divider(
                              //         height: getVerticalSize(1),
                              //         thickness: getVerticalSize(1),
                              //         color: ColorConstant.blueGray100)),
                              // Padding(
                              //     padding: getPadding(top: 24),
                              //     child: Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.spaceBetween,
                              //         crossAxisAlignment:
                              //             CrossAxisAlignment.start,
                              //         children: [
                              //           Padding(
                              //               padding: getPadding(top: 1),
                              //               child: Text("lbl_episodes".tr,
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
                              // Padding(
                              //     padding: getPadding(top: 21),
                              //     child: Obx(() => ListView.separated(
                              //         physics: NeverScrollableScrollPhysics(),
                              //         shrinkWrap: true,
                              //         separatorBuilder: (context, index) {
                              //           return SizedBox(
                              //               height: getVerticalSize(24));
                              //         },
                              //         itemCount: controller
                              //             .podcastDetailsModelObj
                              //             .value
                              //             .listpodcasttitle2ItemList
                              //             .value
                              //             .length,
                              //         itemBuilder: (context, index) {
                              //           Listpodcasttitle2ItemModel model =
                              //               controller
                              //                   .podcastDetailsModelObj
                              //                   .value
                              //                   .listpodcasttitle2ItemList
                              //                   .value[index];
                              //           return Listpodcasttitle2ItemWidget(
                              //               model);
                              //         })))
                            ]))))));
  }

  onTapTxtLoremipsumdol() {
    Get.toNamed(
      AppRoutes.podcastEpisodeDetailsScreen,
    );
  }

  onTapArrowleft18() {
    Get.back();
  }
}
