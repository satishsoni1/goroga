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
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgLogo,
                      height: getVerticalSize(80),
                      width: getHorizontalSize(220),
                      margin: getMargin())
                ]))));
  }
}
