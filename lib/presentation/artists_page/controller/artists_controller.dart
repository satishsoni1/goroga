import 'package:goroga/core/app_export.dart';import 'package:goroga/presentation/artists_page/models/artists_model.dart';class ArtistsController extends GetxController {ArtistsController(this.artistsModelObj);

Rx<ArtistsModel> artistsModelObj;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
 }
