
import 'dart:convert';

import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'; // Import the http package

class LogOutController extends GetxController {
   logOut() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var userDataJson = sp.getString('userData');
    Map<String, dynamic> userDataMap = json.decode(userDataJson!);
    Map<String, dynamic> data = userDataMap['data'];
    // await sp.remove('email');
    // await sp.remove('password');
    print(data['api_token']);
    final apiToken = data['api_token'];

    try {
      final response = await http.get(
        Uri.parse(AppConfig.baseUrl + 'logout?api_token=' + apiToken),
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData['success'] == true) {
          await sp.setBool("isLogin", false);

          print(responseData['message']);
          Get.offAllNamed(AppRoutes.signInScreen);
        } else {
          print('Logout on the server failed');
        }
      } else {
        print('Failed to log out on the server');
      }
    } catch (error) {
      print('An error occurred during server-side logout: $error');
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
   
    super.onClose();
  }
}
