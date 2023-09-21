import 'package:goroga/core/app_export.dart';import 'package:goroga/presentation/downloaded_page/models/downloaded_model.dart';class DownloadedController extends GetxController {DownloadedController(this.downloadedModelObj);

Rx<DownloadedModel> downloadedModelObj;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
 }
