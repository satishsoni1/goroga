import 'controller/profile_controller.dart';
import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/app_bar/appbar_image.dart';
import 'package:goroga/widgets/app_bar/appbar_title.dart';
import 'package:goroga/widgets/app_bar/custom_app_bar.dart';
import 'package:goroga/widgets/custom_button.dart';
import 'package:goroga/widgets/custom_phone_number.dart';
import 'package:goroga/widgets/custom_text_form_field.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(48),
                leadingWidth: 52,
                leading: AppbarImage(
                    height: getSize(28),
                    width: getSize(28),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 24, top: 11, bottom: 9),
                    onTap: () {
                      onTapArrowleft();
                    }),
                title: AppbarTitle(
                    text: "msg_fill_your_profi".tr,
                    margin: getMargin(left: 16))),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 23, top: 48, right: 23, bottom: 48),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: getSize(140),
                          width: getSize(140),
                          margin: getMargin(top: 3),
                          child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgEllipse140x140,
                                    height: getSize(140),
                                    width: getSize(140),
                                    radius: BorderRadius.circular(
                                        getHorizontalSize(70)),
                                    alignment: Alignment.center),
                                CustomImageView(
                                    svgPath: ImageConstant.imgEdit,
                                    height: getSize(35),
                                    width: getSize(35),
                                    alignment: Alignment.bottomRight)
                              ])),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: controller.statusDefaultController,
                          hintText: "lbl_full_name".tr,
                          margin: getMargin(top: 24),
                          fontStyle:
                              TextFormFieldFontStyle.UrbanistRegular14Gray500),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: controller.statusDefaultOneController,
                          hintText: "lbl_nickname".tr,
                          margin: getMargin(top: 24),
                          fontStyle:
                              TextFormFieldFontStyle.UrbanistRegular14Gray500),
                      GestureDetector(
                          onTap: () {
                            onTapStatusDefault();
                          },
                          child: Container(
                              margin: getMargin(left: 1, top: 24, right: 1),
                              padding: getPadding(
                                  left: 20, top: 18, right: 20, bottom: 18),
                              decoration: AppDecoration.fillGray50.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder16),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                        padding: getPadding(top: 1, bottom: 1),
                                        child: Obx(() => Text(
                                            controller.profileModelObj.value
                                                .labelTxt.value,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtUrbanistRegular14
                                                .copyWith(
                                                    letterSpacing:
                                                        getHorizontalSize(
                                                            0.2))))),
                                    CustomImageView(
                                        svgPath: ImageConstant.imgCalendar,
                                        height: getSize(20),
                                        width: getSize(20))
                                  ]))),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: controller.statusDefaultTwoController,
                          hintText: "lbl_email".tr,
                          margin: getMargin(top: 24),
                          padding: TextFormFieldPadding.PaddingT18_1,
                          fontStyle:
                              TextFormFieldFontStyle.UrbanistRegular14Gray500,
                          textInputType: TextInputType.emailAddress,
                          suffix: Container(
                              margin: getMargin(
                                  left: 30, top: 18, right: 20, bottom: 18),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgArrowdown)),
                          suffixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(56))),
                      Padding(
                          padding: getPadding(top: 24),
                          child: Obx(() => CustomPhoneNumber(
                              country: controller.selectedCountry.value,
                              controller: controller.phoneNumberController,
                              onTap: (Country country) {
                                controller.selectedCountry.value = country;
                              }))),
                      Spacer(),
                      Padding(
                          padding: getPadding(left: 2),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: CustomButton(
                                        height: getVerticalSize(58),
                                        text: "lbl_skip".tr,
                                        margin: getMargin(right: 6),
                                        variant: ButtonVariant.OutlineGray800,
                                        padding: ButtonPadding.PaddingT18,
                                        fontStyle: ButtonFontStyle
                                            .UrbanistRomanBold16Gray800_1,
                                        onTap: () {
                                          onTapSkip();
                                        })),
                                Expanded(
                                    child: CustomButton(
                                        height: getVerticalSize(58),
                                        text: "lbl_continue".tr,
                                        margin: getMargin(left: 6),
                                        padding: ButtonPadding.PaddingT18,
                                        onTap: () {
                                          onTapContinue();
                                        }))
                              ]))
                    ]))));
  }

  Future<void> onTapStatusDefault() async {
    DateTime? dateTime = await showDatePicker(
        context: Get.context!,
        initialDate: controller.profileModelObj.value.selectedLabelTxt!.value,
        firstDate: DateTime(1970),
        lastDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
    controller.profileModelObj.value.selectedLabelTxt!.value = dateTime!;
    controller.profileModelObj.value.labelTxt.value =
        dateTime.format(DD_MM_YYYY);
  }

  onTapSkip() {
    Get.toNamed(
      AppRoutes.homeContainerScreen,
    );
  }

  onTapContinue() {
    Get.toNamed(
      AppRoutes.createNewPinScreen,
    );
  }

  onTapArrowleft() {
    Get.back();
  }
}
