import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class addPatientController extends GetxController {
  addpatient(name, phone, email, age, gender, address) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var userDataJson = sp.getString('userData');
    Map<String, dynamic> userDataMap = json.decode(userDataJson!);
    Map<String, dynamic> data = userDataMap['data'];
    var useId = data['id'];
    print(useId);
    final apiUrl = Uri.parse(AppConfig.baseUrl + 'session/user/register');

    final requestBody = {
      "user_id": useId,
      "name": name,
      "mobile_no": phone,
      "address": address,
      "email": email,
      "age": age,
      "gender": gender
    };
    print(requestBody);
    final encodedBody = json.encode(requestBody);
    print(encodedBody);

    try {
      final response = await http.post(apiUrl,
          body: encodedBody, headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        print('Response data: ${response.body}');
       var data = jsonDecode(response.body);

        if (data['status'] == true) {
          Get.snackbar('Success', data['message'],
              backgroundColor: ColorConstant.primary, colorText: Colors.white);
          return 1;
        } else {
          Get.snackbar('Wrong', data['message'],
              backgroundColor: ColorConstant.red700, colorText: Colors.white);
          return 0;
        }
      } else if (response.statusCode == 302) {
        print("302");
        final redirectionUrl = response.headers['location'];
        print('Redirected to: $redirectionUrl');
      } else {
        print(
            'Failed to send POST request. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Network error: $e');
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
