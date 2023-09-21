import 'controller/data_saver_storage_controller.dart';import 'package:flutter/material.dart';import 'package:goroga/core/app_export.dart';import 'package:goroga/widgets/app_bar/appbar_image.dart';import 'package:goroga/widgets/app_bar/appbar_title.dart';import 'package:goroga/widgets/app_bar/custom_app_bar.dart';import 'package:goroga/widgets/custom_switch.dart';class DataSaverStorageScreen extends GetWidget<DataSaverStorageController> {@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(backgroundColor: ColorConstant.whiteA700, appBar: CustomAppBar(height: getVerticalSize(51), leadingWidth: 52, leading: AppbarImage(height: getSize(28), width: getSize(28), svgPath: ImageConstant.imgArrowleft, margin: getMargin(left: 24, top: 10, bottom: 13), onTap: () {onTapArrowleft40();}), title: AppbarTitle(text: "msg_data_saver_st".tr, margin: getMargin(left: 16))), body: Container(width: double.maxFinite, padding: getPadding(left: 24, top: 28, right: 24, bottom: 28), child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [Text("lbl_data_saver".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtUrbanistRomanBold20), Padding(padding: getPadding(top: 27), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [Text("lbl_audio_quality".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtUrbanistSemiBold18Gray900.copyWith(letterSpacing: getHorizontalSize(0.2))), Container(width: getHorizontalSize(251), margin: getMargin(top: 4), child: Text("msg_sets_your_audio".tr, maxLines: null, textAlign: TextAlign.left, style: AppStyle.txtUrbanistRomanMedium14Gray900.copyWith(letterSpacing: getHorizontalSize(0.2))))]), Obx(() => CustomSwitch(margin: getMargin(top: 19, bottom: 21), value: controller.isSelectedSwitch.value, onChanged: (value) {controller.isSelectedSwitch.value = value;}))])), Padding(padding: getPadding(top: 25), child: Text("lbl_podcasts".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtUrbanistRomanBold20)), Padding(padding: getPadding(top: 27), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [Text("msg_download_audio".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtUrbanistSemiBold18Gray900.copyWith(letterSpacing: getHorizontalSize(0.2))), Padding(padding: getPadding(top: 6), child: Text("msg_save_video_podc".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtUrbanistRomanMedium14Gray900.copyWith(letterSpacing: getHorizontalSize(0.2))))]), Obx(() => CustomSwitch(margin: getMargin(top: 9, bottom: 12), value: controller.isSelectedSwitch1.value, onChanged: (value) {controller.isSelectedSwitch1.value = value;}))])), Padding(padding: getPadding(top: 27), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [Text("msg_stream_audio_on".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtUrbanistSemiBold18Gray900.copyWith(letterSpacing: getHorizontalSize(0.2))), Container(width: getHorizontalSize(252), margin: getMargin(top: 4), child: Text("msg_play_video_podc".tr, maxLines: null, textAlign: TextAlign.left, style: AppStyle.txtUrbanistRomanMedium14Gray900.copyWith(letterSpacing: getHorizontalSize(0.2))))]), Obx(() => CustomSwitch(margin: getMargin(top: 19, bottom: 20), value: controller.isSelectedSwitch2.value, onChanged: (value) {controller.isSelectedSwitch2.value = value;}))])), Padding(padding: getPadding(top: 27), child: Text("lbl_storage".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtUrbanistRomanBold20)), Padding(padding: getPadding(top: 23), child: Row(children: [Padding(padding: getPadding(top: 1), child: Text("lbl_other_apps".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtUrbanistSemiBold18Gray900.copyWith(letterSpacing: getHorizontalSize(0.2)))), Spacer(), Padding(padding: getPadding(bottom: 1), child: Text("lbl_75_4_gb".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtUrbanistSemiBold18Gray900.copyWith(letterSpacing: getHorizontalSize(0.2)))), CustomImageView(svgPath: ImageConstant.imgArrowdownGray90020x20, height: getSize(20), width: getSize(20), margin: getMargin(left: 20, bottom: 3))])), Padding(padding: getPadding(top: 24), child: Row(children: [Text("lbl_cache".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtUrbanistSemiBold18Gray900.copyWith(letterSpacing: getHorizontalSize(0.2))), Spacer(), Text("lbl_120_6_mb".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtUrbanistSemiBold18Gray900.copyWith(letterSpacing: getHorizontalSize(0.2))), CustomImageView(svgPath: ImageConstant.imgArrowdownGray90020x20, height: getSize(20), width: getSize(20), margin: getMargin(left: 20, top: 1, bottom: 1))])), Padding(padding: getPadding(top: 27), child: Row(children: [Padding(padding: getPadding(top: 2), child: Text("lbl_free_space".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtUrbanistSemiBold18Gray900.copyWith(letterSpacing: getHorizontalSize(0.2)))), Spacer(), Padding(padding: getPadding(bottom: 2), child: Text("lbl_50_5_gb".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtUrbanistSemiBold18Gray900.copyWith(letterSpacing: getHorizontalSize(0.2)))), CustomImageView(svgPath: ImageConstant.imgArrowdownGray90020x20, height: getSize(20), width: getSize(20), margin: getMargin(left: 20, bottom: 3))])), Padding(padding: getPadding(top: 24), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [Text("msg_remove_all_down".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtUrbanistSemiBold18Gray900.copyWith(letterSpacing: getHorizontalSize(0.2))), Container(width: getHorizontalSize(278), margin: getMargin(top: 6), child: Text("msg_remove_all_of_t".tr, maxLines: null, textAlign: TextAlign.left, style: AppStyle.txtUrbanistRomanMedium14Gray900.copyWith(letterSpacing: getHorizontalSize(0.2))))]), CustomImageView(svgPath: ImageConstant.imgArrowdownGray90020x20, height: getSize(20), width: getSize(20), margin: getMargin(left: 81, top: 23, bottom: 23))])), Padding(padding: getPadding(top: 26, bottom: 5), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [Text("lbl_clear_cache".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtUrbanistSemiBold18Gray900.copyWith(letterSpacing: getHorizontalSize(0.2))), Container(width: getHorizontalSize(245), margin: getMargin(top: 6), child: Text("msg_free_up_storage".tr, maxLines: null, textAlign: TextAlign.left, style: AppStyle.txtUrbanistRomanMedium14Gray900.copyWith(letterSpacing: getHorizontalSize(0.2))))]), CustomImageView(svgPath: ImageConstant.imgArrowdownGray90020x20, height: getSize(20), width: getSize(20), margin: getMargin(top: 23, bottom: 23))]))])))); } 
onTapArrowleft40() { Get.back(); } 
 }
