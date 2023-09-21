import 'controller/reset_password_successful_controller.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';

class ResetPasswordSuccessfulDialog extends StatelessWidget {
  ResetPasswordSuccessfulDialog(this.controller);

  ResetPasswordSuccessfulController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getHorizontalSize(
        340,
      ),
      padding: getPadding(
        left: 38,
        top: 40,
        right: 38,
        bottom: 40,
      ),
      decoration: AppDecoration.fillWhiteA700.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder48,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: getVerticalSize(
              180,
            ),
            width: getHorizontalSize(
              185,
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
                        left: 49,
                        top: 45,
                        right: 49,
                        bottom: 45,
                      ),
                      decoration:
                          AppDecoration.gradientGreenA700GreenA400.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder70,
                      ),
                      child: Stack(
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgCheckmark49x41,
                            height: getVerticalSize(
                              49,
                            ),
                            width: getHorizontalSize(
                              41,
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
              style: AppStyle.txtUrbanistRomanBold24GreenA70001,
            ),
          ),
          Container(
            width: getHorizontalSize(
              262,
            ),
            margin: getMargin(
              top: 14,
              bottom: 84,
            ),
            child: Text(
              "msg_your_account_is".tr,
              maxLines: null,
              textAlign: TextAlign.center,
              style: AppStyle.txtUrbanistRegular16.copyWith(
                letterSpacing: getHorizontalSize(
                  0.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
