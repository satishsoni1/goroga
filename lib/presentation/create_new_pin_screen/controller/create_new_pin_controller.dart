import 'package:goroga/core/app_export.dart';import 'package:goroga/presentation/create_new_pin_screen/models/create_new_pin_model.dart';import 'package:sms_autofill/sms_autofill.dart';import 'package:flutter/material.dart';class CreateNewPinController extends GetxController with  CodeAutoFill {Rx<TextEditingController> otpController = TextEditingController().obs;

Rx<CreateNewPinModel> createNewPinModelObj = CreateNewPinModel().obs;

@override void codeUpdated() { otpController.value.text = code!; } 
@override void onInit() { super.onInit(); listenForCode(); } 
@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
 }
