import 'package:goroga/core/app_export.dart';import 'package:goroga/presentation/explore_page/models/explore_model.dart';import 'package:flutter/material.dart';class ExploreController extends GetxController {ExploreController(this.exploreModelObj);

TextEditingController searchBarController = TextEditingController();

Rx<ExploreModel> exploreModelObj;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); searchBarController.dispose(); } 
 }
