import 'dart:convert';
import 'dart:developer';

import 'package:goroga/core/app_export.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/appoinmentsModel.dart';

class AppoinmentbookingController extends GetxController {
  Rx<AppointmentsModel> appointments =
      Rx<AppointmentsModel>(AppointmentsModel());

  Future<void> getServices() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var userDataJson = sp.getString('userData');
    Map<String, dynamic> userDataMap = json.decode(userDataJson!);
    Map<String, dynamic> data = userDataMap['data'];

    final apiToken = data['api_token'];
    final apiUrl =
        Uri.parse('https://api.goroga.in/api/bookings?api_token=' + apiToken);

    try {
      final response = await http.get(apiUrl);
      dynamic jsonData = jsonDecode(response.body);
      // print(jsonData);
      if (response.statusCode == 200) {
        AppointmentsModel appointmentsModel =
            AppointmentsModel.fromJson(jsonData);
        if (appointmentsModel.success == true) {
          print(appointmentsModel);
          appointments.value = appointmentsModel;
        }
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
      print('Network error: $e');
    }
  }

  Future<void> getBookings() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var userDataJson = sp.getString('userData');
    Map<String, dynamic> userDataMap = json.decode(userDataJson!);
    Map<String, dynamic> data = userDataMap['data'];

    final apiToken = data['api_token'];
    final apiUrl =
        Uri.parse('https://api.goroga.in/api/bookings?api_token=' + apiToken);

    try {
      final response = await http.get(apiUrl);
      dynamic jsonData = jsonDecode(response.body);
      // print(jsonData);
      if (response.statusCode == 200) {
        AppointmentsModel appointmentsModel =
            AppointmentsModel.fromJson(jsonData);
        if (appointmentsModel.success == true) {
          print(appointmentsModel);
          appointments.value = appointmentsModel;
        }
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
      print('Network error: $e');
    }
  }

  Future<void> confirmAppointment(
      int doctorId, String doctorName, String selectedDayTime) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var userDataJson = sp.getString('userData');
    Map<String, dynamic> userDataMap = json.decode(userDataJson!);
    Map<String, dynamic> data = userDataMap['data'];
    final useId = data['id'];
    print(doctorId);
    final apiToken = data['api_token'];

    print(apiToken);
    final apiUrl =
        Uri.parse('https://api.goroga.in/api/bookings?api_token=' + apiToken);
    print(apiUrl);
    print(selectedDayTime);
    final requestBody = {
      "address": {
        "address": "test",
        "longitude": "0",
        "latitude": "0",
        "user_id": useId
      },
      "e_service": "1",
      "e_provider": "$doctorId",
      "taxes": "0",
      "quantity": "",
      "duration": 0,
      "user": "$useId",
      "booking_at": " ",
      "start_at": "$selectedDayTime",
      "coupon": "0"
    };
    print(requestBody);
    final encodedBody = json.encode(requestBody);

    print(encodedBody);
      try {
        final response = await http.post(apiUrl, body: encodedBody, headers: {
          "Content-Type": "application/json"
        });
        // print(response.body);
        if (response.statusCode == 200) {
          log('Response data: ${response.body}');
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
    getBookings();
    super.onReady();
  }
}
