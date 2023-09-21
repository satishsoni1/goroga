import '../search_result_profile_page/widgets/listname2_item_widget.dart';import 'controller/search_result_profile_controller.dart';import 'models/listname2_item_model.dart';import 'models/search_result_profile_model.dart';import 'package:flutter/material.dart';import 'package:goroga/core/app_export.dart';
// ignore_for_file: must_be_immutable
class SearchResultProfilePage extends StatelessWidget {SearchResultProfileController controller = Get.put(SearchResultProfileController(SearchResultProfileModel().obs));

@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(backgroundColor: Colors.transparent, body: Container(width: double.maxFinite, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Padding(padding: getPadding(left: 24, top: 24, right: 24), child: Obx(() => ListView.separated(physics: NeverScrollableScrollPhysics(), shrinkWrap: true, separatorBuilder: (context, index) {return SizedBox(height: getVerticalSize(24));}, itemCount: controller.searchResultProfileModelObj.value.listname2ItemList.value.length, itemBuilder: (context, index) {Listname2ItemModel model = controller.searchResultProfileModelObj.value.listname2ItemList.value[index]; return Listname2ItemWidget(model, onTapRowname: () {onTapRowname();});})))])))); } 
onTapRowname() { Get.toNamed(AppRoutes.profileDetailsScreen, ); } 
 }
