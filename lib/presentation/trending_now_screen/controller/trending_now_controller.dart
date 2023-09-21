import 'package:goroga/core/app_export.dart';import 'package:goroga/presentation/trending_now_screen/models/trending_now_model.dart';class TrendingNowController extends GetxController {Rx<TrendingNowModel> trendingNowModelObj = TrendingNowModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
 }
