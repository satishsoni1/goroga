import 'package:get/get.dart';import 'listcountry_item_model.dart';import 'listpodcasttitle1_item_model.dart';class SearchResultPodcastModel {Rx<List<ListcountryItemModel>> listcountryItemList = Rx(List.generate(3,(index) => ListcountryItemModel()));

Rx<List<Listpodcasttitle1ItemModel>> listpodcasttitle1ItemList = Rx(List.generate(2,(index) => Listpodcasttitle1ItemModel()));

 }
