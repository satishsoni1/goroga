import 'dart:convert';

import 'package:goroga/core/app_export.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/config.dart';
import '../models/total_minutes_model.dart';

class TotalMinutesController extends GetxController {
  Rx<TotalMinutesModel> minutes = Rx<TotalMinutesModel>(TotalMinutesModel());
  fetchHistory() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var userDataJson = sp.getString('userData');
    Map<String, dynamic> userDataMap = json.decode(userDataJson!);
    Map<String, dynamic> data = userDataMap['data'];

    final userId = data['id'];
    print(userId);
    final apiUrl = Uri.parse(AppConfig.baseUrl + 'totalMinuteSpend/$userId');
    try {
      final response = await http.get(apiUrl);
      dynamic jsonData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        TotalMinutesModel stressLevelModel =
            TotalMinutesModel.fromJson(jsonData);
        // print(sessionHistoryModel);
        if (stressLevelModel.status == true) {
          minutes.value = stressLevelModel;
          print(minutes.value);
        }
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
      print("from minutes level controller");

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
