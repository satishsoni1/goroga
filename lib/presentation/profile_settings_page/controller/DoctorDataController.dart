import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:goroga/presentation/profile_settings_page/models/doctor_Data_Model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/app_export.dart';

class DoctorDataController extends GetxController {
  Rx<DoctorDataModel> doctorData = Rx<DoctorDataModel>(DoctorDataModel());
  TextEditingController searchController = TextEditingController();
  Rx<DoctorDataModel> filteredDoctorsBackup =
      Rx<DoctorDataModel>(DoctorDataModel());
  RxBool isEmpty = false.obs;

  String query = "";
  Future<void> fetchDoctorData() async {
    print("data fetch done");
    final apiUrl = Uri.parse('https://api.goroga.in/api/e_providers');
    try {
      final response = await http.get(apiUrl);
      dynamic jsonData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        DoctorDataModel doctorDataModel = DoctorDataModel.fromJson(jsonData);
        if (doctorDataModel.success == true) {
          filteredDoctorsBackup.value = doctorDataModel;
          doctorData.value = doctorDataModel;
          print(doctorData.value.data);
        }
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
      isEmpty = true.obs;
      print('Network error 11: $e');
    }
  }

  filterDoctors() async {
    await fetchDoctorData();
    
    late List<Data> filteredList;

    if (searchController.text.isNotEmpty) {
      filteredList = filteredDoctorsBackup.value.data!.where((element) {
        return element.name!.en!
            .toLowerCase()
            .contains(searchController.text.toLowerCase());
      }).toList();
      doctorData.value.data!.clear();
      doctorData.value.data!.addAll(filteredList);
    } else if (searchController.text.isEmpty) {
      print("in the else");
    }
  }

  Future<void> confirmAppointment(int doctorId, String doctorName, String selectedDayTime) async {
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
      final response = await http.post(apiUrl,
          body: encodedBody, headers: {"Content-Type": "application/json"});
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
    fetchDoctorData();
    super.onReady();
  }
}
