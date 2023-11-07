import 'package:goroga/presentation/profile_settings_page/global_key.dart';
import 'package:goroga/widgets/app_bar/drawer.dart';

import 'controller/profile_settings_controller.dart';
import 'models/profile_settings_model.dart';
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
            body: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: getPadding(left: 0, top: 39, right: 0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(children: [
                                Padding(
                                    padding: getPadding(
                                        left: 40,
                                        top: 16,
                                        bottom: 14,
                                        right: 0),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 100,
                                            child: Card(
                                              elevation: 5.0,
                                              color: Colors.transparent,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Colors
                                                          .deepPurple.shade200,
                                                      Colors.deepPurple.shade600
                                                    ], // Define your gradient colors
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0), // Optional: Add rounded corners
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    ListTile(
                                                      title: Text(
                                                        "N/A",
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      titleAlignment:
                                                          ListTileTitleAlignment
                                                              .center,
                                                      subtitle: Text(
                                                        "Average improvement",
                                                        style: TextStyle(
                                                            fontSize: 10),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Container(
                                            height: 100,
                                            width: 100,
                                            child: Card(
                                              elevation: 5.0,
                                              color: Colors.transparent,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Colors
                                                          .deepPurple.shade200,
                                                      Colors.deepPurple.shade600
                                                    ], // Define your gradient colors
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0), // Optional: Add rounded corners
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    ListTile(
                                                      title: Text(
                                                        "0",
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      titleAlignment:
                                                          ListTileTitleAlignment
                                                              .center,
                                                      subtitle: Text(
                                                        "Last GAD-7 Score",
                                                        style: TextStyle(
                                                            fontSize: 10),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Container(
                                            height: 100,
                                            width: 100,
                                            child: Card(
                                              elevation: 5.0,
                                              color: Colors.transparent,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Colors
                                                          .deepPurple.shade200,
                                                      Colors.deepPurple.shade600
                                                    ], // Define your gradient colors
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0), // Optional: Add rounded corners
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    ListTile(
                                                      title: Text(
                                                        "0",
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      titleAlignment:
                                                          ListTileTitleAlignment
                                                              .center,
                                                      subtitle: Text(
                                                        "Watched Duration",
                                                        style: TextStyle(
                                                            fontSize: 10),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]))
                              ]),
                              Container(
                                  margin: getMargin(top: 23),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getPadding(
                                                left: 10, top: 30, bottom: 27),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text("Session History".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16)),
                                                ])),
                                      ])),
                            ]))))));
  }
}
