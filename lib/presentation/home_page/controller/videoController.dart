import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class VideoController extends GetxController {
  void sentSesionData(start_time, end_time, duration, content_id, user) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var userDataJson = sp.getString('userData');
    Map<String, dynamic> userDataMap = json.decode(userDataJson!);
    Map<String, dynamic> data = userDataMap['data'];
    var useId = data['id'];
    print(useId);
    final apiUrl = Uri.parse(AppConfig.baseUrl + 'session/record/$useId');

    final requestBody = {
      
        "session_user_id": user,
        "content_id": content_id,
        "start_time": start_time,
        "end_time": end_time,
        "duration": duration
      
    };
    print(requestBody);
    final encodedBody = json.encode(requestBody);
    print(encodedBody);

    try {
      final response = await http.post(apiUrl,
          body: encodedBody, headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        print('Response data of video: ${response.body}');
         if (data['status'] == true) {
          Get.snackbar('Success', data['message'],
              backgroundColor: ColorConstant.primary, colorText: Colors.white);
        } else {
          Get.snackbar('Wrong', data['message'],
              backgroundColor: ColorConstant.primary, colorText: Colors.white);
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
