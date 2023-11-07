import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/profile_settings_page/controller/appoinmentBookingController.dart';
import 'package:goroga/presentation/profile_settings_page/models/appoinmentsModel.dart';
import 'package:goroga/widgets/app_bar/appbar_title.dart';
import 'package:goroga/widgets/app_bar/custom_app_bar.dart';
import 'package:intl/intl.dart';

import 'payment_page.dart';

class bookingAppoinments extends StatefulWidget {
  @override
  _bookingAppoinmentsState createState() => _bookingAppoinmentsState();
}

class _bookingAppoinmentsState extends State<bookingAppoinments> {
  AppoinmentbookingController _appoinmentbookingController =
      Get.put(AppoinmentbookingController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async {
    try {
      await _appoinmentbookingController.getBookings();
    } catch (e) {
      // _appoinmentbookingController.isEmpty = true.obs;
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
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            leadingWidth: 50,
            title: AppbarTitle(
              text: "Booked Appoinments".tr,
              margin: getMargin(left: 16),
            ),
          ),
          body: Center(
            child: Obx(() {
              if (_appoinmentbookingController.appointments.value.data !=
                      null &&
                  _appoinmentbookingController.appointments.value.data!.length >
                      0) {
                return ListView.builder(
                  itemCount: _appoinmentbookingController
                      .appointments.value.data!.length,
                  itemBuilder: (context, index) {
                    return appoinmentsCard(
                        doctorData: _appoinmentbookingController
                            .appointments.value.data![index]);
                  },
                );
              } else if (_appoinmentbookingController.appointments.value.data !=
                      null &&
                  _appoinmentbookingController
                          .appointments.value.data!.length ==
                      0) {
                print("is lenght tr");
                return Center(child: Text("Data not found"));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
          )),
    );
  }
}

class appoinmentsCard extends StatefulWidget {
  final Data doctorData;

  appoinmentsCard({required this.doctorData});
  @override
  State<appoinmentsCard> createState() => _appoinmentsCardState();
}

class _appoinmentsCardState extends State<appoinmentsCard> {
  Widget build(BuildContext context) {
    Data doctorData = widget.doctorData;
    DateTime? dateTime =
        doctorData.startAt != null ? DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSSSSZZZZZ").parse(doctorData.startAt) : null;
    String formattedDate = dateTime != null
        ? DateFormat('yyyy-MM-dd HH:mm').format(dateTime)
        : 'N/A';

    return Card(
      elevation: 5,

      margin: EdgeInsets.all(10.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorConstant.primary,
          ),
          child: Center(
            child: Text(
              doctorData.eProvider?.name?.en?[0] ?? "A",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        title: Text(
          "Dr. " +
              (doctorData.eProvider?.name?.en?.toString() ?? "Doctor Name"),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Phone No. : " +
                  (doctorData.eProvider?.mobileNumber?.toString() ?? "N/A"),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Timing : " + (formattedDate.toString() ?? "N/A"),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        trailing: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            backgroundColor: ColorConstant.primary,
          ),
          onPressed: () {
            Get.to(() => PaymentPage(doctorData.eProvider!.id));
          },
          child: Text(
            'Pay',
            style: TextStyle(color: ColorConstant.whiteA700),
          ),
        ),
      ),
    );
  }
}
