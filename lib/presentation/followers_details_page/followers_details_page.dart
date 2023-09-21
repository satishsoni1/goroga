import '../followers_details_page/widgets/listname3_item_widget.dart';
import 'controller/followers_details_controller.dart';
import 'models/followers_details_model.dart';
import 'models/listname3_item_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';

class FollowersDetailsPage extends StatelessWidget {
  FollowersDetailsController controller =
      Get.put(FollowersDetailsController(FollowersDetailsModel().obs));

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
                    itemCount: controller.followersDetailsModelObj.value
                        .listname3ItemList.value.length,
                    itemBuilder: (context, index) {
                      Listname3ItemModel model = controller
                          .followersDetailsModelObj
                          .value
                          .listname3ItemList
                          .value[index];
                      return Listname3ItemWidget(
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
