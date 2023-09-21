import '../search_result_playlist_page/widgets/gridlanguage_item_widget.dart';
import 'controller/search_result_playlist_controller.dart';
import 'models/gridlanguage_item_model.dart';
import 'models/search_result_playlist_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';

class SearchResultPlaylistPage extends StatelessWidget {
  SearchResultPlaylistController controller =
      Get.put(SearchResultPlaylistController(SearchResultPlaylistModel().obs));

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
              Container(
                decoration: AppDecoration.fillWhiteA700,
                margin: getMargin(
                  left: 24,
                  top: 24,
                  right: 24,
                ),
                child: Obx(
                  () => GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: getVerticalSize(
                        249,
                      ),
                      crossAxisCount: 2,
                      mainAxisSpacing: getHorizontalSize(
                        12,
                      ),
                      crossAxisSpacing: getHorizontalSize(
                        12,
                      ),
                    ),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.searchResultPlaylistModelObj.value
                        .gridlanguageItemList.value.length,
                    itemBuilder: (context, index) {
                      GridlanguageItemModel model = controller
                          .searchResultPlaylistModelObj
                          .value
                          .gridlanguageItemList
                          .value[index];
                      return GridlanguageItemWidget(
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
