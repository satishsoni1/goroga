import '../follow_artists_screen/widgets/followartists_item_widget.dart';import 'controller/follow_artists_controller.dart';import 'models/followartists_item_model.dart';import 'package:flutter/material.dart';import 'package:goroga/core/app_export.dart';import 'package:goroga/widgets/app_bar/appbar_image.dart';import 'package:goroga/widgets/app_bar/appbar_title.dart';import 'package:goroga/widgets/app_bar/custom_app_bar.dart';import 'package:goroga/widgets/custom_button.dart';class FollowArtistsScreen extends GetWidget<FollowArtistsController> {@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(backgroundColor: ColorConstant.whiteA700, appBar: CustomAppBar(height: getVerticalSize(48), leadingWidth: 52, leading: AppbarImage(height: getSize(28), width: getSize(28), svgPath: ImageConstant.imgArrowleft, margin: getMargin(left: 24, top: 11, bottom: 9), onTap: () {onTapArrowleft3();}), title: AppbarTitle(text: "lbl_follow_artists".tr, margin: getMargin(left: 16))), body: Container(width: double.maxFinite, padding: getPadding(left: 24, top: 26, right: 24, bottom: 26), child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [Container(width: getHorizontalSize(357), margin: getMargin(right: 22), child: Text("msg_follow_your_fav".tr, maxLines: null, textAlign: TextAlign.left, style: AppStyle.txtUrbanistRegular18.copyWith(letterSpacing: getHorizontalSize(0.2)))), Padding(padding: getPadding(top: 35), child: Obx(() => ListView.separated(physics: NeverScrollableScrollPhysics(), shrinkWrap: true, separatorBuilder: (context, index) {return SizedBox(height: getVerticalSize(16));}, itemCount: controller.followArtistsModelObj.value.followartistsItemList.value.length, itemBuilder: (context, index) {FollowartistsItemModel model = controller.followArtistsModelObj.value.followartistsItemList.value[index]; return FollowartistsItemWidget(model);})))])), bottomNavigationBar: Container(decoration: AppDecoration.outlineGray100.copyWith(borderRadius: BorderRadiusStyle.customBorderTL40), child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, children: [Container(width: double.maxFinite, padding: getPadding(all: 24), decoration: AppDecoration.outlineGray100.copyWith(borderRadius: BorderRadiusStyle.customBorderTL40), child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(child: CustomButton(height: getVerticalSize(58), text: "lbl_skip".tr, margin: getMargin(right: 6, bottom: 24), variant: ButtonVariant.OutlineGray800, padding: ButtonPadding.PaddingT18, fontStyle: ButtonFontStyle.UrbanistRomanBold16Gray800_1, onTap: () {onTapSkip();})), Expanded(child: CustomButton(height: getVerticalSize(58), text: "lbl_continue".tr, margin: getMargin(left: 6, bottom: 24), padding: ButtonPadding.PaddingT18, onTap: () {onTapContinue();}))]))])))); } 
onTapSkip() { Get.toNamed(AppRoutes.homeContainerScreen, ); } 
onTapContinue() { Get.toNamed(AppRoutes.homeContainerScreen, ); } 
onTapArrowleft3() { Get.back(); } 
 }
