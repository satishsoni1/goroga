import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/profile_settings_page/controller/add_patient_controller.dart';
import 'package:goroga/widgets/custom_button.dart';
import 'package:goroga/widgets/custom_text_form_field.dart';

import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class addPatientPage extends StatefulWidget {
  const addPatientPage({Key? key}) : super(key: key);

  @override
  State<addPatientPage> createState() => _addPatientPageState();
}

class _addPatientPageState extends State<addPatientPage> {
  List<String> Gender = ["Male", "Female", "Other"];
  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  addPatientController _addPatientController = Get.put(addPatientController());
  String? selectedGender;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Validators
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter name';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter phone number';
    } else if (value.length != 10) {
      return 'Phone number must be 10 digits ';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter email address';
    } else if (!value.contains('@')) {
      return 'Please enter a valid email ';
    }
    return null;
  }

  String? _validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter age';
    } else if (int.tryParse(value) == null || int.parse(value) <= 0) {
      return 'Enter age';
    } else if (value.length > 2) {
      return 'invalid ';
    }
    return null;
  }

  String? _validateGender(dynamic? value) {
    if (value == null) {
      return 'Please select a gender';
    }
    return null; // Return null if the value is valid
  }

  String? _validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter patient address';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(80),
                title: AppbarTitle(
                    text: "Add Patient".tr, margin: getMargin(left: 16)),
                leadingWidth: 52,
                leading: AppbarImage(
                  height: getSize(28),
                  width: getSize(28),
                  svgPath: ImageConstant.imgArrowleft,
                  margin: getMargin(left: 24, top: 2, bottom: 2),
                  onTap: () {
                    Get.back();
                  },
                )),
            body: SingleChildScrollView(
                child: Form(
              // autovalidateMode: AutovalidateMode.disabled,
              key: _formKey,
              child: Container(
                  width: double.maxFinite,
                  padding: getPadding(left: 24, top: 11, right: 24, bottom: 11),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: getPadding(top: 20),
                            child: Text("Patient Details".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtUrbanistRomanBold32)),
                        CustomTextFormField(
                            validator: _validateName,
                            // focusNode: FocusNode(),
                            controller: nameController,
                            hintText: "Enter Patient Name..".tr,
                            margin: getMargin(top: 43),
                            // padding: TextFormFieldPadding.PaddingT21,
                            fontStyle:
                                TextFormFieldFontStyle.UrbanistRegular14Gray500,
                            textInputType: TextInputType.name,
                            prefix: Container(
                                margin: getMargin(
                                    left: 20, top: 20, right: 12, bottom: 20),
                                child: Icon(
                                  Icons.person_2_sharp,
                                  color: Colors.grey,
                                )),
                            prefixConstraints:
                                BoxConstraints(maxHeight: getVerticalSize(60))),
                        CustomTextFormField(
                            validator: _validatePhoneNumber,
                            controller: phoneController,
                            hintText: "Enter Patient Mobile No.".tr,
                            margin: getMargin(top: 20),
                            prefix: Container(
                                margin: getMargin(
                                    left: 20, top: 20, right: 12, bottom: 20),
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.grey,
                                )),
                            fontStyle:
                                TextFormFieldFontStyle.UrbanistRegular14Gray500,
                            textInputType: TextInputType.phone,
                            formatter: LengthLimitingTextInputFormatter(10),
                            prefixConstraints:
                                BoxConstraints(maxHeight: getVerticalSize(60))),
                        CustomTextFormField(
                            validator: _validateEmail,
                            controller: emailController,
                            hintText: "Enter patient email address".tr,
                            margin: getMargin(top: 20),
                            prefix: Container(
                                margin: getMargin(
                                    left: 20, top: 20, right: 12, bottom: 20),
                                child: CustomImageView(
                                    svgPath: ImageConstant.imgCheckmark)),
                            // padding: TextFormFieldPadding.PaddingT21,
                            fontStyle:
                                TextFormFieldFontStyle.UrbanistRegular14Gray500,
                            textInputType: TextInputType.emailAddress,
                            prefixConstraints:
                                BoxConstraints(maxHeight: getVerticalSize(60))),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin:
                                    getMargin(top: 20, right: 12, bottom: 20),
                                width: getHorizontalSize(100),
                                // height: getVerticalSize(60),
                                child: CustomTextFormField(
                                  validator: _validateAge,
                                  // textAlign: TextAlign.center,
                                  controller: ageController,
                                  prefixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(60)),
                                  // cursorColor: ColorConstant.primary,
                                  textInputType: TextInputType.number,
                                  fontStyle: TextFormFieldFontStyle
                                      .UrbanistRegular14Gray500,
                                  // decoration: InputDecoration(
                                  // filled: true,
                                  // fillColor: ColorConstant.gray50,
                                  hintText: 'Age',
                                  // hintStyle: TextStyle(
                                  //   fontSize: getFontSize(16),
                                  //   color: Colors.black,
                                  // ),
                                  // alignLabelWithHint: true,
                                  // border: OutlineInputBorder(
                                  //   borderRadius: BorderRadius.circular(10),
                                  //   borderSide: BorderSide.none,
                                  // ),
                                  // ),
                                ),
                              ),
                              SizedBox(
                                // height: getVerticalSize(60),
                                width: getHorizontalSize(200),
                                child: DropdownButtonFormField<dynamic>(
                                  icon: Icon(Icons.arrow_drop_down),
                                  value: selectedGender,
                                  focusColor: Colors.grey,
                                  // itemHeight: getVerticalSize(60),
                                  // autovalidateMode: true,
                                  hint: Text(
                                    'Select Gender',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: getFontSize(16),
                                        color: Colors.black),
                                  ),
                                  items: Gender.map((item) {
                                    return DropdownMenuItem<dynamic>(
                                      value: item,
                                      child: Text(item,
                                          style: TextStyle(
                                              fontSize: getFontSize(16))),
                                    );
                                  }).toList(),
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none),
                                    filled: true,
                                    fillColor: ColorConstant.gray50,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 16), // Adjust padding

                                    alignLabelWithHint:
                                        true, // Align hint text with dropdown button
                                  ),
                                  onChanged: (item) {
                                    setState(() {
                                      print(item);
                                      selectedGender = item;
                                    });
                                  },
                                  validator: _validateGender,
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomTextFormField(
                            controller: addressController,
                            hintText: "Patient Address",
                            padding: TextFormFieldPadding.PaddingT21,
                            fontStyle:
                                TextFormFieldFontStyle.UrbanistRegular14Gray500,
                            textInputType: TextInputType.streetAddress,
                            prefix: Container(
                              margin: getMargin(
                                  left: 20, top: 20, right: 12, bottom: 20),
                              child: Icon(
                                Icons.home,
                                color: Colors.grey,
                              ),
                            ),
                            prefixConstraints:
                                BoxConstraints(maxHeight: getVerticalSize(60))),
                        CustomButton(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                _addPatientController.addpatient(
                                    nameController.text,
                                    phoneController.text,
                                    emailController.text,
                                    ageController.text,
                                    selectedGender,
                                    addressController.text);

                                nameController.clear();
                                phoneController.clear();
                                emailController.clear();
                                ageController.clear();
                                addressController.clear();
                                setState(() {
                                  setState(() {
                                    selectedGender = null;
                                  });
                                  print(selectedGender);
                                });
                              }
                            },
                            height: getVerticalSize(58),
                            text: "Add".tr,
                            margin: getMargin(top: 20),
                            padding: ButtonPadding.PaddingT18)
                      ])),
            ))));
  }
}
