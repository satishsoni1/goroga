import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            // backgroundColor: Colors.grey,
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
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 24, top: 11, right: 24, bottom: 11),
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
                              // focusNode: FocusNode(),
                              controller: nameController,
                              hintText: "Enter Patient Name..".tr,
                              margin: getMargin(top: 43),
                              // padding: TextFormFieldPadding.PaddingT21,
                              fontStyle: TextFormFieldFontStyle
                                  .UrbanistRegular14Gray500,
                              textInputType: TextInputType.name,
                              prefix: Container(
                                  margin: getMargin(
                                      left: 20, top: 20, right: 12, bottom: 20),
                                  child: Icon(
                                    Icons.person_2_sharp,
                                    color: Colors.grey,
                                  )),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(60))),
                          CustomTextFormField(
                              // focusNode: FocusNode(),
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
                              // padding: TextFormFieldPadding.PaddingT21,
                              fontStyle: TextFormFieldFontStyle
                                  .UrbanistRegular14Gray500,
                              textInputType: TextInputType.number,
                              // prefix: Container(
                              //     margin: getMargin(
                              //         left: 20, top: 20, right: 12, bottom: 20),
                              //     child: CustomImageView(
                              //         svgPath: ImageConstant.imgCheckmark)),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(60))),
                          CustomTextFormField(
                              // focusNode: FocusNode(),
                              controller: emailController,
                              hintText: "Enter patient email address".tr,
                              margin: getMargin(top: 20),
                              padding: TextFormFieldPadding.PaddingT21,
                              fontStyle: TextFormFieldFontStyle
                                  .UrbanistRegular14Gray500,
                              textInputType: TextInputType.emailAddress,
                              prefix: Container(
                                  margin: getMargin(
                                      left: 20, top: 20, right: 12, bottom: 20),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgCheckmark)),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(60))),
                          Container(
                            width: getHorizontalSize(300),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: getHorizontalSize(100),
                                  child: TextFormField(
                                    // focusNode: FocusNode(),
                                    controller: ageController,
                                    cursorColor: ColorConstant.primary,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        hintText: 'Age',
                                        hintStyle: TextStyle(
                                          fontSize: getFontSize(16),
                                          color: Colors.black,
                                        ),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide.none,
                                        )),
                                    // hintText: "Age".tr,
                                    // margin: getMargin(top: 20),
                                    // padding: TextFormFieldPadding.PaddingT21,
                                    // fontStyle: TextFormFieldFontStyle
                                    // .UrbanistRegular14Gray500,
                                    // textInputType: TextInputType.number,
                                    // prefix: Container(
                                    //     margin: getMargin(
                                    //         left: 20, top: 20, right: 12, bottom: 20),
                                    //     // child: Icon(Icons.person)
                                    //     ),
                                    // prefixConstraints: BoxConstraints(
                                    //   maxHeight: getVerticalSize(60),
                                    // )
                                  ),
                                ),
                                Container(
                                  width: getHorizontalSize(200),
                                  child: DropdownButtonFormField<dynamic>(
                                      icon: Icon(Icons.arrow_drop_down),
                                      value: selectedGender,
                                      hint: Text(
                                        'Select Gender',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: getFontSize(16),
                                            color: Colors.black),
                                      ),

                                      // value: dropvalue,
                                      items: Gender.map((item) {
                                        return DropdownMenuItem<dynamic>(
                                          value: item,
                                          child: Text(item,
                                              style: TextStyle(
                                                  fontSize: getFontSize(16))),
                                        );
                                      }).toList(),
                                      decoration: InputDecoration(
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide.none),
                                        filled: false,
                                      ),
                                      onChanged: (item) {
                                        setState(() {
                                          print(item);
                                          selectedGender = item;
                                        });
                                      }),
                                ),
                              ],
                            ),
                          ),
                          CustomTextFormField(
                              // focusNode: FocusNode(),
                              controller: addressController,
                              hintText: "Patient Address",
                              margin: getMargin(top: 20),
                              padding: TextFormFieldPadding.PaddingT21,
                              fontStyle: TextFormFieldFontStyle
                                  .UrbanistRegular14Gray500,
                              textInputType: TextInputType.streetAddress,
                              prefix: Container(
                                margin: getMargin(
                                    left: 20, top: 20, right: 12, bottom: 20),
                                child: Icon(
                                  Icons.home,
                                  color: Colors.grey,
                                ),
                              ),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(60))),
                          CustomButton(
                              onTap: () {
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
                              },
                              height: getVerticalSize(58),
                              text: "Add".tr,
                              margin: getMargin(top: 20),
                              padding: ButtonPadding.PaddingT18)
                        ])))));
  }
}
