import 'package:goroga/presentation/profile_settings_page/global_key.dart';
import 'package:goroga/presentation/profile_settings_page/stress_Level_Page.dart';
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
  bool _stressLevel = false;

  bool _TotalSessions = false;

  bool _TotalMinutes = false;

  bool _lastGAD = false;

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
                            setState(() {
                              _stressLevel = true;
                            });
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
                        ListTile(
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
                        ListTile(
                          title: Text(
                            'Total Minutes | 0',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('Total minutes spent in sessions'),
                          leading: Icon(
                            Icons.scale_outlined,
                            color: ColorConstant.primary,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: ColorConstant.primary,
                          ),
                        ),
                        ListTile(
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
                        )
                      ],
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//  Widget _buildSelectedContainer() {
//     if (_stressLevel) {
//       // Return the content for Stress Level
//       return Container(
//         // ... content for Stress Level
//       );
//     } else if (_TotalSessions) {
//       // Return the content for Total Sessions
//       return Container(
//         // ... content for Total Sessions
//       );
//     } else if (_TotalMinutes) {
//       // Return the content for Total Minutes
//       return Container(
//         // ... content for Total Minutes
//       );
//     } else if (_lastGAD) {
//       // Return the content for Last GAD
//       return Container(
//         // ... content for Last GAD
//       );
//     } else {
//       // Default container when none of the items is selected
//       return Container();
//     }
//   }
}
