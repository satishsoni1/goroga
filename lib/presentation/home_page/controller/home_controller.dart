import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/home_page/models/home_model.dart';

class HomeController extends GetxController {
  // HomeController(this.homeModelObj);

  // late List<Categories> homeModelObj;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getData() async {
    try {
      // print("fomr controller");
      final jsonString =
          await rootBundle.loadString('jsonfiles/sessions_thumbnails.json');
          // print(jsonString);
      Map<String, dynamic> decode = json.decode(jsonString);
      HomeModel homeModel = HomeModel.fromJson(decode);
      // print(homeModel);
      return homeModel;
      // List<Categories>? categories = homeModel.categories;
      // if (categories != null) {
      //   for (Categories category in categories) {
        
      //     print('Category Title: ${category.title}');
      //     List<Data>? data = category.data;
      //     // print(data);
      //     if (data != null) {
      //       for (Data item in data) {
      //         print('Data Title: ${item.title}');
      //       }
      //     }
      //   }
      // }
    } catch (e) {
      print("from error");
      print(e);
    }
  }

  // String jsonString ='jsonfiles/sessions_thumbnails.json';
  // Map<String,dynamic> jsonData = json.decode(jsonString);
}
