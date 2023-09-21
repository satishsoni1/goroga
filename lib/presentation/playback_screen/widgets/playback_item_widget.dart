import '../controller/playback_controller.dart';
import '../models/playback_item_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/custom_switch.dart';

// ignore: must_be_immutable
class PlaybackItemWidget extends StatelessWidget {
  PlaybackItemWidget(this.playbackItemModelObj);

  PlaybackItemModel playbackItemModelObj;

  var controller = Get.find<PlaybackController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(
              () => Text(
                playbackItemModelObj.typeTxt.value,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtUrbanistSemiBold18Gray900.copyWith(
                  letterSpacing: getHorizontalSize(
                    0.2,
                  ),
                ),
              ),
            ),
            Container(
              width: getHorizontalSize(
                272,
              ),
              margin: getMargin(
                top: 6,
              ),
              child: Obx(
                () => Text(
                  playbackItemModelObj.descriptionTxt.value,
                  maxLines: null,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtUrbanistRomanMedium14Gray900.copyWith(
                    letterSpacing: getHorizontalSize(
                      0.2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Obx(
          () => CustomSwitch(
            margin: getMargin(
              left: 63,
              top: 20,
              bottom: 24,
            ),
            value: playbackItemModelObj.isSelectedSwitch.value,
            onChanged: (value) {
              playbackItemModelObj.isSelectedSwitch.value = value;
            },
          ),
        ),
      ],
    );
  }
}
