import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/home_page/controller/beforesessionController.dart';
import 'package:goroga/presentation/home_page/models/patient_model.dart';
import 'package:goroga/presentation/profile_settings_page/controller/DoctorDataController.dart';
import 'package:goroga/presentation/profile_settings_page/global_key.dart';
import 'package:goroga/presentation/profile_settings_page/models/doctor_Data_Model.dart';
import 'package:intl/intl.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_search_view.dart';
import 'controller/search_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class PatiensListPage extends StatefulWidget {
  @override
  State<PatiensListPage> createState() => _PatiensListPageState();
}

class _PatiensListPageState extends State<PatiensListPage> {
  BeforeSessionController _beforeSessionController =
      Get.put(BeforeSessionController());
  // final _appoinmrntsBookingController = Get.put(AppoinmentbookingController());
  dynamic patients = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Future<PatientModel> fetchData() async {
    try {
      var patientList = await _beforeSessionController.getPatient();
      return patientList;
    } catch (e) {
      print("error:$e");
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
            height: getVerticalSize(80),
            title: AppbarTitle(
                text: "Patients List".tr, margin: getMargin(left: 16)),
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
        body: Column(
          children: [
            Expanded(
                child: Container(
              color: Color.fromARGB(255, 182, 204, 215),
              child: FutureBuilder(
                  future: fetchData(),
                  builder: (context, AsyncSnapshot<PatientModel> snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text("No internet"));
                    } else if (snapshot.hasData) {
                      List<dynamic>? patients = snapshot.data?.data;

                      return ListView.builder(
                        itemCount: patients?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            elevation: 5,
                            margin: EdgeInsets.all(10.0),
                            child: Container(
                                padding: getPadding(all: 10),
                                height: 50,
                                child: Text(
                                  '${(index + 1).toString()}.  ${patients![index].name.toString()}',
                                  style: TextStyle(fontSize: 16),
                                )),
                          );
                        },
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ))
          ],
        ),
      ),
    );
  }
}
