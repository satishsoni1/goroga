import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/search_result_profile_tab_container_screen/models/search_result_profile_tab_container_model.dart';
import 'package:flutter/material.dart';

class SearchResultProfileTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TextEditingController filledSearchController = TextEditingController();

  Rx<SearchResultProfileTabContainerModel>
      searchResultProfileTabContainerModelObj =
      SearchResultProfileTabContainerModel().obs;

  late TabController frame5Controller =
      Get.put(TabController(vsync: this, length: 6));

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    filledSearchController.dispose();
  }
}
