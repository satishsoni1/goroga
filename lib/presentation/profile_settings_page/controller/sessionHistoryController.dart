import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/profile_settings_page/models/session_history_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/config.dart';

class SessionHistoryController extends GetxController {
  Rx<SessionHistoryModel> history =
      Rx<SessionHistoryModel>(SessionHistoryModel());
  fetchHistory() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var userDataJson = sp.getString('userData');
    Map<String, dynamic> userDataMap = json.decode(userDataJson!);
    Map<String, dynamic> data = userDataMap['data'];

    final userId = data['id'];
    print(userId);
    final apiUrl = Uri.parse(AppConfig.baseUrl + 'session/history/$userId');
    try {
      final response = await http.get(apiUrl);
      dynamic jsonData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        SessionHistoryModel sessionHistoryModel =
            SessionHistoryModel.fromJson(jsonData);
        // print(sessionHistoryModel);
        if (sessionHistoryModel.status == true) {
          history.value = sessionHistoryModel;
          print( history.value);
        }
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
      print('Network error 11: $e');
    }
  }

  @override
  void onReady() {
    super.onReady();
    fetchHistory();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
