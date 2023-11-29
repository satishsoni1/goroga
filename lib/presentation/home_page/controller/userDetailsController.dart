import 'dart:convert';
import 'package:goroga/presentation/home_page/models/user_details.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/app_export.dart';

class UserDetailsController extends GetxController {
  Rx<UserDetailsModel> usersData = Rx<UserDetailsModel>(UserDetailsModel());
  Future<void> fetchUserData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var userDataJson = sp.getString('userData');
    Map<String, dynamic> userDataMap = json.decode(userDataJson!);
    Map<String, dynamic> data = userDataMap['data'];
    final apiToken = data['api_token'];
    print(apiToken);
    final apiUrl =
        Uri.parse('https://api.goroga.in/api/user?api_token=' + apiToken);
    try {
      final response = await http.get(apiUrl);
      // print(response.body)?;
      dynamic jsonData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        UserDetailsModel _usersData = UserDetailsModel.fromJson(jsonData);
        if (_usersData.success == true) {
          usersData.value = _usersData;
          

        }
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
      print('Network error 11: $e');
    }
  }

  @override
  void onReady() {
    super.onReady();
    fetchUserData();
  }
}
