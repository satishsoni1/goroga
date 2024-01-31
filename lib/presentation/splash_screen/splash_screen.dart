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
              alignment: Alignment.center,
              child: CustomImageView(
                  imagePath: ImageConstant.imgLogo,
                  margin: getMargin(all: 100)),
            )));
  }
}
