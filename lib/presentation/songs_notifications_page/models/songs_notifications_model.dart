import 'package:get/get.dart';import 'listday_item_model.dart';import 'listyesterday_item_model.dart';class SongsNotificationsModel {Rx<List<ListdayItemModel>> listdayItemList = Rx(List.generate(3,(index) => ListdayItemModel()));

Rx<List<ListyesterdayItemModel>> listyesterdayItemList = Rx(List.generate(3,(index) => ListyesterdayItemModel()));

 }
