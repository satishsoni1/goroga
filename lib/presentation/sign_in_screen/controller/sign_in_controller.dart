// import 'package:goroga/core/app_export.dart';
// import 'package:goroga/presentation/sign_in_screen/models/sign_in_model.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SignInController extends GetxController {
//   // TextEditingController statusDefaultController = TextEditingController();

//   // TextEditingController statusDefaultOneController = TextEditingController();
// // Create TextEditingController instances for the username and password fields
//   // final  usernameController = TextEditingController();
//   // final  passwordController = TextEditingController();

//   // Rx<SignInModel> signInModelObj = SignInModel().obs;

//   Rx<bool> isShowPassword = true.obs;

//   // Rx<bool> isCheckbox = false.obs;
//   void checkLogIn(username, password) async {
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     print(username);
//     print(password);
//     // final String validUsername = 'test@test.com';
//     // final String validPassword = '123456';
//     String? storedEmail = sp.getString('email');
//     String? storedPassword = sp.getString('password');
//     print(storedEmail);
//     print(storedPassword);
//     // Check if the entered username and password are correct
//     if (username == storedEmail && password == storedPassword) {
//       await sp.setBool('isLogin', true);
//       print(sp.getBool("isLogin"));

//       // If the username and password are correct, navigate to the home screen
//       Get.offNamed(AppRoutes.homeContainerScreen);
//     } else {
//       // If the username or password is incorrect, show an error message
//       Get.snackbar('Error', 'Invalid username or password');
//     }
//   }

//   @override
//   void onReady() {
//     super.onReady();
//   }

//   @override
//   void onClose() {
//     super.onClose();
//     // usernameController.dispose();
//     // passwordController.dispose();
//   }
// }
import 'dart:convert';

import 'package:goroga/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:goroga/presentation/sign_in_screen/models/sign_in_model.dart';
import 'package:goroga/widgets/config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'; // Import the http package

class SignInController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Rx<bool> isShowPassword = true.obs;

  void checkLogIn(username, password) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final apiUrl = Uri.parse(AppConfig.baseUrl + 'login');
    final requestBody = {"phone_number": username, "password": password};

    try {
      final response = await http.post(apiUrl, body: requestBody);

      if (response.statusCode == 200) {
        var Userdata = jsonDecode(response.body);
        SignInModel signInModel = SignInModel.fromJson(Userdata);

        String signInModelJson = jsonEncode(signInModel);

        sp.setString('userData', signInModelJson);
        if (signInModel.success == true) {
          await sp.setBool('isLogin', true);
          Get.offNamed(AppRoutes.homeContainerScreen);
        } else {
          print('Login failed');
          Get.snackbar('Error', 'Invalid username or password');
        }
      }
    } catch (e) {
      print('Network error: $e');
      Get.snackbar('Error', 'Network error occurred');
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
