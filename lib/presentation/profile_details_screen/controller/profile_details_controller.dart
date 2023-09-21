import 'package:goroga/core/app_export.dart';import 'package:goroga/presentation/profile_details_screen/models/profile_details_model.dart';class ProfileDetailsController extends GetxController {Rx<ProfileDetailsModel> profileDetailsModelObj = ProfileDetailsModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
 }
