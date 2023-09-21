import '../playlists_screen/widgets/playlists_item_widget.dart';import 'controller/playlists_controller.dart';import 'models/playlists_item_model.dart';import 'package:flutter/material.dart';import 'package:goroga/core/app_export.dart';import 'package:goroga/widgets/app_bar/appbar_image.dart';import 'package:goroga/widgets/app_bar/appbar_title.dart';import 'package:goroga/widgets/app_bar/custom_app_bar.dart';import 'package:goroga/presentation/new_playlist_bottomsheet/new_playlist_bottomsheet.dart';import 'package:goroga/presentation/new_playlist_bottomsheet/controller/new_playlist_controller.dart';class PlaylistsScreen extends GetWidget<PlaylistsController> {@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(backgroundColor: ColorConstant.whiteA700, appBar: CustomAppBar(height: getVerticalSize(51), leadingWidth: 52, leading: AppbarImage(height: getSize(28), width: getSize(28), svgPath: ImageConstant.imgArrowleft, margin: getMargin(left: 24, top: 10, bottom: 13), onTap: () {onTapArrowleft24();}), title: AppbarTitle(text: "lbl_playlists".tr, margin: getMargin(left: 16)), actions: [AppbarImage(height: getSize(28), width: getSize(28), svgPath: ImageConstant.imgSearch, margin: getMargin(left: 24, top: 10, right: 13)), AppbarImage(height: getSize(28), width: getSize(28), svgPath: ImageConstant.imgClock28x28, margin: getMargin(left: 20, top: 10, right: 37))]), body: Container(width: double.maxFinite, padding: getPadding(left: 24, top: 30, right: 24, bottom: 30), child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [Row(children: [Text("lbl_sort_by".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtUrbanistRomanBold20), Spacer(), Padding(padding: getPadding(top: 2, bottom: 2), child: Text("lbl_recently_added".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtUrbanistRomanBold16RedA70002.copyWith(letterSpacing: getHorizontalSize(0.2)))), CustomImageView(svgPath: ImageConstant.imgSort20x20, height: getSize(20), width: getSize(20), margin: getMargin(left: 12, bottom: 4))]), Padding(padding: getPadding(top: 22), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray100)), GestureDetector(onTap: () {onTapRowplus();}, child: Padding(padding: getPadding(top: 23), child: Row(children: [Card(clipBehavior: Clip.antiAlias, elevation: 0, margin: EdgeInsets.all(0), shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.circleBorder40), child: Container(height: getSize(80), width: getSize(80), padding: getPadding(all: 24), decoration: AppDecoration.gradientRed700RedA70002.copyWith(borderRadius: BorderRadiusStyle.circleBorder40), child: Stack(children: [CustomImageView(svgPath: ImageConstant.imgPlus, height: getSize(32), width: getSize(32), alignment: Alignment.center)]))), Padding(padding: getPadding(left: 16, top: 30, bottom: 27), child: Text("msg_add_new_playlis".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtUrbanistRomanBold18))]))), Padding(padding: getPadding(top: 24), child: Obx(() => ListView.separated(physics: NeverScrollableScrollPhysics(), shrinkWrap: true, separatorBuilder: (context, index) {return SizedBox(height: getVerticalSize(24));}, itemCount: controller.playlistsModelObj.value.playlistsItemList.value.length, itemBuilder: (context, index) {PlaylistsItemModel model = controller.playlistsModelObj.value.playlistsItemList.value[index]; return PlaylistsItemWidget(model, onTapRowlightbulb: () {onTapRowlightbulb();});})))])))); } 
onTapRowlightbulb() { Get.toNamed(AppRoutes.playlistDetailsScreen); } 
onTapRowplus() { Get.bottomSheet(NewPlaylistBottomsheet(Get.put(NewPlaylistController(),),),isScrollControlled: true,); } 
onTapArrowleft24() { Get.back(); } 
 }