import 'controller/payment_success_controller.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/custom_button.dart';

class PaymentSuccessDialog extends StatelessWidget {
  PaymentSuccessDialog(this.controller);

  PaymentSuccessController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getHorizontalSize(
        340,
      ),
      padding: getPadding(
        all: 32,
      ),
      decoration: AppDecoration.fillWhiteA700.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder48,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: getVerticalSize(
              180,
            ),
            width: getHorizontalSize(
              185,
            ),
            margin: getMargin(
              top: 8,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 0,
                    margin: EdgeInsets.all(0),
                    color: ColorConstant.greenA70002,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusStyle.circleBorder70,
                    ),
                    child: Container(
                      height: getSize(
                        141,
                      ),
                      width: getSize(
                        141,
                      ),
                      padding: getPadding(
                        left: 45,
                        top: 48,
                        right: 45,
                        bottom: 48,
                      ),
                      decoration: AppDecoration.fillGreenA70002.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder70,
                      ),
                      child: Stack(
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgVector,
                            height: getVerticalSize(
                              43,
                            ),
                            width: getHorizontalSize(
                              49,
                            ),
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomImageView(
                  svgPath: ImageConstant.imgVectorGreen300,
                  height: getVerticalSize(
                    180,
                  ),
                  width: getHorizontalSize(
                    185,
                  ),
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              top: 34,
            ),
            child: Text(
              "msg_congratulations".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtUrbanistRomanBold24GreenA70002,
            ),
          ),
          Container(
            width: getHorizontalSize(
              253,
            ),
            margin: getMargin(
              left: 11,
              top: 14,
              right: 11,
            ),
            child: Text(
              "msg_you_have_succes".tr,
              maxLines: null,
              textAlign: TextAlign.center,
              style: AppStyle.txtUrbanistRegular16.copyWith(
                letterSpacing: getHorizontalSize(
                  0.2,
                ),
              ),
            ),
          ),
          CustomButton(
            height: getVerticalSize(
              58,
            ),
            text: "lbl_ok".tr,
            margin: getMargin(
              top: 29,
            ),
            variant: ButtonVariant.FillGray80002,
            padding: ButtonPadding.PaddingAll19,
          ),
        ],
      ),
    );
  }
}
