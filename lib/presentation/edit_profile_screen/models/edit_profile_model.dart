import 'package:get/get.dart';import 'package:goroga/data/models/selectionPopupModel/selection_popup_model.dart';class EditProfileModel {Rx<DateTime>? selectedDateTxt = Rx(DateTime.now());

Rx<String> dateTxt = Rx("");

Rx<List<SelectionPopupModel>> dropdownItemList = Rx([SelectionPopupModel(id:1,title:"Item One",isSelected:true,),SelectionPopupModel(id:2,title:"Item Two",),SelectionPopupModel(id:3,title:"Item Three",)]);

 }
