import '../history_music_page/widgets/historymusic_item_widget.dart';
import 'controller/history_music_controller.dart';
import 'models/history_music_model.dart';
import 'models/historymusic_item_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';

class HistoryMusicPage extends StatelessWidget {
  HistoryMusicController controller =
      Get.put(HistoryMusicController(HistoryMusicModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: getPadding(
                  left: 24,
                  top: 30,
                  right: 24,
                ),
                child: Obx(
                  () => ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: getVerticalSize(
                          24,
                        ),
                      );
                    },
                    itemCount: controller.historyMusicModelObj.value
                        .historymusicItemList.value.length,
                    itemBuilder: (context, index) {
                      HistorymusicItemModel model = controller
                          .historyMusicModelObj
                          .value
                          .historymusicItemList
                          .value[index];
                      return HistorymusicItemWidget(
                        model,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
