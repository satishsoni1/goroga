import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/explore_page/models/program_model.dart';
import 'package:goroga/widgets/config.dart';
import 'package:http/http.dart' as http;

class ExploreController extends GetxController {
  // ExploreController(this.exploreModelObj);

TextEditingController searchBarController = TextEditingController();

// Rx<ExploreModel> exploreModelObj;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    // searchBarController.dispose();
  }

  getData() async {
    final apiUrl = Uri.parse(AppConfig.baseUrl+'programs');
    try {
      final response = await http.get(apiUrl);
      dynamic jsonData = jsonDecode(response.body);

      // print('Response status code: ${response.statusCode}');
      // print('Response body: $jsonData');

      if (response.statusCode == 200) {
        // print('object');
        ProgramModel programModel = ProgramModel.fromJson(jsonData);
        // print('Parsed doctorDataModel: ${programModel.toJson()}');
// // 
        if (programModel.status == true) {
          // print('Status is true');
          return programModel;
        } else {
          print('Status is not true');
        }
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
      print('Network error: $e');
    }
    try {
//       final String jsonString =
//           await rootBundle.loadString('jsonfiles/program_thumbnails.json');
//     //  print(jsonString);
//       // final list = json.decode(jsonData) as List<dynamic>;
// // print(list);
//       // return list.map((e) => ProgramModel.fromJson(e)).toList();
//       Map<String, dynamic> decode = json.decode(jsonString);
//       ProgramModel programModel = ProgramModel.fromJson(decode);
//       // print(programModel);
//       return programModel;
      //     List<Programs>? programs = programModel.programs;
      //     if (programs != null) {
      //       for (Programs program in programs) {

      //         print('Program Title: ${program.title}');
      //         List<Data>? data = program.data;
      //         // print(data);
      //         if (data != null) {
      //           for (Data item in data) {
      //             print('Data Title: ${item.title}');
      //           }
      //         }
      //       }
      // }
    } catch (e) {
      print("from error");
      print(e);
    }
  }
}
