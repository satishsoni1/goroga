import 'dart:convert';

import 'package:goroga/core/app_export.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/config.dart';
import '../models/stress_level_model.dart';

class StressLevelController extends GetxController {
  Rx<StressLevelModel> stressLevel =
      Rx<StressLevelModel>(StressLevelModel());
  fetchlevel() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var userDataJson = sp.getString('userData');
    Map<String, dynamic> userDataMap = json.decode(userDataJson!);
    Map<String, dynamic> data = userDataMap['data'];

    final userId = data['id'];
    print(userId);
    final apiUrl = Uri.parse(AppConfig.baseUrl + 'track/stress/$userId');
    print(apiUrl);
    try {
      final response = await http.get(apiUrl);
      dynamic jsonData = jsonDecode(response.body);
      print(response.body);

      if (response.statusCode == 200) {
        StressLevelModel stressLevelModel =
            StressLevelModel.fromJson(jsonData);
        // print(sessionHistoryModel);
        if (stressLevelModel.status == true) {
          stressLevel.value =stressLevelModel ;
          print( stressLevel.value);
        }
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
      print("from stress level controller");
      print('Network error 11: $e');
    }
  }

  @override
  void onReady() {
    super.onReady();
    fetchlevel();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
