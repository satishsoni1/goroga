import 'package:flutter/services.dart';
import 'package:goroga/widgets/app_bar/custom_app_bar.dart';

import 'controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/custom_button.dart';
import 'package:goroga/widgets/custom_text_form_field.dart';
import 'package:goroga/domain/googleauth/google_auth_helper.dart';

class SignUpScreen extends GetWidget<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            // resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                )),
            body: SingleChildScrollView(
              child: Container(
                  width: double.maxFinite,
                  padding: getPadding(left: 24, top: 11, right: 24, bottom: 11),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // CustomImageView(
                        //     svgPath: ImageConstant.imgArrowleft,
                        //     height: getSize(28),
                        //     width: getSize(28),
                        //     alignment: Alignment.centerLeft,
                        //     onTap: () {
                        //       onTapImgArrowleft();
                        //     }),
                        Container(
                            height: MediaQuery.of(context).size.height / 5,
                            child: Column(children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgLogo,
                                height: MediaQuery.of(context).size.height / 6,
                                width: MediaQuery.of(context).size.width - 150,
                                fit: BoxFit.contain,
                              ),
                            ])),

                        Padding(
                            padding: getPadding(top: 20),
                            child: Text("msg_create_your_acc".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtUrbanistRomanBold32)),

                        CustomTextFormField(
                            // focusNode: FocusNode(),
                            controller: controller.usernameController,
                            hintText: "Username".tr,
                            margin: getMargin(top: 43),
                            // padding: TextFormFieldPadding.PaddingT21,
                            fontStyle:
                                TextFormFieldFontStyle.UrbanistRegular14Gray500,
                            textInputType: TextInputType.name,
                            prefix: Container(
                                margin: getMargin(
                                    left: 20, top: 20, right: 12, bottom: 20),
                                child: Icon(
                                  Icons.person_2_sharp,
                                  color: Colors.grey,
                                )),
                            prefixConstraints:
                                BoxConstraints(maxHeight: getVerticalSize(60))),

                        CustomTextFormField(
                            // focusNode: FocusNode(),
                            controller: controller.mobileController,
                            hintText: "Mobile No.".tr,
                            margin: getMargin(top: 20),
                            prefix: Container(
                                margin: getMargin(
                                    left: 20, top: 20, right: 12, bottom: 20),
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.grey,
                                )),
                            // padding: TextFormFieldPadding.PaddingT21,
                            fontStyle:
                                TextFormFieldFontStyle.UrbanistRegular14Gray500,
                            textInputType: TextInputType.phone,
                            formatter: LengthLimitingTextInputFormatter(10),
                            // prefix: Container(
                            //     margin: getMargin(
                            //         left: 20, top: 20, right: 12, bottom: 20),
                            //     child: CustomImageView(
                            //         svgPath: ImageConstant.imgCheckmark)),
                            prefixConstraints:
                                BoxConstraints(maxHeight: getVerticalSize(60))),
                        CustomTextFormField(
                            // focusNode: FocusNode(),
                            controller: controller.emailController,
                            hintText: "lbl_email".tr + " (optional)",
                            margin: getMargin(top: 20),
                            padding: TextFormFieldPadding.PaddingT21,
                            fontStyle:
                                TextFormFieldFontStyle.UrbanistRegular14Gray500,
                            textInputType: TextInputType.emailAddress,
                            prefix: Container(
                                margin: getMargin(
                                    left: 20, top: 20, right: 12, bottom: 20),
                                child: CustomImageView(
                                    svgPath: ImageConstant.imgCheckmark)),
                            prefixConstraints:
                                BoxConstraints(maxHeight: getVerticalSize(60))),
                        Obx(
                          () => CustomTextFormField(
                              // focusNode: FocusNode(),
                              controller: controller.passwordController,
                              hintText: "lbl_password".tr,
                              margin: getMargin(top: 20),
                              padding: TextFormFieldPadding.PaddingT21_1,
                              fontStyle: TextFormFieldFontStyle
                                  .UrbanistRegular14Gray500,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              prefix: Container(
                                  margin: getMargin(
                                      left: 20, top: 20, right: 12, bottom: 20),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgLock)),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(60)),
                              suffix: InkWell(
                                  onTap: () {
                                    controller.isShowPassword.value =
                                        !controller.isShowPassword.value;
                                    // _signUpController.isShowPassword.toggle();
                                  },
                                  child: Container(
                                      margin: getMargin(
                                          left: 30,
                                          top: 20,
                                          right: 20,
                                          bottom: 20),
                                      child: CustomImageView(
                                          svgPath: controller
                                                  .isShowPassword.value
                                              ? ImageConstant.imgEye
                                              : ImageConstant.imgDashboard))),
                              suffixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(60)),
                              isObscureText: controller.isShowPassword.value),
                        ),

                        // CustomTextFormField(
                        //   focusNode: FocusNode(),
                        //   controller:
                        //       _signUpController.reenterPasswordController,
                        //   hintText: "Re-enter Password".tr,
                        //   margin: getMargin(top: 20),
                        //   padding: TextFormFieldPadding.PaddingT21_1,
                        //   fontStyle:
                        //       TextFormFieldFontStyle.UrbanistRegular14Gray500,
                        //   textInputAction: TextInputAction.done,
                        //   textInputType: TextInputType.visiblePassword,
                        //   prefix: Container(
                        //     margin: getMargin(
                        //         left: 20, top: 20, right: 12, bottom: 20),
                        //     child: CustomImageView(
                        //       svgPath: ImageConstant.imgLock,
                        //     ),
                        //   ),
                        //   prefixConstraints:
                        //       BoxConstraints(maxHeight: getVerticalSize(60)),
                        //   suffix: Obx(() {
                        //     final passwordsMatch = doPasswordsMatch();

                        //     return passwordsMatch
                        //         ? Icon(
                        //             Icons.check_circle,
                        //             color: Colors.green,
                        //             size: 24,
                        //           )
                        //         : SizedBox(
                        //             width: 24,
                        //           ); // Display an empty space if passwords don't match
                        //   }),

                        //   isObscureText:
                        //       true, // You can set this field to obscure text
                        // ),

                        // Align(
                        //     alignment: Alignment.centerLeft,
                        //     child: Obx(() => CustomCheckbox(
                        //         alignment: Alignment.centerLeft,
                        //         text: "lbl_remember_me".tr,
                        //         iconSize: getHorizontalSize(24),
                        //         value: controller.isCheckbox.value,
                        //         margin: getMargin(top: 20),
                        //         fontStyle:
                        //             CheckboxFontStyle.UrbanistSemiBold14Gray900,
                        //         onChange: (value) {
                        //           controller.isCheckbox.value = value;
                        //         }))),
                        CustomButton(
                          onTap: () {
                            controller.signup(
                                controller.usernameController.text,
                                controller.mobileController.text,
                                controller.emailController.text,
                                controller.passwordController.text);
                          },
                          height: getVerticalSize(58),
                          text: "lbl_sign_up".tr,
                          margin: getMargin(top: 20),
                        ),
                        // Padding(
                        //     padding: getPadding(left: 10, top: 54, right: 10),
                        //     child: Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         crossAxisAlignment: CrossAxisAlignment.end,
                        //         children: [
                        //           Padding(
                        //               padding: getPadding(top: 11, bottom: 9),
                        //               child: SizedBox(
                        //                   width: getHorizontalSize(96),
                        //                   child: Divider(
                        //                       height: getVerticalSize(1),
                        //                       thickness: getVerticalSize(1),
                        //                       color:
                        //                           ColorConstant.blueGray100))),
                        //           Text("msg_or_continue_wit".tr,
                        //               overflow: TextOverflow.ellipsis,
                        //               textAlign: TextAlign.left,
                        //               style: AppStyle.txtUrbanistSemiBold18
                        //                   .copyWith(
                        //                       letterSpacing:
                        //                           getHorizontalSize(0.2))),
                        //           Padding(
                        //               padding: getPadding(top: 11, bottom: 9),
                        //               child: SizedBox(
                        //                   width: getHorizontalSize(96),
                        //                   child: Divider(
                        //                       height: getVerticalSize(1),
                        //                       thickness: getVerticalSize(1),
                        //                       color:
                        //                           ColorConstant.blueGray100)))
                        //         ])),
                        // Padding(
                        //     padding: getPadding(left: 38, top: 31, right: 38),
                        //     child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Card(
                        //               clipBehavior: Clip.antiAlias,
                        //               elevation: 0,
                        //               margin: EdgeInsets.all(0),
                        //               color: ColorConstant.whiteA700,
                        //               shape: RoundedRectangleBorder(
                        //                   side: BorderSide(
                        //                       color: ColorConstant.blueGray100,
                        //                       width: getHorizontalSize(1)),
                        //                   borderRadius: BorderRadiusStyle
                        //                       .roundedBorder16),
                        //               child: Container(
                        //                   height: getVerticalSize(60),
                        //                   width: getHorizontalSize(88),
                        //                   padding: getPadding(
                        //                       left: 32,
                        //                       top: 18,
                        //                       right: 32,
                        //                       bottom: 18),
                        //                   decoration: AppDecoration
                        //                       .outlineBluegray100
                        //                       .copyWith(
                        //                           borderRadius:
                        //                               BorderRadiusStyle
                        //                                   .roundedBorder16),
                        //                   child: Stack(children: [
                        //                     CustomImageView(
                        //                         imagePath: ImageConstant
                        //                             .imgAutolayouthorizontal,
                        //                         height: getSize(24),
                        //                         width: getSize(24),
                        //                         alignment: Alignment.center)
                        //                   ]))),
                        //           Card(
                        //               clipBehavior: Clip.antiAlias,
                        //               elevation: 0,
                        //               margin: getMargin(left: 20),
                        //               color: ColorConstant.whiteA700,
                        //               shape: RoundedRectangleBorder(
                        //                   side: BorderSide(
                        //                       color: ColorConstant.blueGray100,
                        //                       width: getHorizontalSize(1)),
                        //                   borderRadius: BorderRadiusStyle
                        //                       .roundedBorder16),
                        //               child: Container(
                        //                   height: getVerticalSize(60),
                        //                   width: getHorizontalSize(87),
                        //                   padding: getPadding(
                        //                       left: 31,
                        //                       top: 18,
                        //                       right: 31,
                        //                       bottom: 18),
                        //                   decoration: AppDecoration
                        //                       .outlineBluegray100
                        //                       .copyWith(
                        //                           borderRadius:
                        //                               BorderRadiusStyle
                        //                                   .roundedBorder16),
                        //                   child: Stack(children: [
                        //                     CustomImageView(
                        //                         svgPath:
                        //                             ImageConstant.imgGoogle,
                        //                         height: getVerticalSize(24),
                        //                         width: getHorizontalSize(23),
                        //                         alignment: Alignment.center,
                        //                         onTap: () {
                        //                           onTapImgGoogle();
                        //                         })
                        //                   ]))),
                        //           Card(
                        //               clipBehavior: Clip.antiAlias,
                        //               elevation: 0,
                        //               margin: getMargin(left: 20),
                        //               color: ColorConstant.whiteA700,
                        //               shape: RoundedRectangleBorder(
                        //                   side: BorderSide(
                        //                       color: ColorConstant.blueGray100,
                        //                       width: getHorizontalSize(1)),
                        //                   borderRadius: BorderRadiusStyle
                        //                       .roundedBorder16),
                        //               child: Container(
                        //                   height: getVerticalSize(60),
                        //                   width: getHorizontalSize(88),
                        //                   padding: getPadding(
                        //                       left: 32,
                        //                       top: 18,
                        //                       right: 32,
                        //                       bottom: 18),
                        //                   decoration: AppDecoration
                        //                       .outlineBluegray100
                        //                       .copyWith(
                        //                           borderRadius:
                        //                               BorderRadiusStyle
                        //                                   .roundedBorder16),
                        //                   child: Stack(children: [
                        //                     CustomImageView(
                        //                         svgPath: ImageConstant.imgFire,
                        //                         height: getSize(24),
                        //                         width: getSize(24),
                        //                         alignment: Alignment.center)
                        //                   ])))
                        //         ])),
                        Padding(
                            padding: getPadding(top: 46, bottom: 5),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("msg_already_have_an".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtUrbanistRegular14
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(0.2))),
                                  GestureDetector(
                                      onTap: () {
                                        onTapTxtSignin();
                                      },
                                      child: Padding(
                                          padding: getPadding(left: 8),
                                          child: Text("lbl_sign_in".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtUrbanistSemiBold14RedA70002
                                                  .copyWith(
                                                      letterSpacing:
                                                          getHorizontalSize(
                                                              0.2)))))
                                ]))
                      ])),
            )));
  }

  onTapImgArrowleft() {
    Get.back();
  }

  onTapImgGoogle() async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        Get.snackbar('Error', 'user data is empty');
      }
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  onTapTxtSignin() {
    Get.toNamed(
        // AppRoutes.letsYouInScreen,
        AppRoutes.signInScreen);
  }

  onTapSignUp() {
    print("signup");
  }

  void cleardata() {}
}
