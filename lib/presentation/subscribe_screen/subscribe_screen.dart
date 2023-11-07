import '../subscribe_screen/widgets/subscribe_item_widget.dart';
import 'controller/subscribe_controller.dart';
import 'models/subscribe_item_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';

class SubscribeScreen extends GetWidget<SubscribeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, top: 10, right: 24, bottom: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                          svgPath: ImageConstant.imgArrowleft,
                          height: getSize(28),
                          width: getSize(28),
                          onTap: () {
                            onTapImgArrowleft();
                          }),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(top: 40),
                              child: Text("msg_subscribe_to_pr".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .txtUrbanistRomanBold32RedA70002))),
                      Container(
                          width: getHorizontalSize(362),
                          margin: getMargin(left: 9, top: 13, right: 8),
                          child: Text("msg_enjoy_listening2".tr,
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: AppStyle.txtUrbanistRomanMedium16Gray80001
                                  .copyWith(
                                      letterSpacing: getHorizontalSize(0.2)))),
                      Padding(
                          padding: getPadding(top: 21),
                          child: Obx(() => ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: getVerticalSize(24));
                              },
                              itemCount: controller.subscribeModelObj.value
                                  .subscribeItemList.value.length,
                              itemBuilder: (context, index) {
                                SubscribeItemModel model = controller
                                    .subscribeModelObj
                                    .value
                                    .subscribeItemList
                                    .value[index];
                                return SubscribeItemWidget(model,
                                    onTapColumnvector: () {
                                  onTapColumnvector();
                                });
                              })))
                    ]))));
  }

  onTapColumnvector() {
    Get.toNamed(AppRoutes.paymentMethodScreen);
  }

  onTapImgArrowleft() {
    Get.back();
  }
}
