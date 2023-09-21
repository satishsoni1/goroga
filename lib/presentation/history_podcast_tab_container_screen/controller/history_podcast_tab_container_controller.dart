import 'package:goroga/core/app_export.dart';import 'package:goroga/presentation/history_podcast_tab_container_screen/models/history_podcast_tab_container_model.dart';import 'package:flutter/material.dart';class HistoryPodcastTabContainerController extends GetxController with  GetSingleTickerProviderStateMixin {Rx<HistoryPodcastTabContainerModel> historyPodcastTabContainerModelObj = HistoryPodcastTabContainerModel().obs;

late TabController group44Controller = Get.put(TabController(vsync: this, length: 2));

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
 }
