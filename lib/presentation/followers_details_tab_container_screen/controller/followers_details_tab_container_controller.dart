import 'package:goroga/core/app_export.dart';import 'package:goroga/presentation/followers_details_tab_container_screen/models/followers_details_tab_container_model.dart';import 'package:flutter/material.dart';class FollowersDetailsTabContainerController extends GetxController with  GetSingleTickerProviderStateMixin {Rx<FollowersDetailsTabContainerModel> followersDetailsTabContainerModelObj = FollowersDetailsTabContainerModel().obs;

late TabController group44Controller = Get.put(TabController(vsync: this, length: 2));

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
 }
