import 'dart:convert';

import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/profile_settings_page/models/settings_data_model.dart';
import 'package:goroga/widgets/config.dart';
import 'package:http/http.dart' as http;

class SettingController extends GetxController {
  getSettingData() async {
    final apiUrl = Uri.parse(AppConfig.baseUrl + 'setting/data');
    try {
      final response = await http.get(apiUrl);
      dynamic jsonData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        SettingDataModel surveyModel = SettingDataModel.fromJson(jsonData);

        if (surveyModel.status == true) {
          return surveyModel;
        } else {
          print('Status is not true');
        }
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
      print('Network error: $e');
    }
  }
}
