import '../controller/explore_controller.dart';
import '../models/explore_item_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';

// ignore: must_be_immutable
class ExploreItemWidget extends StatelessWidget {
  ExploreItemWidget(this.exploreItemModelObj, {this.onTapTypeRoundedC});

  ExploreItemModel exploreItemModelObj;

  var controller = Get.find<ExploreController>();

  VoidCallback? onTapTypeRoundedC;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          // print("tapped");
          onTapTypeRoundedC?.call();
        },
        child: Container(
          // decoration: AppDecoration.gradientRed700RedA70002.copyWith(
          //   borderRadius: BorderRadiusStyle.roundedBorder20,
          // ),
          child: SingleChildScrollView(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding: getPadding(
                //     top: 21,
                //     bottom: 76,
                //   ),
                // Obx(
                //   () => Text(
                //     exploreItemModelObj.categoriesTxt.value,
                //     overflow: TextOverflow.ellipsis,
                //     textAlign: TextAlign.right,
                //     style: AppStyle.txtUrbanistRomanBold18WhiteA700.copyWith(
                //       letterSpacing: getHorizontalSize(
                //         0.2,
                //       ),
                //     ),
                //   ),
                // ),
                // ),
                Stack(children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgImage160x1601,
                    height: getVerticalSize(
                      250,
                    ),
                    width: getSize(
                      600,
                    ),
                    radius: BorderRadius.circular(
                      getHorizontalSize(
                        5,
                      ),
                    ),
                    // fit: BoxFit.fill,
                    margin: getMargin(
                      left: 0,
                      right: 0,
                      top: 29,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 0,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8),
                      color: Colors.transparent,
                      child: Text(
                        exploreItemModelObj.categoriesTxt.value,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      color: Colors.transparent,
                      child: Text(
                        'duration', // Replace with your time data
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      color: Colors.transparent,
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward),
                        color: Colors.white,
                        onPressed: () {
                          onTapTypeRoundedC?.call();
                          // Add your button's onPressed logic here
                        },
                      ),
                    ),
                  )
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
