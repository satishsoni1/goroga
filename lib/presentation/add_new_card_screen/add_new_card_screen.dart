import 'controller/add_new_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/app_bar/appbar_image.dart';
import 'package:goroga/widgets/app_bar/appbar_title.dart';
import 'package:goroga/widgets/app_bar/custom_app_bar.dart';
import 'package:goroga/widgets/custom_button.dart';
import 'package:goroga/widgets/custom_text_form_field.dart';

class AddNewCardScreen extends GetWidget<AddNewCardController> {
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
                      onTapArrowleft32();
                    }),
                title: AppbarTitle(
                    text: "lbl_add_new_card".tr, margin: getMargin(left: 16)),
                actions: [
                  AppbarImage(
                      height: getSize(28),
                      width: getSize(28),
                      svgPath: ImageConstant.imgIconlylightscan,
                      margin:
                          getMargin(left: 24, top: 10, right: 24, bottom: 10))
                ]),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, top: 31, right: 24, bottom: 31),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: double.maxFinite,
                          child: Container(
                              padding: getPadding(all: 30),
                              decoration: AppDecoration.gradientRed700RedA70002
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder32),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: getPadding(top: 1),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("lbl_mocard".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtUrbanistRomanBold16WhiteA700
                                                      .copyWith(
                                                          letterSpacing:
                                                              getHorizontalSize(
                                                                  0.2))),
                                              CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgLightbulbWhiteA700,
                                                  height: getVerticalSize(18),
                                                  width: getHorizontalSize(60),
                                                  margin: getMargin(bottom: 1))
                                            ])),
                                    Padding(
                                        padding: getPadding(top: 35),
                                        child: Text("msg".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtUrbanistRomanBold48WhiteA700)),
                                    Padding(
                                        padding: getPadding(top: 28),
                                        child: Row(children: [
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text("msg_card_holder_nam".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtUrbanistRomanMedium10WhiteA700
                                                        .copyWith(
                                                            letterSpacing:
                                                                getHorizontalSize(
                                                                    0.2))),
                                                Padding(
                                                    padding: getPadding(top: 5),
                                                    child: Text("lbl2".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtUrbanistSemiBold14WhiteA700
                                                            .copyWith(
                                                                letterSpacing:
                                                                    getHorizontalSize(
                                                                        0.2))))
                                              ]),
                                          Spacer(flex: 42),
                                          Padding(
                                              padding:
                                                  getPadding(top: 1, bottom: 1),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text("lbl_expiry_date".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtUrbanistRomanMedium10WhiteA700
                                                            .copyWith(
                                                                letterSpacing:
                                                                    getHorizontalSize(
                                                                        0.2))),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 4),
                                                        child: Text("lbl3".tr,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtUrbanistSemiBold14WhiteA700
                                                                .copyWith(
                                                                    letterSpacing:
                                                                        getHorizontalSize(
                                                                            0.2))))
                                                  ])),
                                          Spacer(flex: 57),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgUserWhiteA700,
                                              height: getVerticalSize(36),
                                              width: getHorizontalSize(58))
                                        ]))
                                  ]))),
                      Padding(
                          padding: getPadding(top: 24),
                          child: Divider(
                              height: getVerticalSize(1),
                              thickness: getVerticalSize(1),
                              color: ColorConstant.blueGray100)),
                      Padding(
                          padding: getPadding(top: 24),
                          child: Text("lbl_card_name".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtUrbanistRomanBold18.copyWith(
                                  letterSpacing: getHorizontalSize(0.2)))),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller:
                              controller.statusFillTypeDefaultController,
                          hintText: "lbl_andrew_ainsley".tr,
                          margin: getMargin(top: 13)),
                      Padding(
                          padding: getPadding(top: 25),
                          child: Text("lbl_card_number".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtUrbanistRomanBold18.copyWith(
                                  letterSpacing: getHorizontalSize(0.2)))),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller:
                              controller.statusFillTypeDefaultOneController,
                          hintText: "msg_2672_4738_7837".tr,
                          margin: getMargin(top: 13)),
                      Padding(
                          padding: getPadding(top: 25, bottom: 5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Padding(
                                        padding: getPadding(top: 2, right: 10),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("lbl_expiry_date2".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtUrbanistRomanBold18
                                                      .copyWith(
                                                          letterSpacing:
                                                              getHorizontalSize(
                                                                  0.2))),
                                              GestureDetector(
                                                  onTap: () {
                                                    onTapRowdate();
                                                  },
                                                  child: Container(
                                                      margin:
                                                          getMargin(top: 11),
                                                      padding: getPadding(
                                                          left: 20,
                                                          top: 18,
                                                          right: 20,
                                                          bottom: 18),
                                                      decoration: AppDecoration
                                                          .fillGray50
                                                          .copyWith(
                                                              borderRadius:
                                                                  BorderRadiusStyle
                                                                      .roundedBorder16),
                                                      child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        top: 1,
                                                                        bottom:
                                                                            1),
                                                                child: Obx(() => Text(
                                                                    controller
                                                                        .addNewCardModelObj
                                                                        .value
                                                                        .dateTxt
                                                                        .value,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtUrbanistSemiBold14Gray900
                                                                        .copyWith(
                                                                            letterSpacing:
                                                                                getHorizontalSize(0.2))))),
                                                            CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgCalendar20x20,
                                                                height:
                                                                    getSize(20),
                                                                width:
                                                                    getSize(20),
                                                                margin:
                                                                    getMargin(
                                                                        left:
                                                                            47))
                                                          ])))
                                            ]))),
                                Expanded(
                                    child: Padding(
                                        padding: getPadding(left: 10),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("lbl_cvv".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtUrbanistRomanBold18
                                                      .copyWith(
                                                          letterSpacing:
                                                              getHorizontalSize(
                                                                  0.2))),
                                              CustomTextFormField(
                                                  width: getHorizontalSize(180),
                                                  focusNode: FocusNode(),
                                                  controller: controller
                                                      .statusFillTypeDefaultTwoController,
                                                  hintText: "lbl_699".tr,
                                                  margin: getMargin(top: 13),
                                                  textInputAction:
                                                      TextInputAction.done)
                                            ])))
                              ]))
                    ])),
            bottomNavigationBar: CustomButton(
                height: getVerticalSize(58),
                text: "lbl_add".tr,
                margin: getMargin(left: 24, right: 24, bottom: 48),
                variant: ButtonVariant.FillGray80002,
                padding: ButtonPadding.PaddingAll19,
                onTap: () {
                  onTapAdd();
                })));
  }

  Future<void> onTapRowdate() async {
    DateTime? dateTime = await showDatePicker(
        context: Get.context!,
        initialDate: controller.addNewCardModelObj.value.selectedDateTxt!.value,
        firstDate: DateTime(1970),
        lastDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
    controller.addNewCardModelObj.value.selectedDateTxt!.value = dateTime!;
    controller.addNewCardModelObj.value.dateTxt.value =
        dateTime.format(SHORT_DATE_WITH_FULL_YEAR);
  }

  onTapAdd() {
    Get.toNamed(
      AppRoutes.selectPaymentMethodScreen,
    );
  }

  onTapArrowleft32() {
    Get.back();
  }
}
