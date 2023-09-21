import 'controller/new_playlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/custom_button.dart';
import 'package:goroga/widgets/custom_drop_down.dart';
import 'package:goroga/widgets/custom_text_form_field.dart';

class NewPlaylistBottomsheet extends StatelessWidget {
  NewPlaylistBottomsheet(this.controller);

  NewPlaylistController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.maxFinite,
        child: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 24,
            top: 8,
            right: 24,
            bottom: 8,
          ),
          decoration: AppDecoration.outlineGray1002.copyWith(
            borderRadius: BorderRadiusStyle.customBorderTL40,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgFrameGray300,
                height: getVerticalSize(
                  3,
                ),
                width: getHorizontalSize(
                  38,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 26,
                ),
                child: Text(
                  "lbl_new_playlist".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtUrbanistRomanBold24,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 21,
                ),
                child: Divider(
                  height: getVerticalSize(
                    1,
                  ),
                  thickness: getVerticalSize(
                    1,
                  ),
                  color: ColorConstant.blueGray100,
                ),
              ),
              CustomTextFormField(
                focusNode: FocusNode(),
                controller: controller.statusFillTypeDefaultController,
                hintText: "msg_most_popular_so".tr,
                margin: getMargin(
                  top: 23,
                ),
              ),
              CustomTextFormField(
                focusNode: FocusNode(),
                controller: controller.statusFillTypeDefaultOneController,
                hintText: "msg_most_popular_so2".tr,
                margin: getMargin(
                  top: 24,
                ),
                textInputAction: TextInputAction.done,
              ),
              CustomDropDown(
                focusNode: FocusNode(),
                icon: Container(
                  margin: getMargin(
                    left: 30,
                    right: 16,
                  ),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgIconBottom,
                  ),
                ),
                hintText: "lbl_public".tr,
                margin: getMargin(
                  top: 24,
                ),
                items:
                    controller.newPlaylistModelObj.value.dropdownItemList.value,
                prefix: Container(
                  margin: getMargin(
                    left: 20,
                    top: 18,
                    right: 12,
                    bottom: 18,
                  ),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgEye,
                  ),
                ),
                prefixConstraints: BoxConstraints(
                  maxHeight: getVerticalSize(
                    56,
                  ),
                ),
                onChanged: (value) {
                  controller.onSelected(value);
                },
              ),
              Padding(
                padding: getPadding(
                  top: 24,
                ),
                child: Divider(
                  height: getVerticalSize(
                    1,
                  ),
                  thickness: getVerticalSize(
                    1,
                  ),
                  color: ColorConstant.blueGray100,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 23,
                  bottom: 28,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomButton(
                        height: getVerticalSize(
                          58,
                        ),
                        text: "lbl_cancel".tr,
                        margin: getMargin(
                          right: 6,
                        ),
                        variant: ButtonVariant.OutlineGray800,
                        padding: ButtonPadding.PaddingT18,
                        fontStyle: ButtonFontStyle.UrbanistRomanBold16Gray800_1,
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        height: getVerticalSize(
                          58,
                        ),
                        text: "lbl_create".tr,
                        margin: getMargin(
                          left: 6,
                        ),
                        padding: ButtonPadding.PaddingT18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
