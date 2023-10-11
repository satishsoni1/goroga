import 'controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/app_bar/appbar_image.dart';
import 'package:goroga/widgets/app_bar/appbar_title.dart';
import 'package:goroga/widgets/app_bar/custom_app_bar.dart';
import 'package:goroga/widgets/custom_button.dart';
import 'package:goroga/widgets/custom_drop_down.dart';
import 'package:goroga/widgets/custom_text_form_field.dart';

class EditProfileScreen extends GetWidget<EditProfileController> {
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
                    margin: getMargin(left: 24, top: 10, bottom: 10),
                    onTap: () {
                      onTapArrowleft36();
                    }),
                title: AppbarTitle(
                    text: "lbl_edit_profile".tr, margin: getMargin(left: 16))),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, top: 31, right: 24, bottom: 31),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller:
                              controller.statusFillTypeDefaultController,
                          hintText: "lbl_andrew_ainsley".tr),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller:
                              controller.statusFillTypeDefaultOneController,
                          hintText: "lbl_andrew".tr,
                          margin: getMargin(top: 24)),
                      GestureDetector(
                          onTap: () {
                            onTapRowdate();
                          },
                          child: Container(
                              margin: getMargin(top: 24),
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
                                            controller.editProfileModelObj.value
                                                .dateTxt.value,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtUrbanistSemiBold14Gray900
                                                .copyWith(
                                                    letterSpacing:
                                                        getHorizontalSize(
                                                            0.2))))),
                                    CustomImageView(
                                        svgPath: ImageConstant.imgCalendar20x20,
                                        height: getSize(20),
                                        width: getSize(20))
                                  ]))),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: controller.emailController,
                          hintText: "lbl_user_domain_com".tr,
                          margin: getMargin(top: 24),
                          padding: TextFormFieldPadding.PaddingT18_1,
                          textInputType: TextInputType.emailAddress,
                          suffix: Container(
                              margin: getMargin(
                                  left: 30, top: 18, right: 20, bottom: 18),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgArrowdown)),
                          suffixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(56))),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: controller.statusFillTypePhoneController,
                          hintText: "msg_1_123_456_789_000".tr,
                          margin: getMargin(top: 24),
                          padding: TextFormFieldPadding.PaddingT21,
                          textInputAction: TextInputAction.done,
                          prefix: Container(
                              margin: getMargin(
                                  left: 20, top: 19, right: 30, bottom: 19),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgMaskgroup)),
                          prefixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(56))),
                      CustomDropDown(
                          focusNode: FocusNode(),
                          icon: Container(
                              margin: getMargin(left: 30, right: 18),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgIconBottom)),
                          hintText: "lbl_male".tr,
                          margin: getMargin(top: 24, bottom: 5),
                          padding: DropDownPadding.PaddingT19,
                          items: controller
                              .editProfileModelObj.value.dropdownItemList.value,
                          onChanged: (value) {
                            controller.onSelected(value);
                          })
                    ])),
            bottomNavigationBar: CustomButton(
                height: getVerticalSize(58),
                text: "lbl_update".tr,
                margin: getMargin(left: 24, right: 24, bottom: 48),
                variant: ButtonVariant.FillGray80002,
                padding: ButtonPadding.PaddingAll19)));
  }

  Future<void> onTapRowdate() async {
    DateTime? dateTime = await showDatePicker(
        context: Get.context!,
        initialDate:
            controller.editProfileModelObj.value.selectedDateTxt!.value,
        firstDate: DateTime(1970),
        lastDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
    controller.editProfileModelObj.value.selectedDateTxt!.value = dateTime!;
    controller.editProfileModelObj.value.dateTxt.value =
        dateTime.format(SHORT_DATE_WITH_FULL_YEAR);
  }

  onTapArrowleft36() {
    Get.back();
  }
}
