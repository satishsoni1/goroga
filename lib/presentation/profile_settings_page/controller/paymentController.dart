import 'dart:convert';
import 'package:goroga/presentation/profile_settings_page/models/payment_model.dart';
import 'package:goroga/widgets/config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/app_export.dart';

class PaymentController extends GetxController {
  Rx<PaymentModel> paymentData = Rx<PaymentModel>(PaymentModel());
  Future<void> fetchpaymentData(int? id) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var userDataJson = sp.getString('userData');
    Map<String, dynamic> userDataMap = json.decode(userDataJson!);
    Map<String, dynamic> data = userDataMap['data'];
    final apiToken = data['api_token'];
    print(apiToken);
    final apiUrl =
        Uri.parse(AppConfig.baseUrl+'/e_services?api_token=' + apiToken);
    try {
      final response = await http.get(apiUrl);
      // print(response.body)?;
      dynamic jsonData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        PaymentModel paymentModel = PaymentModel.fromJson(jsonData);
        if (paymentModel.success == true) {
          print(id);
          // paymentData.value = paymentModel;
          // List<Data> data = paymentData.value.data!.where((element) {
          //   return element.name!.en!
          //       .toLowerCase()
          //       .contains(searchController.text.toLowerCase());
          // }).toList();

          print(paymentModel.data);
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
  }
}
