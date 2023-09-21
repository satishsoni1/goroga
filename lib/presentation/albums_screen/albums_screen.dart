import '../albums_screen/widgets/albums_item_widget.dart';import 'controller/albums_controller.dart';import 'models/albums_item_model.dart';import 'package:flutter/material.dart';import 'package:goroga/core/app_export.dart';import 'package:goroga/widgets/app_bar/appbar_image.dart';import 'package:goroga/widgets/app_bar/appbar_title.dart';import 'package:goroga/widgets/app_bar/custom_app_bar.dart';class AlbumsScreen extends GetWidget<AlbumsController> {@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(backgroundColor: ColorConstant.whiteA700, appBar: CustomAppBar(height: getVerticalSize(48), leadingWidth: 52, leading: AppbarImage(height: getSize(28), width: getSize(28), svgPath: ImageConstant.imgArrowleft, margin: getMargin(left: 24, top: 10, bottom: 10), onTap: () {onTapArrowleft28();}), title: AppbarTitle(text: "lbl_albums".tr, margin: getMargin(left: 16)), actions: [AppbarImage(height: getSize(28), width: getSize(28), svgPath: ImageConstant.imgSearch, margin: getMargin(left: 24, top: 10, right: 10)), AppbarImage(height: getSize(28), width: getSize(28), svgPath: ImageConstant.imgClock28x28, margin: getMargin(left: 20, top: 10, right: 34))]), body: Container(width: double.maxFinite, padding: getPadding(left: 24, top: 33, right: 24, bottom: 33), child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("lbl_sort_by".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtUrbanistRomanBold20), Spacer(), Padding(padding: getPadding(top: 2, bottom: 2), child: Text("lbl_recently_added".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtUrbanistRomanBold16RedA70002.copyWith(letterSpacing: getHorizontalSize(0.2)))), CustomImageView(svgPath: ImageConstant.imgSort20x20, height: getSize(20), width: getSize(20), margin: getMargin(left: 12, bottom: 4))]), Padding(padding: getPadding(top: 22), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray100)), Padding(padding: getPadding(top: 23), child: Obx(() => ListView.separated(physics: NeverScrollableScrollPhysics(), shrinkWrap: true, separatorBuilder: (context, index) {return SizedBox(height: getVerticalSize(24));}, itemCount: controller.albumsModelObj.value.albumsItemList.value.length, itemBuilder: (context, index) {AlbumsItemModel model = controller.albumsModelObj.value.albumsItemList.value[index]; return AlbumsItemWidget(model);})))])))); } 
onTapArrowleft28() { Get.back(); } 
 }
