import 'package:goroga/core/app_export.dart';import 'package:goroga/presentation/subscribe_screen/models/subscribe_model.dart';class SubscribeController extends GetxController {Rx<SubscribeModel> subscribeModelObj = SubscribeModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
 }
