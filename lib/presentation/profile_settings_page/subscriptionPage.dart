import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/home_container_screen/home_container_screen.dart';
import 'package:goroga/widgets/app_bar/appbar_title.dart';
import 'package:goroga/widgets/app_bar/custom_app_bar.dart';

class SubscriptionPage extends StatefulWidget {
  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
              height: getVerticalSize(80),
              leadingWidth: 52,
              title: AppbarTitle(
                  text: "Subscription".tr, margin: getMargin(left: 16)),
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back, // Replace with your desired icon
                  color: ColorConstant.primary, // Customize the icon color
                ),
                onPressed: () {
                  print("object");
                  Get.to(()=>HomeContainerScreen());
                  // Navigator.pop(context);
                },
              ),
            ),
            body: Container(
             
              decoration: BoxDecoration(
                  color: Color.fromARGB(
                      255, 224, 245, 243) // Replace with your desired colors
                  ),
              child: SingleChildScrollView(
                child: Column(children: [
                  Stack(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant
                            .imageNotFound, // Display the image using the received image path
                        height: MediaQuery.of(context).size.height /
                            2, // Adjust the height as needed
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                        // Adjust the width as needed
                      ),
                      // Positioned(
                      //   top: 20, // Adjust the top position as needed
                      //   left: 20, // Adjust the left position as needed
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       Get.back();
                      //     },
                      //     child: Icon(
                      //       Icons.arrow_back,
                      //       color: Colors.white, // Customize the arrow color
                      //       size: 32, // Customize the arrow size
                      //     ),
                      //   ),
                      // ),
                      // Positioned(
                      //   bottom: 20, // Adjust the top position as needed
                      //   right: 20, // Adjust the left position as needed
                      //   child: Container(
                      //     padding: EdgeInsets.all(5),
                      //     decoration: BoxDecoration(
                      //         color: Colors.white,
                      //         borderRadius: BorderRadius.circular(5)),
                      //     child: Text(
                      //       programsData.duration
                      //           .toString(), // Replace with your time data
                      //       style: TextStyle(
                      //         color: Colors.black,
                      //         fontSize: 12,
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      // Add other widgets to display details here.
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Card(
                          elevation: 5,
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15.0), // Adjust the radius as needed
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              ListTile(
                                title: Padding(
                                  padding: EdgeInsets.only(
                                    left: 15,
                                  ), // Adjust padding as needed
                                  child: Text('Basic'),
                                ),
                                trailing: TextButton(
                                  style: TextButton.styleFrom(
                                    
                                    elevation: 5,
                                    backgroundColor: ColorConstant.primary // Set the text color to white
                                  ),
                                  child: Text(
                                    'BUY',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    print('buy');
                                  },
                                ),
                                subtitle: Padding(
                                  padding: EdgeInsets.only(
                                    left: 15,
                                  ), // Adjust padding as needed
                                  child: Text('1 Month'),
                                ),
                              ),
                            ],
                          ),
                        ),
                     
                  Card(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    color: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15.0), // Adjust the radius as needed
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ListTile(
                          title: Padding(
                            padding: EdgeInsets.only(
                              left: 15,
                            ), // Adjust padding as needed
                            child: Text('Standard'),
                          ),
                          trailing: TextButton(
                          
                            style: TextButton.styleFrom(
                              elevation: 5,
                              backgroundColor: ColorConstant.primary // Set the text color to white
                            ),
                            child: Text(
                              'BUY',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                          subtitle: Padding(
                            padding: EdgeInsets.only(
                              left: 15.0,
                            ), // Adjust padding as needed
                            child: Text('6 Months'),
                          ),
                        ),
                      ],
                    ),
                  ),
                   Card(
                    elevation: 5,
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15.0), // Adjust the radius as needed
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ListTile(
                          title: Padding(
                            padding: EdgeInsets.only(
                              left: 15.0,
                            ), // Adjust padding as needed
                            child: Text('Premium'),
                          ),
                          trailing: TextButton(

                            style: TextButton.styleFrom(
                              elevation: 5,
                              backgroundColor: ColorConstant.primary // Set the text color to white
                            ),
                            child: Text(
                              'BUY',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                          subtitle: Padding(
                            padding: EdgeInsets.only(
                              left: 15.0,
                            ), // Adjust padding as needed
                            child: Text('1 Year'),
                          ),
                        ),
                      ],
                    ),
                  ),
                   ],
                    ),
                  ),
                ]),
              ),
            )));
  }
}
