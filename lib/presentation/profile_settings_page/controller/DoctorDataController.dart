import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:goroga/presentation/profile_settings_page/models/doctor_Data_Model.dart';
import 'package:http/http.dart' as http;
import '../../../core/app_export.dart';
class DoctorDataController extends GetxController {
  Rx<DoctorDataModel> doctorData = Rx<DoctorDataModel>(DoctorDataModel());
  final searchController = TextEditingController();
  Rx<DoctorDataModel> filteredDoctorsBackup =
      Rx<DoctorDataModel>(DoctorDataModel());
  RxBool isEmpty=false.obs;

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
        }
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
          isEmpty=true.obs;
      print('Network error 11: $e');
    }
  }

  filterDoctors() async {
    await fetchDoctorData();
    // print("filter data function call ");
    // print(filteredDoctorsBackup.value.data!.length);
    late List<Data> filteredList;

    if (searchController.text.isNotEmpty) {
      filteredList = filteredDoctorsBackup.value.data!.where((element) {
        return element.name!.en!
            .toLowerCase()
            .contains(searchController.text.toLowerCase());
      }).toList();
      // print(filteredList.length);
      doctorData.value.data!.clear();
      doctorData.value.data!.addAll(filteredList);
      // print(doctorData.value.data!.length);
    } else if (searchController.text.isEmpty) {
      print("in the else");
    }
  }

  @override
  void onReady() {
    fetchDoctorData();
    super.onReady();
  }
}
