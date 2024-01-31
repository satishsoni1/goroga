import 'dart:convert';

import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/my_library_page/models/my_library_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/config.dart';
import 'package:http/http.dart' as http;

class MyLibraryController extends GetxController {
  MyLibraryController(this.myLibraryModelObj);

  Rx<MyLibraryModel> myLibraryModelObj;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // final ApiService apiService = ApiService('http://192.168.7.1/status.json');
  // final RxMap responseData = {}.obs;
  // final RxString errorMessage = ''.obs;
  // Future<void> fetchData() async {
  //   responseData.value = {};
  //   try {
  //     final data = await apiService.fetchData();
  //     responseData.value = data;
  //     errorMessage.value = '';
  //   } catch (e) {
  //     responseData.value = {};
  //     errorMessage.value = 'An error occurred: $e';
  //   }
  // }
  void fetchStatus(status) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var userDataJson = sp.getString('userData');
    Map<String, dynamic> userDataMap = json.decode(userDataJson!);
    Map<String, dynamic> data = userDataMap['data'];
    var useId = data['id'];
    final apiUrl = Uri.parse(AppConfig.baseUrl + 'device/status/$useId');
    final requestBody = {
      "current_time": 225,
      "current_state": "IDLE",
      "therapy_state": {"current_step": 5, "start_at": 30, "end_at": 3630},
      "electrode_state": {
        "electrodes_connected": false,
        "high_val": 33,
        "low_val": 42,
        "minimum": 52
      },
      "device_info": {
        "serial_number": "E66178C1272D4729",
        "firmware_version": "1.1.3",
        "using_default_config": true
      }
    };
    final encodedBody = json.encode(requestBody);
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
}
