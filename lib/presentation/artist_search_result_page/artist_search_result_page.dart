import '../artist_search_result_page/widgets/listellipseone_item_widget.dart';import 'controller/artist_search_result_controller.dart';import 'models/artist_search_result_model.dart';import 'models/listellipseone_item_model.dart';import 'package:flutter/material.dart';import 'package:goroga/core/app_export.dart';
// ignore_for_file: must_be_immutable
class ArtistSearchResultPage extends StatelessWidget {ArtistSearchResultController controller = Get.put(ArtistSearchResultController(ArtistSearchResultModel().obs));

@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(backgroundColor: Colors.transparent, body: Container(width: double.maxFinite, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Padding(padding: getPadding(left: 24, top: 44, right: 24), child: Obx(() => ListView.separated(physics: NeverScrollableScrollPhysics(), shrinkWrap: true, separatorBuilder: (context, index) {return SizedBox(height: getVerticalSize(16));}, itemCount: controller.artistSearchResultModelObj.value.listellipseoneItemList.value.length, itemBuilder: (context, index) {ListellipseoneItemModel model = controller.artistSearchResultModelObj.value.listellipseoneItemList.value[index]; return ListellipseoneItemWidget(model, onTapRowellipseone: () {onTapRowellipseone();});})))])))); } 
onTapRowellipseone() { Get.toNamed(AppRoutes.artistDetailsScreen, ); } 
 }
