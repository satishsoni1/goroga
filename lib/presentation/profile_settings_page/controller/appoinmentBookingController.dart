import 'dart:convert';

import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/appoinmentsModel.dart';

class AppoinmentbookingController extends GetxController {
  Rx<AppointmentsModel> appointments =
      Rx<AppointmentsModel>(AppointmentsModel());

  // Future<void> getServices() async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   var userDataJson = sp.getString('userData');
  //   Map<String, dynamic> userDataMap = json.decode(userDataJson!);
  //   Map<String, dynamic> data = userDataMap['data'];

  //   final apiToken = data['api_token'];
  //   final apiUrl =
  //       Uri.parse('https://api.goroga.in/api/bookings?api_token=' + apiToken);

  //   try {
  //     final response = await http.get(apiUrl);
  //     dynamic jsonData = jsonDecode(response.body);
  //     // print(jsonData);
  //     if (response.statusCode == 200) {
  //       AppointmentsModel appointmentsModel =
  //           AppointmentsModel.fromJson(jsonData);
  //       if (appointmentsModel.success == true) {
  //         print(appointmentsModel);
  //         appointments.value = appointmentsModel;
  //       }
  //     } else {
  //       print('Failed to fetch data');
  //     }
  //   } catch (e) {
  //     print('Network error: $e');
  //   }
  // }

  Future<void> getBookings() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var userDataJson = sp.getString('userData');
    Map<String, dynamic> userDataMap = json.decode(userDataJson!);
    Map<String, dynamic> data = userDataMap['data'];

    final apiToken = data['api_token'];
    print(apiToken);
    final apiUrl =
        Uri.parse(AppConfig.baseUrl+'/bookings?api_token=' + apiToken);

    try {
      final response = await http.get(apiUrl);
      dynamic jsonData = jsonDecode(response.body);
      print(apiToken);
        // log('Response data: ${response.body}');
      if (response.statusCode == 200) {
        AppointmentsModel appointmentsModel =
            AppointmentsModel.fromJson(jsonData);
        if (appointmentsModel.success == true) {
          appointments.value = appointmentsModel;
        }
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
      print('Network error: $e');
    }
  }

  @override
  void onReady() {
    getBookings();
    super.onReady();
  }
}
