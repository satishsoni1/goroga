import 'package:get/get.dart';import 'playlists_item_model.dart';class PlaylistsModel {Rx<List<PlaylistsItemModel>> playlistsItemList = Rx(List.generate(3,(index) => PlaylistsItemModel()));

 }
