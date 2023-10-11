import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/app_bar/appbar_title.dart';
import 'package:goroga/widgets/app_bar/custom_app_bar.dart';

class FavoriteItemsPage extends StatefulWidget {
  @override
  _FavoriteItemsPageState createState() => _FavoriteItemsPageState();
}

class _FavoriteItemsPageState extends State<FavoriteItemsPage> {
  List<String> favoriteItems = []; // Store favorite items here.

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
            height: getVerticalSize(80),
            leadingWidth: 52,
            title: AppbarTitle(text: "lbl_fav".tr, margin: getMargin(left: 16)),
             actions: [
                   IconButton(
                    icon: Icon(
                      Icons.favorite, // Use the favorite icon
                      color: ColorConstant.primary, // Customize the icon color
                    ),
                    onPressed: () { 
                        Get.back();

                     },
                  ),],
            // leading: AppbarImage(
            //     height: getSize(28),
            //     width: getSize(28),
            //     svgPath: ImageConstant.imgArrowleft,
            //     margin: getMargin(left: 24, top: 10, bottom: 13),
            //     onTap: () {
            //       Get.back();
            //     })
                ),
        body: ListView.builder(
          itemCount: favoriteItems == null ? 0 : favoriteItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(favoriteItems[index]),
            );
          },
        ),
      ),
    );
  }
}
