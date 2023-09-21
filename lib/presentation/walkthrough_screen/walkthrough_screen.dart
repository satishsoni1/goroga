import 'controller/walkthrough_controller.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WalkthroughScreen extends GetWidget<WalkthroughController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: ColorConstant.gray50,
            body: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                    color: ColorConstant.gray50,
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgWalkthrough),
                        fit: BoxFit.cover)),
                child: Container(
                    width: double.maxFinite,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Spacer(),
                          Container(
                              width: double.maxFinite,
                              child: Container(
                                  padding: getPadding(
                                      left: 24, top: 46, right: 24, bottom: 46),
                                  decoration: AppDecoration.fillWhiteA700
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .customBorderTL60),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: getHorizontalSize(376),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text:
                                                          "msg_listen_to_the_b2"
                                                              .tr,
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .gray900,
                                                          fontSize:
                                                              getFontSize(40),
                                                          fontFamily:
                                                              'Urbanist',
                                                          fontWeight:
                                                              FontWeight.w700)),
                                                  TextSpan(
                                                      text:
                                                          "lbl_tunecast_now".tr,
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .redA700,
                                                          fontSize:
                                                              getFontSize(40),
                                                          fontFamily:
                                                              'Urbanist',
                                                          fontWeight:
                                                              FontWeight.w700))
                                                ]),
                                                textAlign: TextAlign.center)),
                                        Container(
                                            height: getVerticalSize(8),
                                            margin: getMargin(top: 39),
                                            child: SmoothIndicator(
                                                offset: 0,
                                                count: 3,
                                                size: Size.zero,
                                                effect: ScrollingDotsEffect(
                                                    spacing: 6,
                                                    activeDotColor:
                                                        ColorConstant.primary,
                                                    dotColor:
                                                        ColorConstant.gray300,
                                                    dotHeight:
                                                        getVerticalSize(8),
                                                    dotWidth:
                                                        getHorizontalSize(8)))),
                                        CustomButton(
                                            height: getVerticalSize(58),
                                            text: "lbl_get_started".tr,
                                            margin:
                                                getMargin(top: 40, bottom: 1),
                                            padding: ButtonPadding.PaddingT18,
                                            onTap: () {
                                              onTapGetstarted();
                                            })
                                      ])))
                        ])))));
  }

  onTapGetstarted() {
    Get.toNamed(
      AppRoutes.letsYouInScreen,
    );
  }
}
