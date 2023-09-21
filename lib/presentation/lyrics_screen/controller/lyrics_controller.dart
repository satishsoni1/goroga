import 'package:goroga/core/app_export.dart';import 'package:goroga/presentation/lyrics_screen/models/lyrics_model.dart';class LyricsController extends GetxController {Rx<LyricsModel> lyricsModelObj = LyricsModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
 }
