import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:goroga/core/app_export.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:package_info/package_info.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String appVersion = packageInfo.version;
  print('App version: $appVersion');
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    PrefUtils().init()
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppUpdateInfo? _updateInfo;

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  bool _flexibleUpdateAvailable = false;
  bool isComplete = false;

  Future<void> checkForUpdate() async {
    print("check updates");
    // await InAppUpdate.checkForUpdate().then((info) {
    //   setState(() {
    //     _updateInfo = info;
    //   });
    // }).catchError((e) {
    //   print("error:${e}");
    //   showSnack(e.toString());
    // });
    // print("after checking");
    // print("update :${_updateInfo}");
    // if (_updateInfo?.updateAvailability == UpdateAvailability.updateAvailable) {
    //   print("App update available");
    //   await InAppUpdate.performImmediateUpdate().then((value) async {
    //     if (value == AppUpdateResult.success) {
    //       await InAppUpdate.completeFlexibleUpdate().then((value) {
    //         print("complete");
    //       }).catchError((e) {
    //         print(e);
    //       });

    //       setState(() {
    //         isComplete = true;
    //       });
    //     }
    //     setState(
    //       () {
    //         // value=value;
    //         print('value:$value');
    //         _flexibleUpdateAvailable = true;

    //         print(_updateInfo);
    //       },
    //     );
    //   }).catchError((e) {
    //     print("start flexing update failed");
    //     print(e);
    //   });
    // await InAppUpdate.startFlexibleUpdate()
    //     .then((value) => setState(
    //           () {
    //             // value=value;
    //             print('value:$value');
    //             _flexibleUpdateAvailable = true;
    //             completeUpdate();
    //             print(_updateInfo);
    //           },
    //         ))
    //     .catchError((e) {
    //   print("start flexing update failed");
    //   print(e);
    // });
    // }
    try {
      final info = await InAppUpdate.checkForUpdate();
      setState(() {
        _updateInfo = info;
      });
      print("Update Info: $_updateInfo");

      if (_updateInfo?.updateAvailability ==
          UpdateAvailability.updateAvailable) {
        print("App update available");

        final updateResult = await InAppUpdate.performImmediateUpdate();
        if (updateResult == AppUpdateResult.success) {
          await InAppUpdate.completeFlexibleUpdate();
          setState(() {
            isComplete = true;
          });
          print("Update completed");
        } else {
          print("Immediate update failed: $updateResult");
        }
      }
    } catch (e) {
      print("Error checking for update: $e");
      showSnack("Error checking for update: $e");
    }
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appVersion = packageInfo.version;
    print('App version: $appVersion');
  }

  void showSnack(String text) {
    if (_scaffoldKey.currentContext != null) {
      ScaffoldMessenger.of(_scaffoldKey.currentContext!)
          .showSnackBar(SnackBar(content: Text(text)));
    }
  }

  // Future<void> completeUpdate() async {
  //   print("Update completed");

  //   try {
  //     await InAppUpdate.completeFlexibleUpdate();
  //     print("complete");
  //     setState(() {
  //       isComplete = true;
        
  //     });
  //   } catch (e) {
  //     print("Failed to complete update: $e");
  //     showSnack("Failed to complete update: $e");
  //   }
  // }

  @override
  void initState() {
    print("appUpadateStarted");
    // TODO: implement initState
    super.initState();
    checkForUpdate();
  }

  // void appUpdate() {
  //   try {
  //     print("Starting app update");
  //     completeUpdate();
  //   } catch (e) {
  //     print("Error in app update: $e");
  //     showSnack("Error in app update: $e");
  //   }
  // try {
  //   print("this app update");
  //   Object? appUpadteResult = AppUpdateResult.values;
  //   var tryUpdate = InAppUpdate.completeFlexibleUpdate();
  //   print("try update");
  //   tryUpdate.catchError((e) {
  //     showSnack(e.toString());
  //     return AppUpdateResult.values;
  //   });
  // } catch (e) {
  //   print("catch block from app update functions");
  //   print(e);
  // }
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
        fontFamily: GoogleFonts.nunito().fontFamily,
      ),

      translations: AppLocalization(),
      locale: Get.deviceLocale,
      //for setting localization strings
      fallbackLocale: const Locale('en', 'US'),
      title: 'goroga',

      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
    );
  }
}
