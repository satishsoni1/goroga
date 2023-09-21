import 'package:get/get.dart';
import 'listloremipsumdolor_item_model.dart';
import 'listname_item_model.dart';

class HomeModel {
  Rx<List<ListloremipsumdolorItemModel>> listloremipsumdolorItemList =
      Rx(List.generate(3, (index) => ListloremipsumdolorItemModel()));

  Rx<List<ListnameItemModel>> listnameItemList =
      Rx(List.generate(3, (index) => ListnameItemModel()));
}
