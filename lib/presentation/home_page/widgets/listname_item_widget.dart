
import '../controller/home_controller.dart';
import '../models/listname_item_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';

// ignore: must_be_immutable
class ListnameItemWidget extends StatelessWidget {
  ListnameItemWidget(this.listnameItemModelObj);

  ListnameItemModel listnameItemModelObj;

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
        child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: getPadding(
                right: 12,
                bottom: 2,
              ),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                GestureDetector(
                   onTap: 
                    () {
                      // Get.to(DetailPage(imagePath: ImageConstant.imageNotFound));
                    },
                  child: Stack(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imageNotFound,
                        height: getSize(160),
                        width: getSize(460),
                        radius: BorderRadius.circular(getHorizontalSize(10)),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          color: Colors.black.withOpacity(0.5),
                          child: Text(
                            listnameItemModelObj.nameTxt.value,
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
                          color: Colors.black.withOpacity(0.5),
                          child: Text(
                            '5 min', // Replace with your time data
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            )));
  }

  
}
