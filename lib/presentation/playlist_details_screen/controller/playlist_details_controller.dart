import 'package:goroga/core/app_export.dart';import 'package:goroga/presentation/playlist_details_screen/models/playlist_details_model.dart';class PlaylistDetailsController extends GetxController {Rx<PlaylistDetailsModel> playlistDetailsModelObj = PlaylistDetailsModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
 }
