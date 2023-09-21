import 'package:goroga/core/app_export.dart';import 'package:goroga/presentation/language_screen/models/language_model.dart';class LanguageController extends GetxController {Rx<LanguageModel> languageModelObj = LanguageModel().obs;

Rx<String> radioGroup = "".obs;

Rx<String> radioGroup1 = "".obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
 }
