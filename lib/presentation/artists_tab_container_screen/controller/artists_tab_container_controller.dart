import 'package:goroga/core/app_export.dart';import 'package:goroga/presentation/artists_tab_container_screen/models/artists_tab_container_model.dart';import 'package:flutter/material.dart';class ArtistsTabContainerController extends GetxController with  GetSingleTickerProviderStateMixin {Rx<ArtistsTabContainerModel> artistsTabContainerModelObj = ArtistsTabContainerModel().obs;

late TabController group44Controller = Get.put(TabController(vsync: this, length: 2));

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
 }
