import 'dart:convert';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/home_page/models/home_model.dart';
import 'package:http/http.dart' as http;
import 'package:goroga/widgets/config.dart';
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
    // print('data');
    final apiUrl = Uri.parse(AppConfig.baseUrl+'sessions');
    try {
      final response = await http.get(apiUrl);
      dynamic jsonData = jsonDecode(response.body);

      // print('Response status code: ${response.statusCode}');
      // print('Response body: $jsonData');

      if (response.statusCode == 200) {
        // print('object');
        HomeModel homeModel = HomeModel.fromJson(jsonData);
        // print('Parsed doctorDataModel: ${homeModel.toJson()}');

        if (homeModel.status == true) {
          // print('Status is true');
          return homeModel;
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
      // print("fomr controller");
      // final jsonString =
      //     await rootBundle.loadString('jsonfiles/sessions_thumbnails.json');
      //     // print(jsonString);
      // Map<String, dynamic> decode = json.decode(jsonString);
      // HomeModel homeModel = HomeModel.fromJson(decode);
      // //print(homeModel);
      // return homeModel;
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
