// import 'package:goroga/core/app_export.dart';
// import 'package:goroga/presentation/sign_up_screen/models/sign_up_model.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SignUpController extends GetxController {
//   // TextEditingController statusDefaultController = TextEditingController();

//   TextEditingController nameController = TextEditingController();
//   TextEditingController LastNameController = TextEditingController();
//   TextEditingController emailcontroller = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController mobileController = TextEditingController();

//   Rx<SignUpModel> signUpModelObj = SignUpModel().obs;

//   Rx<bool> isShowPassword = true.obs;

//   Rx<bool> isCheckbox = false.obs;
//   RxBool passwordsMatch = false.obs;

//   void signup(name, lastname, mobile, email, password) async {
//     bool isFormValid() {
//       // Check if all fields are not empty
//       if (nameController.text.isEmpty ||
//           LastNameController.text.isEmpty ||
//           mobileController.text.isEmpty ||
//           emailcontroller.text.isEmpty ||
//           (passwordController.text.isEmpty)) {
//         return false;
//       }

//       return true;
//     }

//     if (!isFormValid()) {
//       // Show an error message if the form is not valid
//       Get.snackbar('Error', 'Please fill in all fields',
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.red,
//           colorText: Colors.white);
//     } else if (mobileController.text.length < 10) {
//       Get.snackbar('Error', 'Mobile No. must be at least 10 characters long',
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.red,
//           colorText: Colors.white);
//     } else if (passwordController.text.length < 8) {
//       Get.snackbar('Error', 'Passwords must be at least 8 characters long',
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.red,
//           colorText: Colors.white);
//     } else {
//       Get.snackbar('Success', 'Successfully Sign Up',
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.green,
//           colorText: Colors.white);
//       nameController.clear();
//       LastNameController.clear();
//       mobileController.clear();
//       emailcontroller.clear();
//       passwordController.clear();
//     }

//     SharedPreferences signUp = await SharedPreferences.getInstance();
//     print(name);
//     print(lastname);
//     print(mobile);
//     print(email);
//     print(password);
//     await signUp.setString("email", email);
//     await signUp.setString("password", password);
//   }

//   @override
//   void onReady() {
//     super.onReady();
//   }

//   @override
//   void onClose() {
//     super.onClose();
//     nameController.dispose();
//     LastNameController.dispose();
//     mobileController.dispose();
//     emailcontroller.dispose();
//     passwordController.dispose();
//   }
// }

import 'dart:convert';

import 'package:goroga/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:goroga/widgets/config.dart';
import 'package:http/http.dart' as http;

class SignUpController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  Rx<bool> isShowPassword = true.obs;

  void signup(username, phone, email, password) async {
    final apiUrl = Uri.parse(AppConfig.baseUrl+'register');

    final requestBody = {
      "email": email,
      "password": password,
      "phone_verified_at": " ",
      "phone_number": phone,
      "name": username
    };

    try {
      // Make a POST request to the API
      final response = await http.post(apiUrl, body: requestBody);
      print(response.body);
      // print(jsonDecode(response.body));

      if (response.statusCode == 200) {
        var Userdata = jsonDecode(response.body);

        if (Userdata['success'] == true) {
          // final Data = Userdata['data'];
          usernameController.clear();
          mobileController.clear();
          emailController.clear();
          passwordController.clear();
          Get.snackbar('Successfull', Userdata['message'],
              mainButton: TextButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.signInScreen);
                },
                child: Text('Sign In'),
              ),
              backgroundColor: Color.fromARGB(255, 199, 244, 239));
          // Get.offNamed(AppRoutes.signInScreen);
        } else if (Userdata['success'] == false) {
          print(Userdata["message"]);
          var messages;
          try {
            messages = Userdata['message']
                .map((errorMessage) => errorMessage[0])
                .toList()
                .join(' ');
          } catch (e) {
            messages = Userdata['message'];
          }
          Get.snackbar('Wrong', messages,
              mainButton: TextButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.signInScreen);
                },
                child: Text('Sign In'),
              ),
              backgroundColor: Color.fromARGB(255, 199, 244, 239));
        }
      }
    } catch (e) {
      // Handle network errors
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
    super.onClose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    mobileController.dispose();
  }
}
