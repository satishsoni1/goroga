import 'package:goroga/core/app_export.dart';import 'package:goroga/presentation/profile_screen/models/profile_model.dart';import 'package:country_pickers/country.dart';import 'package:country_pickers/utils/utils.dart';import 'package:flutter/material.dart';class ProfileController extends GetxController {TextEditingController statusDefaultController = TextEditingController();

TextEditingController statusDefaultOneController = TextEditingController();

TextEditingController statusDefaultTwoController = TextEditingController();

TextEditingController phoneNumberController = TextEditingController();

Rx<ProfileModel> profileModelObj = ProfileModel().obs;

Rx<Country> selectedCountry = CountryPickerUtils.getCountryByPhoneCode('91').obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); statusDefaultController.dispose(); statusDefaultOneController.dispose(); statusDefaultTwoController.dispose(); phoneNumberController.dispose(); } 
 }
