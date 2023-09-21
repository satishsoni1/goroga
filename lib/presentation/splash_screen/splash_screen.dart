import 'controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';

class SplashScreen extends GetWidget<SplashController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                          svgPath: ImageConstant.imgLogo,
                          height: getVerticalSize(160),
                          width: getHorizontalSize(192),
                          margin: getMargin(bottom: 5))
                    ]))));
  }
}
