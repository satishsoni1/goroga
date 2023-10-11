
import '../controller/podcasts_controller.dart';
import '../models/podcasts_item_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';

// ignore: must_be_immutable
class PodcastsItemWidget extends StatelessWidget {
  PodcastsItemWidget(this.podcastsItemModelObj,);

  PodcastsItemModel podcastsItemModelObj;
// VoidCallback? onTapTypeRoundedC;
  var controller = Get.find<PodcastsController>();

  @override
  Widget build(BuildContext context) {
     return GestureDetector(
        onTap: () {
          print("object");
          // Get.to(DetailPage(imagePath: ImageConstant.imgImage91x81));
          // onTapTypeRoundedC?.call();
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
                Padding(
                  padding: getPadding(
                    top: 21,
                    bottom: 76,
                  ),
                  // child: Obx(
                  //   () => Text(
                  //     podcastsItemModelObj.politicsTxt.value,
                  //     overflow: TextOverflow.ellipsis,
                  //     textAlign: TextAlign.right,
                  //     style: AppStyle.txtUrbanistRomanBold18WhiteA700.copyWith(
                  //       letterSpacing: getHorizontalSize(
                  //         0.2,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgImage91x81,
                  height: getVerticalSize(
                    200,
                  ),
                 width: getSize(
                  400,
                ),
                  radius: BorderRadius.circular(
                    getHorizontalSize(
                      5,
                    ),
                  ),
                  // fit: BoxFit.fill,
                  margin: getMargin(
                  left: 0,
                  right: 10,
                    top: 29,
                  ),
                ),
                SizedBox(width: 10), // Add spacing between image and text
              Expanded(
                // child: Padding(
                //   padding: getPadding(
                //     top: 21,
                //     bottom: 76,
                //   ),
                  child: Row(
                    // padding: EdgeInsets.only(top: 60,),
                    // alignment: Alignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Getting Started",textAlign: TextAlign.center,)])
                ),
                // ),
                
              ],
            ),
          ),
        ),
      );
        
  }
}
