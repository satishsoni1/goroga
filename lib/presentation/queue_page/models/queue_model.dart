import 'package:get/get.dart';import 'queue_item_model.dart';class QueueModel {Rx<List<QueueItemModel>> queueItemList = Rx(List.generate(5,(index) => QueueItemModel()));

 }
