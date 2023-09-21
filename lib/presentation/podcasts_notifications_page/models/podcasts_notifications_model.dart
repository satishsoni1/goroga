import 'package:get/get.dart';import 'listpodcasttitle_item_model.dart';import 'listsixteen_item_model.dart';class PodcastsNotificationsModel {Rx<List<ListpodcasttitleItemModel>> listpodcasttitleItemList = Rx(List.generate(3,(index) => ListpodcasttitleItemModel()));

Rx<List<ListsixteenItemModel>> listsixteenItemList = Rx(List.generate(2,(index) => ListsixteenItemModel()));

 }
