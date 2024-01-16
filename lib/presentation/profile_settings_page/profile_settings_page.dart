import 'package:goroga/presentation/profile_settings_page/global_key.dart';
import 'package:goroga/widgets/app_bar/drawer.dart';

import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/app_bar/appbar_image.dart';
import 'package:goroga/widgets/app_bar/appbar_title.dart';
import 'package:goroga/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class ProfileSettingsPage extends StatelessWidget {
  //
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            key: MyGlobalKeys.ScaffoldKey,
            drawer: NavBar(),
            appBar: CustomAppBar(
                height: getVerticalSize(80),
                title: AppbarTitle(
                    text: "lbl_profile".tr, margin: getMargin(left: 16)),
                actions: [
                  AppbarImage(
                      height: getSize(28),
                      width: getSize(28),
                      svgPath: ImageConstant.imgMenuList,
                      margin: getMargin(left: 24, top: 2, right: 24, bottom: 2),
                      onTap: () {
                        print("menu tapped");
                        MyGlobalKeys.ScaffoldKey.currentState?.openDrawer();
                      })
                ]),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Stats",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: getFontSize(25),
                    ),
                  ),
                  Text(
                    "Session History",
                    style: TextStyle(
                        fontSize: getFontSize(25),
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )));
  }
}
