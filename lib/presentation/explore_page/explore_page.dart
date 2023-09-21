import '../explore_page/widgets/explore_item_widget.dart';
import 'controller/explore_controller.dart';
import 'models/explore_item_model.dart';
import 'models/explore_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/app_bar/appbar_image.dart';
import 'package:goroga/widgets/app_bar/appbar_title.dart';
import 'package:goroga/widgets/app_bar/custom_app_bar.dart';
import 'package:goroga/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class ExplorePage extends StatelessWidget {
  ExploreController controller = Get.put(ExploreController(ExploreModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillWhiteA700,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: double.maxFinite,
                                child: Container(
                                    padding: getPadding(top: 5, bottom: 5),
                                    decoration: AppDecoration.fillWhiteA700,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          CustomAppBar(
                                              height: getVerticalSize(42),
                                              leadingWidth: 56,
                                              leading: AppbarImage(
                                                  height: getSize(32),
                                                  width: getSize(32),
                                                  svgPath: ImageConstant.imgLogo,
                                                  margin: getMargin(
                                                      left: 24, bottom: 1)),
                                              title: AppbarTitle(
                                                  text: "lbl_explore".tr,
                                                  margin: getMargin(left: 16)),
                                              actions: [
                                                AppbarImage(
                                                    height: getSize(28),
                                                    width: getSize(28),
                                                    svgPath: ImageConstant
                                                        .imgClock28x28,
                                                    margin: getMargin(
                                                        left: 24,
                                                        top: 2,
                                                        right: 24,
                                                        bottom: 3))
                                              ]),
                                          CustomSearchView(
                                              focusNode: FocusNode(),
                                              controller: controller
                                                  .searchBarController,
                                              hintText: "msg_artists_songs".tr,
                                              margin: getMargin(
                                                  left: 24, top: 38, right: 24),
                                              fontStyle: SearchViewFontStyle
                                                  .UrbanistRegular14Gray400,
                                              prefix: Container(
                                                  margin: getMargin(
                                                      left: 20,
                                                      top: 18,
                                                      right: 12,
                                                      bottom: 18),
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgSearchGray400)),
                                              prefixConstraints: BoxConstraints(
                                                  maxHeight:
                                                      getVerticalSize(56)),
                                              suffix: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: getHorizontalSize(
                                                          15)),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        controller
                                                            .searchBarController
                                                            .clear();
                                                      },
                                                      icon: Icon(Icons.clear,
                                                          color: Colors
                                                              .grey.shade600))))
                                        ]))),
                            Padding(
                                padding: getPadding(left: 24, top: 17),
                                child: Text("lbl_browse_all".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtUrbanistRomanBold20)),
                            Align(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding: getPadding(
                                        left: 24, top: 24, right: 24),
                                    child: Obx(() => GridView.builder(
                                        shrinkWrap: true,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                mainAxisExtent:
                                                    getVerticalSize(121),
                                                crossAxisCount: 2,
                                                mainAxisSpacing:
                                                    getHorizontalSize(12),
                                                crossAxisSpacing:
                                                    getHorizontalSize(12)),
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: controller.exploreModelObj
                                            .value.exploreItemList.value.length,
                                        itemBuilder: (context, index) {
                                          ExploreItemModel model = controller
                                              .exploreModelObj
                                              .value
                                              .exploreItemList
                                              .value[index];
                                          return ExploreItemWidget(model,
                                              onTapTypeRoundedC: () {
                                            onTapTypeRoundedC();
                                          });
                                        }))))
                          ])
                    ]))));
  }

  onTapTypeRoundedC() {
    Get.toNamed(
      AppRoutes.podcastsScreen,
    );
  }
}
