import '../controller/song_play_over_screen_controller.dart';
import '../models/listsongtitle_item_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';

// ignore: must_be_immutable
class ListsongtitleItemWidget extends StatelessWidget {
  ListsongtitleItemWidget(this.listsongtitleItemModelObj);

  ListsongtitleItemModel listsongtitleItemModelObj;

  var controller = Get.find<SongPlayOverScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgImage80x8017,
          height: getSize(
            80,
          ),
          width: getSize(
            80,
          ),
          radius: BorderRadius.circular(
            getHorizontalSize(
              20,
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            left: 16,
            top: 18,
            bottom: 17,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  listsongtitleItemModelObj.songTitleTxt.value,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtUrbanistRomanBold18,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 7,
                ),
                child: Obx(
                  () => Text(
                    listsongtitleItemModelObj.theWeekndDaftTxt.value,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtUrbanistRomanMedium12.copyWith(
                      letterSpacing: getHorizontalSize(
                        0.2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgCategoriespause,
          height: getSize(
            32,
          ),
          width: getSize(
            32,
          ),
          margin: getMargin(
            top: 24,
            bottom: 24,
          ),
        ),
        CustomImageView(
          svgPath: ImageConstant.imgOverflowmenu,
          height: getSize(
            20,
          ),
          width: getSize(
            20,
          ),
          margin: getMargin(
            left: 20,
            top: 30,
            bottom: 30,
          ),
        ),
      ],
    );
  }
}
