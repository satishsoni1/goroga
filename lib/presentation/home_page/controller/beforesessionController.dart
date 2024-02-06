import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/home_page/models/patient_model.dart';
import 'package:goroga/widgets/config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BeforeSessionController extends GetxController {
  getPatient() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var userDataJson = sp.getString('userData');
    Map<String, dynamic> userDataMap = json.decode(userDataJson!);
    Map<String, dynamic> data = userDataMap['data'];
    var useId = data['id'];
    var apiUrl =
        Uri.parse("https://admin.goroga.in/public/api/session/user/$useId");
    var response = await http.get(apiUrl);
    dynamic jsonData = jsonDecode(response.body);
    print(useId);
    print(jsonData);
    try {
      if (response.statusCode == 200) {
        PatientModel _patients = PatientModel.fromJson(jsonData);
        if (_patients.status == true) {
          return _patients;
        } else {
          throw Exception('User not found');
        }
      } else {
        print("statuscode:${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }

  void beforeSessionData(stressLevel, text, sessionId, patientId) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var userDataJson = sp.getString('userData');
    Map<String, dynamic> userDataMap = json.decode(userDataJson!);
    Map<String, dynamic> data = userDataMap['data'];
    var useId = data['id'];
    print(useId);
    final apiUrl = Uri.parse(AppConfig.baseUrl + 'track/stress/$useId');

    final requestBody = {
      "user_id": useId,
      "session_user_id": patientId,
      "stress_level_id": stressLevel,
      "type_id": 0,
      "content_id": sessionId,
      "notes": text
    };
    print(requestBody);
    final encodedBody = json.encode(requestBody);
    print(encodedBody);

    try {
      final response = await http.post(apiUrl,
          body: encodedBody, headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        print('Response data: ${response.body}');
        // Get.offNamed(AppRoutes.homeContainerScreen);
        var data = jsonDecode(response.body);

        if (data['status'] == true) {
          sp.setString('patientId', patientId);
          print(sp.setString('patientId', patientId));
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
