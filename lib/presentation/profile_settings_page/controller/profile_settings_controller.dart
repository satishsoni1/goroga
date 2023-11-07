import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/profile_settings_page/models/profile_settings_model.dart';

class ProfileSettingsController extends GetxController {
  ProfileSettingsController(this.profileSettingsModelObj);

  Rx<ProfileSettingsModel> profileSettingsModelObj;

  Rx<bool> isSelectedSwitch = false.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
