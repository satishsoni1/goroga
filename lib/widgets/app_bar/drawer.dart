
import 'package:flutter/material.dart';
import 'package:goroga/presentation/sign_in_screen/controller/logoutController.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:goroga/core/app_export.dart';

import '../../presentation/profile_settings_page/add_patient_page.dart';
import '../../presentation/profile_settings_page/patients_list_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  LogOutController _logoutController = Get.put(LogOutController());
  // SettingController _settingController = Get.put(SettingController());
  // late Future<SettingDataModel> _settingDataFuture;

  Uri _privacyPolicy =
      Uri.parse('https://goroga.in/policies/terms-of-service.php');

  Uri _terms = Uri.parse('https://goroga.in/pages/terms-conditions.php');

  Uri _dataPrivacy = Uri.parse('https://goroga.in/pages/privacy-policy.php');

  Uri _support = Uri.parse('https://goroga.in/pages/faq.php');
  var settingData;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _settingDataFuture = _settingController.getSettingData();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topRight,
        child: Drawer(
          width: MediaQuery.of(context).size.width / 1.5,
          backgroundColor: Color.fromARGB(255, 224, 245, 243),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              AppBar(
                backgroundColor: Color.fromARGB(255, 224, 245, 243),
                automaticallyImplyLeading:
                    false, // Hide the default back button
                elevation: 0,
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Color.fromRGBO(16, 106, 94, 1),
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Settings",
                  style: TextStyle(
                      color: Color.fromRGBO(16, 106, 94, 1),
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Column(
                  children: [
                    // ElevatedButton(
                    //   onPressed: () {
                    //     // Handle button tap
                    //     Get.to(() => AppointmentsPage());
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     foregroundColor: Color.fromARGB(255, 224, 245, 243),
                    //     backgroundColor: Colors.white,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(
                    //           10.0), // Adjust the radius as needed
                    //     ), // Text color
                    //   ),
                    //   child: SizedBox(
                    //     width: MediaQuery.sizeOf(context).width / 2,
                    //     height: 50,
                    //     child: ListTile(
                    //       leading: Icon(
                    //         Icons.edit_calendar_rounded,
                    //         color: Color.fromRGBO(16, 106, 94, 1),
                    //       ),
                    //       title: Text('Appoinments',
                    //           style: TextStyle(
                    //               fontWeight: FontWeight.bold, fontSize: 12)),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     // Handle button tap
                    //     Get.to(() => bookingAppoinments());
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     foregroundColor: Color.fromARGB(255, 224, 245, 243),
                    //     backgroundColor: Colors.white,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(
                    //           10.0), // Adjust the radius as needed
                    //     ), // Text color
                    //   ),
                    //   child: SizedBox(
                    //     width: MediaQuery.sizeOf(context).width / 2,
                    //     height: 50,
                    //     child: ListTile(
                    //       leading: Icon(
                    //         Icons.date_range,
                    //         color: Color.fromRGBO(16, 106, 94, 1),
                    //       ),
                    //       title: Text('Bookings',
                    //           style: TextStyle(
                    //               fontWeight: FontWeight.bold, fontSize: 12)),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     // Handle button tap
                    //     Get.toNamed(
                    //       AppRoutes.subscriptionPage,
                    //     );
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     foregroundColor: Color.fromARGB(255, 224, 245, 243),
                    //     backgroundColor: Colors.white,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(
                    //           10.0), // Adjust the radius as needed
                    //     ), // Text color
                    //   ),
                    //   child: SizedBox(
                    //     width: MediaQuery.sizeOf(context).width / 2,
                    //     height: 50,
                    //     child: ListTile(
                    //       leading: Icon(
                    //         Icons.subscriptions_outlined,
                    //         color: Color.fromRGBO(16, 106, 94, 1),
                    //       ),
                    //       title: Text('Subscription',
                    //           style: TextStyle(
                    //               fontWeight: FontWeight.bold, fontSize: 12)),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 15,
                    // ),

                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => addPatientPage());
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 224, 245, 243),
                        backgroundColor: Colors.white, // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                      ),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2,
                        height: 50,
                        child: ListTile(
                          leading: Icon(
                            Icons.add_box_outlined,
                            color: Color.fromRGBO(16, 106, 94, 1),
                          ),
                          title: Text(
                            'Add Patient',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => PatiensListPage());
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 224, 245, 243),
                        backgroundColor: Colors.white, // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                      ),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2,
                        height: 50,
                        child: ListTile(
                          leading: Icon(
                            Icons.list_alt,
                            color: Color.fromRGBO(16, 106, 94, 1),
                          ),
                          title: Text(
                            'Patients',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        launchUrl(_privacyPolicy);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 224, 245, 243),
                        backgroundColor: Colors.white, // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                      ),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2,
                        height: 50,
                        child: ListTile(
                          leading: Icon(
                            Icons.lock_outline_sharp,
                            color: Color.fromRGBO(16, 106, 94, 1),
                          ),
                          title: Text(
                            'Privacy Policy',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle button tap
                        launchUrl(_terms);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 224, 245, 243),
                        backgroundColor: Colors.white, // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                      ),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2,
                        height: 50,
                        child: ListTile(
                          leading: Icon(
                            Icons.file_copy_outlined,
                            color: Color.fromRGBO(16, 106, 94, 1),
                          ),
                          title: Text('Terms',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle button tap
                        launchUrl(_dataPrivacy);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 224, 245, 243),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ), // Text color
                      ),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2,
                        height: 50,
                        child: ListTile(
                          leading: Icon(
                            Icons.list,
                            color: Color.fromRGBO(16, 106, 94, 1),
                          ),
                          title: Text('Data Privacy',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle button tap

                        launchUrl(_support);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 224, 245, 243),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ), // Text color
                      ),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2,
                        height: 50,
                        child: ListTile(
                          leading: Icon(
                            Icons.question_mark,
                            color: Color.fromRGBO(16, 106, 94, 1),
                          ),
                          title: Text(
                            'Support/FAQs',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle button tap
                        _logoutController.logOut();
                        Get.snackbar('Success', 'Logout Successfully',
                            backgroundColor: ColorConstant.primary,
                            colorText: Colors.white);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 224, 245, 243),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ), // Text color
                      ),
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.sizeOf(context).width / 2,
                        child: ListTile(
                          leading: Icon(
                            Icons.logout_outlined,
                            color: Color.fromRGBO(16, 106, 94, 1),
                          ),
                          title: Text('Logout',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }

  // logOut() async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   var userDataJson = sp.getString('userData');
  //   Map<String, dynamic> userDataMap = json.decode(userDataJson!);
  //   Map<String, dynamic> data = userDataMap['data'];
  //   // await sp.remove('email');
  //   // await sp.remove('password');
  //   print(data['api_token']);
  //   final apiToken = data['api_token'];

  //   try {
  //     final response = await http.get(
  //       Uri.parse(AppConfig.baseUrl + 'logout?api_token=' + apiToken),
  //     );
  //     if (response.statusCode == 200) {
  //       final responseData = json.decode(response.body);

  //       if (responseData['success'] == true) {
  //         await sp.setBool("isLogin", false);

  //         print(responseData['message']);
  //         Get.offAllNamed(AppRoutes.signInScreen);
  //       } else {
  //         print('Logout on the server failed');
  //       }
  //     } else {
  //       print('Failed to log out on the server');
  //     }
  //   } catch (error) {
  //     print('An error occurred during server-side logout: $error');
  //   }
  // }
}
