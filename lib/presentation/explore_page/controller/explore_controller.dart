import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/explore_page/models/program_model.dart';

class ExploreController extends GetxController {
  // ExploreController(this.exploreModelObj);

// TextEditingController searchBarController = TextEditingController();

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
    try {
      final String jsonString =
          await rootBundle.loadString('jsonfiles/program_thumbnails.json');
    //  print(jsonString);
      // final list = json.decode(jsonData) as List<dynamic>;
// print(list);
      // return list.map((e) => ProgramModel.fromJson(e)).toList();
      Map<String, dynamic> decode = json.decode(jsonString);
      ProgramModel programModel = ProgramModel.fromJson(decode);
      // print(programModel);
      return programModel;
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
