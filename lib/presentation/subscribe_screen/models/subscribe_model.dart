import 'package:get/get.dart';import 'subscribe_item_model.dart';class SubscribeModel {Rx<List<SubscribeItemModel>> subscribeItemList = Rx(List.generate(2,(index) => SubscribeItemModel()));

 }
