import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/new_playlist_bottomsheet/models/new_playlist_model.dart';
import 'package:flutter/material.dart';

class NewPlaylistController extends GetxController {
  TextEditingController statusFillTypeDefaultController =
      TextEditingController();

  TextEditingController statusFillTypeDefaultOneController =
      TextEditingController();

  Rx<NewPlaylistModel> newPlaylistModelObj = NewPlaylistModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    statusFillTypeDefaultController.dispose();
    statusFillTypeDefaultOneController.dispose();
  }

  onSelected(dynamic value) {
    selectedDropDownValue = value as SelectionPopupModel;
    newPlaylistModelObj.value.dropdownItemList.value.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    newPlaylistModelObj.value.dropdownItemList.refresh();
  }
}
