import '../history_podcast_page/widgets/listpodcasttitle3_item_widget.dart';
import 'controller/history_podcast_controller.dart';
import 'models/history_podcast_model.dart';
import 'models/listpodcasttitle3_item_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';

class HistoryPodcastPage extends StatelessWidget {
  HistoryPodcastController controller =
      Get.put(HistoryPodcastController(HistoryPodcastModel().obs));

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
                          23,
                        ),
                      );
                    },
                    itemCount: controller.historyPodcastModelObj.value
                        .listpodcasttitle3ItemList.value.length,
                    itemBuilder: (context, index) {
                      Listpodcasttitle3ItemModel model = controller
                          .historyPodcastModelObj
                          .value
                          .listpodcasttitle3ItemList
                          .value[index];
                      return Listpodcasttitle3ItemWidget(
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
