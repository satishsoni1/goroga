import 'package:goroga/core/app_export.dart';import 'package:goroga/presentation/artist_search_result_page/models/artist_search_result_model.dart';class ArtistSearchResultController extends GetxController {ArtistSearchResultController(this.artistSearchResultModelObj);

Rx<ArtistSearchResultModel> artistSearchResultModelObj;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
 }
