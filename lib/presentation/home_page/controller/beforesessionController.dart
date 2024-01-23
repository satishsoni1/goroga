import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BeforeSessionController extends GetxController {
  void beforeSessionData(stressLevel, text, sessionId) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var userDataJson = sp.getString('userData');
    Map<String, dynamic> userDataMap = json.decode(userDataJson!);
    Map<String, dynamic> data = userDataMap['data'];
    var useId = data['id'];
    print(useId);
    final apiUrl =
        Uri.parse(AppConfig.baseUrl+'track/stress/$useId');

    final requestBody = {
      "user_id": useId,
      "session_user_id": "",
      "stress_level_id": stressLevel,
      "type_id": 0,
      "content_id":sessionId,
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
