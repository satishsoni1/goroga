import 'package:get/get.dart';
import 'listloremipsumdolor1_item_model.dart';
import 'artists_item_model.dart';
import 'podcasts_item_model.dart';

class PodcastsModel {
  Rx<List<Listloremipsumdolor1ItemModel>> listloremipsumdolor1ItemList =
      Rx(List.generate(3, (index) => Listloremipsumdolor1ItemModel()));

  Rx<List<ArtistsItemModel>> artistsItemList =
      Rx(List.generate(3, (index) => ArtistsItemModel()));

  Rx<List<PodcastsItemModel>> podcastsItemList =
      Rx(List.generate(10, (index) => PodcastsItemModel()));
}
