import 'dart:convert';

import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/profile_settings_page/models/total_sessions_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/config.dart';

class TotalSessionController extends GetxController {
  Rx<TotalSessionModel> sessions = Rx<TotalSessionModel>(TotalSessionModel());
  fetchHistory() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var userDataJson = sp.getString('userData');
    Map<String, dynamic> userDataMap = json.decode(userDataJson!);
    Map<String, dynamic> data = userDataMap['data'];

    final userId = data['id'];
    final apiUrl = Uri.parse(AppConfig.baseUrl + 'totalSessionPlayed/$userId');
    try {
      final response = await http.get(apiUrl);
      dynamic jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        TotalSessionModel stressLevelModel =
            TotalSessionModel.fromJson(jsonData);
        // print(sessionHistoryModel);
        if (stressLevelModel.status == true) {
          sessions.value = stressLevelModel;
          print(sessions.value);
        }else{
          print('Data not found');
        }
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
      print("from total session controller");

      print('Network error 5: $e');
    }
  }

  @override
  void onReady() {
    super.onReady();
    // fetchHistory();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
