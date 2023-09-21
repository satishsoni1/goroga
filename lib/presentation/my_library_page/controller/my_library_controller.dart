import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/my_library_page/models/my_library_model.dart';
import 'api_service.dart';
class MyLibraryController extends GetxController 
{
  
  MyLibraryController(this.myLibraryModelObj);

  Rx<MyLibraryModel> myLibraryModelObj;

  @override void onReady() { super.onReady(); 
  } 
  @override void onClose() { super.onClose(); } 

  // final ApiService apiService = ApiService('http://192.168.7.1/status.json');
  final RxMap responseData = {}.obs;
  final RxString errorMessage = ''.obs;
  // Future<void> fetchData() async {
  //   responseData.value = {};
  //   try {
  //     final data = await apiService.fetchData();
  //     responseData.value = data;
  //     errorMessage.value = '';
  //   } catch (e) {
  //     responseData.value = {};
  //     errorMessage.value = 'An error occurred: $e';
  //   }
  // }
 }
