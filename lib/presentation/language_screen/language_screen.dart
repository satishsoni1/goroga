import 'controller/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/app_bar/appbar_image.dart';
import 'package:goroga/widgets/app_bar/appbar_title.dart';
import 'package:goroga/widgets/app_bar/custom_app_bar.dart';
import 'package:goroga/widgets/custom_radio_button.dart';

class LanguageScreen extends GetWidget<LanguageController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(52),
                leadingWidth: 52,
                leading: AppbarImage(
                    height: getSize(28),
                    width: getSize(28),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 24, top: 10, bottom: 14),
                    onTap: () {
                      onTapArrowleft42();
                    }),
                title: AppbarTitle(
                    text: "lbl_language".tr, margin: getMargin(left: 16))),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, top: 29, right: 24, bottom: 29),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("lbl_suggested".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtUrbanistRomanBold20),
                      Padding(
                          padding: getPadding(top: 22),
                          child: Obx(() => Column(children: [
                                CustomRadioButton(
                                    width: getHorizontalSize(380),
                                    text: "lbl_english_us".tr,
                                    value: controller.languageModelObj.value
                                        .radioList.value[0],
                                    groupValue: controller.radioGroup.value,
                                    fontStyle:
                                        RadioFontStyle.UrbanistSemiBold18,
                                    isRightCheck: true,
                                    onChange: (value) {
                                      controller.radioGroup.value = value;
                                    }),
                                CustomRadioButton(
                                    width: getHorizontalSize(380),
                                    text: "lbl_english_uk".tr,
                                    value: controller.languageModelObj.value
                                        .radioList.value[1],
                                    groupValue: controller.radioGroup.value,
                                    margin: getMargin(top: 20),
                                    fontStyle:
                                        RadioFontStyle.UrbanistSemiBold18,
                                    isRightCheck: true,
                                    onChange: (value) {
                                      controller.radioGroup.value = value;
                                    })
                              ]))),
                      Padding(
                          padding: getPadding(top: 30),
                          child: Divider(
                              height: getVerticalSize(1),
                              thickness: getVerticalSize(1),
                              color: ColorConstant.blueGray100)),
                      Padding(
                          padding: getPadding(top: 30),
                          child: Text("lbl_others".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtUrbanistRomanBold20)),
                      Padding(
                          padding: getPadding(top: 23, bottom: 5),
                          child: Obx(() => Column(children: [
                                CustomRadioButton(
                                    width: getHorizontalSize(380),
                                    text: "lbl_mandarin".tr,
                                    value: controller.languageModelObj.value
                                        .radioList1.value[0],
                                    groupValue: controller.radioGroup1.value,
                                    fontStyle:
                                        RadioFontStyle.UrbanistSemiBold18,
                                    isRightCheck: true,
                                    onChange: (value) {
                                      controller.radioGroup1.value = value;
                                    }),
                                CustomRadioButton(
                                    width: getHorizontalSize(380),
                                    text: "lbl_hindi".tr,
                                    value: controller.languageModelObj.value
                                        .radioList1.value[1],
                                    groupValue: controller.radioGroup1.value,
                                    margin: getMargin(top: 20),
                                    fontStyle:
                                        RadioFontStyle.UrbanistSemiBold18,
                                    isRightCheck: true,
                                    onChange: (value) {
                                      controller.radioGroup1.value = value;
                                    }),
                                CustomRadioButton(
                                    width: getHorizontalSize(380),
                                    text: "lbl_spanish".tr,
                                    value: controller.languageModelObj.value
                                        .radioList1.value[2],
                                    groupValue: controller.radioGroup1.value,
                                    margin: getMargin(top: 21),
                                    fontStyle:
                                        RadioFontStyle.UrbanistSemiBold18,
                                    isRightCheck: true,
                                    onChange: (value) {
                                      controller.radioGroup1.value = value;
                                    }),
                                CustomRadioButton(
                                    width: getHorizontalSize(380),
                                    text: "lbl_french".tr,
                                    value: controller.languageModelObj.value
                                        .radioList1.value[3],
                                    groupValue: controller.radioGroup1.value,
                                    margin: getMargin(top: 17),
                                    fontStyle:
                                        RadioFontStyle.UrbanistSemiBold18,
                                    isRightCheck: true,
                                    onChange: (value) {
                                      controller.radioGroup1.value = value;
                                    }),
                                CustomRadioButton(
                                    width: getHorizontalSize(380),
                                    text: "lbl_arabic".tr,
                                    value: controller.languageModelObj.value
                                        .radioList1.value[4],
                                    groupValue: controller.radioGroup1.value,
                                    margin: getMargin(top: 20),
                                    fontStyle:
                                        RadioFontStyle.UrbanistSemiBold18,
                                    isRightCheck: true,
                                    onChange: (value) {
                                      controller.radioGroup1.value = value;
                                    }),
                                CustomRadioButton(
                                    width: getHorizontalSize(380),
                                    text: "lbl_bengali".tr,
                                    value: controller.languageModelObj.value
                                        .radioList1.value[5],
                                    groupValue: controller.radioGroup1.value,
                                    margin: getMargin(top: 21),
                                    fontStyle:
                                        RadioFontStyle.UrbanistSemiBold18,
                                    isRightCheck: true,
                                    onChange: (value) {
                                      controller.radioGroup1.value = value;
                                    })
                              ])))
                    ]))));
  }

  onTapArrowleft42() {
    Get.back();
  }
}
