import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/app_bar/appbar_image.dart';
import 'package:goroga/widgets/app_bar/appbar_title.dart';

import '../../widgets/app_bar/custom_app_bar.dart';

class totalSessions extends StatelessWidget {
  const totalSessions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
          height: getVerticalSize(80),
          title:
              AppbarTitle(text: "Total Sessions".tr, margin: getMargin(left: 16)),
              leadingWidth:52 ,
          leading: AppbarImage(

            height: getSize(28),
            width: getSize(28),
            svgPath: ImageConstant.imgArrowleft,
            margin: getMargin(left: 24, top: 2,  bottom: 2),
            onTap: (){
              Get.back();
            },
          )),
      body: Container(),
    ));
  }
}