import 'package:goroga/presentation/profile_settings_page/controller/sessionHistoryController.dart';
import 'package:goroga/presentation/profile_settings_page/global_key.dart';
import 'package:goroga/presentation/profile_settings_page/last_GAD_page.dart';
import 'package:goroga/presentation/profile_settings_page/models/session_history_model.dart';
import 'package:goroga/presentation/profile_settings_page/stress_Level_Page.dart';
import 'package:goroga/presentation/profile_settings_page/total_minutes.dart';
import 'package:goroga/presentation/profile_settings_page/total_sessions.dart';
import 'package:goroga/widgets/app_bar/drawer.dart';

import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/app_bar/appbar_image.dart';
import 'package:goroga/widgets/app_bar/appbar_title.dart';
import 'package:goroga/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class ProfileSettingsPage extends StatefulWidget {
  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  // Widget _currentBody = Container();
  SessionHistoryController _historyController =
      Get.put(SessionHistoryController());
  List<dynamic> History = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var categoriesList = await _historyController.fetchHistory();
      return categoriesList;
    } catch (e) {
      print("error:$e");
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        key: MyGlobalKeys.ScaffoldKey,
        drawer: NavBar(),
        appBar: CustomAppBar(
          height: getVerticalSize(80),
          title:
              AppbarTitle(text: "lbl_profile".tr, margin: getMargin(left: 16)),
          actions: [
            AppbarImage(
              height: getSize(28),
              width: getSize(28),
              svgPath: ImageConstant.imgMenuList,
              margin: getMargin(left: 24, top: 2, right: 24, bottom: 2),
              onTap: () {
                print("menu tapped");
                MyGlobalKeys.ScaffoldKey.currentState?.openDrawer();
              },
            )
          ],
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
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
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(8),
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            print("hii");
                            // Get.to(() => stressLevelPage());
                            // setState(() {
                            //   _currentBody = StressLevelPageContent();
                            // });
                          },
                          child: ListTile(
                            title: Text(
                              'Stress Level | N/A',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('Based on your last session'),
                            leading: Icon(
                              Icons.circle_rounded,
                              color: ColorConstant.primary,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: ColorConstant.primary,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Get.to(() => totalSessions());
                            // setState(() {
                            //   _currentBody = TotalSessionsContent();
                            // });
                          },
                          child: ListTile(
                            title: Text(
                              'Total Sessions | 0',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('Total number of sessions'),
                            leading: Icon(
                              Icons.play_arrow_sharp,
                              color: ColorConstant.primary,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: ColorConstant.primary,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Get.to(() => totalMinutes());
                            // setState(() {
                            //   _currentBody = TotalMinutesContent();
                            // });
                          },
                          child: ListTile(
                            title: Text(
                              'Total Minutes | 0',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('Total minutes spent in sessions'),
                            leading: Icon(
                              Icons.hourglass_top_rounded,
                              color: ColorConstant.primary,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: ColorConstant.primary,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Get.to(() => lastGAD());
                            // setState(() {
                            //   _currentBody = LastGADPageContent();
                            // });
                          },
                          child: ListTile(
                            title: Text(
                              'Last GAD7 score | 0',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('your last GAD-7 score'),
                            leading: Icon(
                              Icons.bar_chart_sharp,
                              color: ColorConstant.primary,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: ColorConstant.primary,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Session History",
                            style: TextStyle(
                                fontSize: getFontSize(25),
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: size.height / 6,
                            width: size.height / 3,
                            child: Container(
                              margin: getMargin(top: 10),
                              // color: Color.fromARGB(255, 182, 204, 215),
                              child: Obx(
                                () {
                                  if (_historyController.history.value.data !=
                                      null) {
                                    List<dynamic>? history = _historyController
                                        .history.value.data!.content;

                                    return ListView.builder(
                                      itemCount: history!.length,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Stack(
                                                children: [
                                                  CustomImageView(
                                                      url: history[index]
                                                          .imageUrl
                                                          .toString()
                                                          .toString(),
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                      width:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width /
                                                                  2 +
                                                              10,
                                                      margin: getMargin(
                                                        left: 0,
                                                        right: 5,
                                                      ),
                                                      radius:
                                                          BorderRadius.circular(
                                                        getHorizontalSize(
                                                          5,
                                                        ),
                                                      )),
                                                  Positioned(
                                                    bottom: 20,
                                                    right: 10,
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Text(
                                                        history[index]
                                                            .duration
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 45,
                                                    right: 50,
                                                    left: 50,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // Navigator.push(context,
                                                        //     MaterialPageRoute(
                                                        //   builder: (context) {
                                                        //     return DetailPage(
                                                        //         title: currentData.title
                                                        //             .toString(),
                                                        //         imagePath: currentData
                                                        //             .imageUrl
                                                        //             .toString(),
                                                        //         videoUrl: currentData
                                                        //             .videoUrl
                                                        //             .toString(),
                                                        //         authorName: currentData
                                                        //             .author
                                                        //             .toString(),
                                                        //         description: currentData
                                                        //             .description
                                                        //             .toString());
                                                        //   },
                                                        // ));
                                                        // Get.to(() => DetailPage(
                                                        //       data: history[ind,
                                                        //     ));
                                                      },
                                                      child: Icon(
                                                        Icons
                                                            .play_circle_fill_sharp,
                                                        color: Colors
                                                            .white, // Customize the arrow color
                                                        size:
                                                            40, // Customize the arrow size
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: Wrap(
                                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                                  runSpacing: 5,
                                                  children: [
                                                    Text(
                                                      _historyController
                                                              .history
                                                              .value
                                                              .data!
                                                              .duration
                                                              .toString() +
                                                          " days",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      history[index].name,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      history[index].authorName,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                )),
                                          ],
                                        );
                                      },
                                    );
                                  } else if (_historyController
                                          .history.value.data !=
                                      null) {
                                    print("is lenght tr");
                                    return Center(
                                        child: Text("Data not found"));
                                  } else {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                },
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // _currentBody
          ],
        ),
      ),
    );
  }
}

// class StressLevelPageContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("Stress Level Content"),
//     );
//   }
// }

// class TotalSessionsContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("Total Sessions Content"),
//     );
//   }
// }

// class TotalMinutesContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: Text("Total Minutes Content"),
//       ),
//     );
//   }
// }

// class LastGADPageContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("Last GAD Page Content"),
//     );
//   }
// }
