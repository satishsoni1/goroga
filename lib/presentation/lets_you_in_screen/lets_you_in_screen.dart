
import 'controller/lets_you_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/custom_button.dart';
import 'package:goroga/domain/googleauth/google_auth_helper.dart';

class LetsYouInScreen extends GetWidget<LetsYouInController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, top: 11, right: 24, bottom: 11),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                          svgPath: ImageConstant.imgArrowleft,
                          height: getSize(28),
                          width: getSize(28),
                          alignment: Alignment.centerLeft,
                          onTap: () {
                            onTapImgArrowleft();
                          }),
                      CustomImageView(
                          imagePath: ImageConstant.imgIllustrator,
                          height: getVerticalSize(200),
                          width: getHorizontalSize(236),
                          alignment: Alignment.centerRight,
                          margin: getMargin(top: 63, right: 61)),
                      Padding(
                          padding: getPadding(top: 36),
                          child: Text("lbl_let_s_you_in".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtUrbanistRomanBold48)),
                      CustomButton(
                          height: getVerticalSize(60),
                          text: "msg_continue_with_g".tr,
                          margin: getMargin(top: 16),
                          variant: ButtonVariant.OutlineBluegray100,
                          shape: ButtonShape.RoundedBorder16,
                          padding: ButtonPadding.PaddingT19,
                          fontStyle: ButtonFontStyle.UrbanistSemiBold16Gray900,
                          prefixWidget: Container(
                              margin: getMargin(right: 11),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgGoogle)),
                          onTap: () {
                            onTapContinuewithgoogle();
                          }),
                      Padding(
                          padding: getPadding(left: 10, top: 36, right: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: getPadding(top: 9, bottom: 11),
                                    child: SizedBox(
                                        width: getHorizontalSize(155),
                                        child: Divider(
                                            height: getVerticalSize(1),
                                            thickness: getVerticalSize(1),
                                            color: ColorConstant.blueGray100))),
                                Text("lbl_or".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtUrbanistSemiBold18
                                        .copyWith(
                                            letterSpacing:
                                                getHorizontalSize(0.2))),
                                Padding(
                                    padding: getPadding(top: 9, bottom: 11),
                                    child: SizedBox(
                                        width: getHorizontalSize(155),
                                        child: Divider(
                                            height: getVerticalSize(1),
                                            thickness: getVerticalSize(1),
                                            color: ColorConstant.blueGray100)))
                              ])),
                      CustomButton(
                          height: getVerticalSize(58),
                          text: "msg_sign_in_with_pa".tr,
                          margin: getMargin(top: 34),
                          padding: ButtonPadding.PaddingT18,
                          onTap: () {
                            onTapSigninwithpassword();
                          }),
                      Padding(
                          padding: getPadding(top: 31, bottom: 5),
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
                                                .txtUrbanistSemiBold14
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

  onTapContinuewithgoogle() async {
          print("google inside process");

    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      print("google inside process");
      print(googleUser);
      if (googleUser != null) {
        //TODO Actions to be performed after signin
        // Get.to(() => HomeContainerScreen());
      } else {
        Get.snackbar('Error', 'user data is empty');
      }
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  onTapSigninwithpassword() {
    Get.toNamed(
      AppRoutes.signInScreen,
    );
  }

  onTapTxtSignup() {
    Get.toNamed(
      AppRoutes.signUpScreen,
    );
  }
}
