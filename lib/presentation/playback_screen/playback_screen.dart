import '../playback_screen/widgets/playback_item_widget.dart';import 'controller/playback_controller.dart';import 'models/playback_item_model.dart';import 'package:flutter/material.dart';import 'package:goroga/core/app_export.dart';import 'package:goroga/widgets/app_bar/appbar_image.dart';import 'package:goroga/widgets/app_bar/appbar_title.dart';import 'package:goroga/widgets/app_bar/custom_app_bar.dart';class PlaybackScreen extends GetWidget<PlaybackController> {@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(backgroundColor: ColorConstant.whiteA700, appBar: CustomAppBar(height: getVerticalSize(51), leadingWidth: 52, leading: AppbarImage(height: getSize(28), width: getSize(28), svgPath: ImageConstant.imgArrowleft, margin: getMargin(left: 24, top: 10, bottom: 13), onTap: () {onTapArrowleft39();}), title: AppbarTitle(text: "lbl_playback".tr, margin: getMargin(left: 16))), body: Container(width: getHorizontalSize(380), margin: getMargin(left: 24, top: 30, right: 24, bottom: 5), decoration: AppDecoration.fillWhiteA700, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Obx(() => ListView.separated(physics: NeverScrollableScrollPhysics(), shrinkWrap: true, separatorBuilder: (context, index) {return SizedBox(height: getVerticalSize(25));}, itemCount: controller.playbackModelObj.value.playbackItemList.value.length, itemBuilder: (context, index) {PlaybackItemModel model = controller.playbackModelObj.value.playbackItemList.value[index]; return PlaybackItemWidget(model);}))])))); } 
onTapArrowleft39() { Get.back(); } 
 }