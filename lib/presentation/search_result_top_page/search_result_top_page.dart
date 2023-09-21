import '../search_result_top_page/widgets/listsongvalue_item_widget.dart';
import 'controller/search_result_top_controller.dart';
import 'models/listsongvalue_item_model.dart';
import 'models/search_result_top_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';

class SearchResultTopPage extends StatelessWidget {
  SearchResultTopController controller =
      Get.put(SearchResultTopController(SearchResultTopModel().obs));

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
                  top: 24,
                  right: 24,
                ),
                child: Obx(
                  () => ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: getVerticalSize(
                          16,
                        ),
                      );
                    },
                    itemCount: controller.searchResultTopModelObj.value
                        .listsongvalueItemList.value.length,
                    itemBuilder: (context, index) {
                      ListsongvalueItemModel model = controller
                          .searchResultTopModelObj
                          .value
                          .listsongvalueItemList
                          .value[index];
                      return ListsongvalueItemWidget(
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
