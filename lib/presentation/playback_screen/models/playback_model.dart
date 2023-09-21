import 'package:get/get.dart';import 'playback_item_model.dart';class PlaybackModel {Rx<List<PlaybackItemModel>> playbackItemList = Rx(List.generate(7,(index) => PlaybackItemModel()));

 }
