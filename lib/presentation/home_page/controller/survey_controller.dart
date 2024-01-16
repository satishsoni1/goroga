import 'dart:convert';
import 'dart:developer';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/home_page/models/survey_model.dart';
import 'package:goroga/widgets/config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SurveyController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    fetchSurveyData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  var ansSurveyData = List<Data>.empty().obs;
  fetchSurveyData() async {
    final apiUrl = Uri.parse('https://api.goroga.in/api/survey');

    try {
      final response = await http.get(apiUrl);
      dynamic jsonData = jsonDecode(response.body);

      

      if (response.statusCode == 200) {
        // print('object');
        SurveyModel surveyModel = SurveyModel.fromJson(jsonData);
        // print('Parsed : ${surveyModel.toJson()}');

        if (surveyModel.status == true) {
          // print('Status is true');
          ansSurveyData = surveyModel.data!.obs;
          return surveyModel;
        } else {
          print('Status is not true');
        }
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
      print('Network error: $e');
    }
  }

  Future<void> send_data(ansSurveyData) async {
    print("this is send Data function");
    print(ansSurveyData);
    
    SharedPreferences sp = await SharedPreferences.getInstance();
    var userDataJson = sp.getString('userData');
    Map<String, dynamic> userDataMap = json.decode(userDataJson!);
    Map<String, dynamic> data = userDataMap['data'];
    var useId = data['id'];
    final apiUrl = Uri.parse(AppConfig.baseUrl+'/submit/$useId');

    final requestBody = {"questions": ansSurveyData};
    // print(requestBody);
    final encodedBody = json.encode(requestBody);
    print(encodedBody);

    try {
      final response = await http.post(apiUrl,
          body: encodedBody, headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        log('Response data: ${response.body}');
        Get.offAll(AppRoutes.homeContainerScreen);
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
