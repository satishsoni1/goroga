import '../your_likes_page/widgets/yourlikes_item_widget.dart';
import 'controller/your_likes_controller.dart';
import 'models/your_likes_model.dart';
import 'models/yourlikes_item_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';

class YourLikesPage extends StatelessWidget {
  YourLikesController controller =
      Get.put(YourLikesController(YourLikesModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    left: 24,
                    top: 32,
                    right: 24,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "lbl_sort_by".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtUrbanistRomanBold20,
                          ),
                          Spacer(),
                          Padding(
                            padding: getPadding(
                              top: 2,
                              bottom: 2,
                            ),
                            child: Text(
                              "lbl_recently_added".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtUrbanistRomanBold16RedA70002
                                  .copyWith(
                                letterSpacing: getHorizontalSize(
                                  0.2,
                                ),
                              ),
                            ),
                          ),
                          CustomImageView(
                            svgPath: ImageConstant.imgSort20x20,
                            height: getSize(
                              20,
                            ),
                            width: getSize(
                              20,
                            ),
                            margin: getMargin(
                              left: 12,
                              bottom: 4,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: getPadding(
                          top: 22,
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
                        ),
                        child: Obx(
                          () => ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: getVerticalSize(
                                  23,
                                ),
                              );
                            },
                            itemCount: controller.yourLikesModelObj.value
                                .yourlikesItemList.value.length,
                            itemBuilder: (context, index) {
                              YourlikesItemModel model = controller
                                  .yourLikesModelObj
                                  .value
                                  .yourlikesItemList
                                  .value[index];
                              return YourlikesItemWidget(
                                model,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
