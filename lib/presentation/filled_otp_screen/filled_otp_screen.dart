import 'controller/filled_otp_controller.dart';import 'package:flutter/material.dart';import 'package:flutter/services.dart';import 'package:goroga/core/app_export.dart';import 'package:goroga/widgets/app_bar/appbar_image.dart';import 'package:goroga/widgets/app_bar/appbar_title.dart';import 'package:goroga/widgets/app_bar/custom_app_bar.dart';import 'package:goroga/widgets/custom_button.dart';import 'package:pin_code_fields/pin_code_fields.dart';class FilledOtpScreen extends GetWidget<FilledOtpController> {@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(resizeToAvoidBottomInset: false, backgroundColor: ColorConstant.whiteA700, appBar: CustomAppBar(height: getVerticalSize(52), leadingWidth: 52, leading: AppbarImage(height: getSize(28), width: getSize(28), svgPath: ImageConstant.imgArrowleft, margin: getMargin(left: 24, top: 11, bottom: 13), onTap: () {onTapArrowleft5();}), title: AppbarTitle(text: "lbl_forgot_password".tr, margin: getMargin(left: 16))), body: Container(width: double.maxFinite, padding: getPadding(left: 24, right: 24), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Padding(padding: getPadding(top: 16), child: Text("msg_code_has_been_s".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtUrbanistRomanMedium18.copyWith(letterSpacing: getHorizontalSize(0.2)))), Padding(padding: getPadding(top: 61), child: Obx(() => PinCodeTextField(appContext: context, controller: controller.otpController.value, length: 4, obscureText: false, obscuringCharacter: '*', keyboardType: TextInputType.number, autoDismissKeyboard: true, enableActiveFill: true, inputFormatters: [FilteringTextInputFormatter.digitsOnly], onChanged: (value) {}, textStyle: TextStyle(color: ColorConstant.gray900, fontSize: getFontSize(24), fontFamily: 'Urbanist', fontWeight: FontWeight.w700), pinTheme: PinTheme(fieldHeight: getHorizontalSize(61), fieldWidth: getHorizontalSize(83), shape: PinCodeFieldShape.box, borderRadius: BorderRadius.circular(getHorizontalSize(16)), selectedFillColor: ColorConstant.gray50, activeFillColor: ColorConstant.gray50, inactiveFillColor: ColorConstant.gray50, inactiveColor: ColorConstant.blueGray100, selectedColor: ColorConstant.blueGray100, activeColor: ColorConstant.blueGray100)))), Padding(padding: getPadding(top: 61), child: RichText(text: TextSpan(children: [TextSpan(text: "lbl_resend_code_in".tr, style: TextStyle(color: ColorConstant.gray900, fontSize: getFontSize(18), fontFamily: 'Urbanist', fontWeight: FontWeight.w500, letterSpacing: getHorizontalSize(0.2))), TextSpan(text: "lbl_53".tr, style: TextStyle(color: ColorConstant.redA700, fontSize: getFontSize(18), fontFamily: 'Urbanist', fontWeight: FontWeight.w500, letterSpacing: getHorizontalSize(0.2))), TextSpan(text: "lbl_s".tr, style: TextStyle(color: ColorConstant.gray900, fontSize: getFontSize(18), fontFamily: 'Urbanist', fontWeight: FontWeight.w500, letterSpacing: getHorizontalSize(0.2)))]), textAlign: TextAlign.left))])), bottomNavigationBar: CustomButton(height: getVerticalSize(55), text: "lbl_verify".tr, margin: getMargin(left: 24, right: 24, bottom: 48), padding: ButtonPadding.PaddingT18, onTap: () {onTapVerify();}))); } 
onTapVerify() { Get.toNamed(AppRoutes.createNewPasswordScreen, ); } 
onTapArrowleft5() { Get.back(); } 
 }
