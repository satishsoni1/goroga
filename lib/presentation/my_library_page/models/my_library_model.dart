import 'package:get/get.dart';
import 'mylibrary_item_model.dart';

class MyLibraryModel {
  Rx<List<MylibraryItemModel>> mylibraryItemList =
      Rx(List.generate(3, (index) => MylibraryItemModel()));
}
