
import 'package:goroga/presentation/sign_in_screen/controller/sign_in_controller.dart';

import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/custom_button.dart';
import 'package:goroga/widgets/custom_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends GetWidget<SignInController> {
  
  SignInController _SignInController = Get.put(SignInController());
void getData()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    List<String>? data = sp.getStringList('userData');
    print(data);
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
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
                          child: Text("msg_login_to_your_a".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtUrbanistRomanBold32
                              )),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: controller.usernameController,
                          hintText: "Enter your Mobile No.".tr,
                          margin: getMargin(top: 27),
                          padding: TextFormFieldPadding.PaddingT21,
                          fontStyle:
                              TextFormFieldFontStyle.UrbanistRegular14Gray500,
                          textInputType: TextInputType.emailAddress,
                          prefix: Container(
                              margin: getMargin(
                                  left: 20, top: 20, right: 12, bottom: 20),
                              child: Icon(
                                  Icons.phone)),
                          prefixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(60))),
                     Obx(() =>   CustomTextFormField(
                        focusNode: FocusNode(),
                        controller: controller.passwordController,
                        hintText: "lbl_password".tr,
                        margin: getMargin(top: 24),
                        padding: TextFormFieldPadding.PaddingT21_1,
                        fontStyle:
                            TextFormFieldFontStyle.UrbanistRegular14Gray500,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.visiblePassword,
                        prefix: Container(
                            margin: getMargin(
                                left: 20, top: 20, right: 12, bottom: 20),
                            child: CustomImageView(
                                svgPath: ImageConstant.imgLock)),
                        prefixConstraints:
                            BoxConstraints(maxHeight: getVerticalSize(60),
                        ),
                         
                        suffix: InkWell(
                            onTap: () {
                              controller.isShowPassword.value =
                                  !controller.isShowPassword.value;
                            },
                            child: Container(
                                margin: getMargin(
                                    left: 30, right: 20,),
                                child: CustomImageView(
                                    svgPath: controller.isShowPassword.value
                                        ? ImageConstant.imgEye
                                        : ImageConstant.imgDashboard))),
                        suffixConstraints:
                            BoxConstraints(maxHeight: getVerticalSize(60)),
                        isObscureText: controller.isShowPassword.value
                      ),),
                      // Obx(() => CustomTextFormField(
                      //     focusNode: FocusNode(),
                      //     // controller: controller.statusDefaultOneController,
                      //     hintText: "lbl_password".tr,
                      //     margin: getMargin(top: 24),
                      //     padding: TextFormFieldPadding.PaddingT21_1,
                      //     fontStyle:
                      //         TextFormFieldFontStyle.UrbanistRegular14Gray500,
                      //     textInputAction: TextInputAction.done,
                      //     textInputType: TextInputType.visiblePassword,
                      //     prefix: Container(
                      //         margin: getMargin(
                      //             left: 20, top: 20, right: 12, bottom: 20),
                      //         child: CustomImageView(
                      //             svgPath: ImageConstant.imgLock)),
                      //     prefixConstraints:
                      //         BoxConstraints(maxHeight: getVerticalSize(60)),
                      //     suffix: InkWell(
                      //         onTap: () {
                      //           controller.isShowPassword.value =
                      //               !controller.isShowPassword.value;
                      //         },
                      //         child: Container(
                      //             margin: getMargin(
                      //                 left: 30, right: 20,),
                      //             child: CustomImageView(
                      //                 svgPath: controller.isShowPassword.value
                      //                     ? ImageConstant.imgDashboard
                      //                     : ImageConstant.imgDashboard))),
                      //     suffixConstraints:
                      //         BoxConstraints(maxHeight: getVerticalSize(60)),
                      //     isObscureText: controller.isShowPassword.value)),

                      CustomButton(
                          height: getVerticalSize(58),
                          text: "lbl_sign_in".tr,
                          margin: getMargin(top: 24),
                          padding: ButtonPadding.PaddingT18,
                          onTap: () {
                           
                            _SignInController.checkLogIn(controller.usernameController.text,
                              controller.passwordController.text);
                          }),
                      GestureDetector(
                          onTap: () {
                            onTapTxtForgotthepassword();
                          },
                          child: Padding(
                              padding: getPadding(top: 27),
                              child: Text("msg_forgot_the_pass".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtUrbanistSemiBold16
                                      .copyWith(
                                          letterSpacing:
                                              getHorizontalSize(0.2))))),
                      // Padding(
                      //     padding: getPadding(left: 10, top: 41, right: 10),
                      //     child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         crossAxisAlignment: CrossAxisAlignment.end,
                      //         children: [
                      //           Padding(
                      //               padding: getPadding(top: 11, bottom: 9),
                      //               child: SizedBox(
                      //                   width: getHorizontalSize(96),
                      //                   child: Divider(
                      //                       height: getVerticalSize(1),
                      //                       thickness: getVerticalSize(1),
                      //                       color: ColorConstant.blueGray100))),
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
                      //                       color: ColorConstant.blueGray100)))
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
                      //                   borderRadius:
                      //                       BorderRadiusStyle.roundedBorder16),
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
                      //                           borderRadius: BorderRadiusStyle
                      //                               .roundedBorder16),
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
                      //                   borderRadius:
                      //                       BorderRadiusStyle.roundedBorder16),
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
                      //                           borderRadius: BorderRadiusStyle
                      //                               .roundedBorder16),
                      //                   child: Stack(children: [
                      //                     CustomImageView(
                      //                         svgPath: ImageConstant.imgGoogle,
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
                      //                   borderRadius:
                      //                       BorderRadiusStyle.roundedBorder16),
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
                      //                           borderRadius: BorderRadiusStyle
                      //                               .roundedBorder16),
                      //                   child: Stack(children: [
                      //                     CustomImageView(
                      //                         svgPath: ImageConstant.imgFire,
                      //                         height: getSize(24),
                      //                         width: getSize(24),
                      //                         alignment: Alignment.center)
                      //                   ])))
                      //         ])),
                      Padding(
                          padding: getPadding(top: 33, bottom: 5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: getPadding(bottom: 1),
                                    child: Text("msg_don_t_have_an_a".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtUrbanistRegular14
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.2)))),
                                GestureDetector(
                                    onTap: () {
                                      onTapTxtSignup();
                                    },
                                    child: Padding(
                                        padding: getPadding(left: 8, top: 1),
                                        child: Text("lbl_sign_up".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtUrbanistSemiBold14RedA70002
                                                .copyWith(
                                                    letterSpacing:
                                                        getHorizontalSize(
                                                            0.2)))))
                              ]))
                    ]))));
  }

  onTapImgArrowleft() {
    Get.back();
  }

  onTapSignin() {
   
  }

  onTapTxtForgotthepassword() {
    Get.toNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }

  onTapImgGoogle() async {
  //    try {
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   if (googleUser == null) {
  //     // User canceled the sign-in process
  //     return null;
  //   }final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  //   final AuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );

  //   final UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(credential);
  //   final User? user = authResult.user;
  //   return user;
  // }catch (e) {
  //   // Handle sign-in errors
  //   print("Error: $e");
  //   return null;
  // }

    // await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
    //       print("google iside");

    //   if (googleUser != null) {
    //     //TODO Actions to be performed after signin
    //   } else {
    //     Get.snackbar('Error', 'user data is empty');
    //   }
    // }).catchError((onError) {
    //   Get.snackbar('Error', onError.toString());
    // });
  }

  onTapTxtSignup() {
    Get.toNamed(
      AppRoutes.signUpScreen,
    );
  }
}
