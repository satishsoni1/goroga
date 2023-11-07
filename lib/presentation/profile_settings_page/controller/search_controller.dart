import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:goroga/core/app_export.dart';
// 
class searchBarController extends GetxController {

TextEditingController searchController = TextEditingController();


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    // searchBarController.dispose();
  }

 
  
}
