import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/profile_settings_page/controller/DoctorDataController.dart';
import 'package:goroga/presentation/profile_settings_page/global_key.dart';
import 'package:goroga/presentation/profile_settings_page/models/doctor_Data_Model.dart';
import 'package:intl/intl.dart';
import '../../widgets/custom_search_view.dart';
import 'controller/search_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentsPage extends StatefulWidget {
  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  final searchController = Get.put(searchBarController());

  final _DoctorDataController = Get.put(DoctorDataController());
  // final _appoinmrntsBookingController = Get.put(AppoinmentbookingController());
  bool isSearchVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async {
    try {
      await _DoctorDataController.fetchDoctorData();
    } catch (e) {
      _DoctorDataController.isEmpty = true.obs;
      print("error:$e");
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: MyGlobalKeys.ScaffoldKey_1,
        body: Column(
          children: [
            buildHeader(),
            Expanded(
              child: Container(
                color: Color.fromARGB(255, 182, 204, 215),
                child: Obx(
                  () {
                    if (_DoctorDataController.doctorData.value.data != null &&
                        _DoctorDataController.doctorData.value.data!.length >
                            0) {
                      return ListView.builder(
                        itemCount:
                            _DoctorDataController.doctorData.value.data!.length,
                        itemBuilder: (context, index) {
                          return DoctorCard(
                              doctorData: _DoctorDataController
                                  .doctorData.value.data![index]);
                        },
                      );
                    } else if (_DoctorDataController.doctorData.value.data !=
                            null &&
                        _DoctorDataController.doctorData.value.data!.length ==
                            0) {
                      print("is lenght tr");
                      return Center(child: Text("Data not found"));
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3 - 80,
              child: Column(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imageLogo,
                    height: MediaQuery.of(context).size.height / 4 - 80,
                    width: MediaQuery.of(context).size.width / 2,
                    fit: BoxFit.contain,
                  ),
                  CustomSearchView(
                    onchangeFunction: (query) {
                      setState(() {
                        _DoctorDataController.filterDoctors();
                      });
                    },
                    focusNode: FocusNode(),
                    controller: _DoctorDataController.searchController,
                    hintText: "Search Doctor....".tr,
                    margin: getMargin(left: 24, right: 24),
                    fontStyle: SearchViewFontStyle.UrbanistRegular14Gray400,
                    prefix: Container(
                      margin: getMargin(left: 20, top: 0, right: 12, bottom: 5),
                      child: CustomImageView(
                          svgPath: ImageConstant.imgSearchGray400),
                    ),
                    prefixConstraints:
                        BoxConstraints(maxHeight: getVerticalSize(56)),
                    suffix: Padding(
                      padding: EdgeInsets.only(right: getHorizontalSize(15)),
                      child: IconButton(
                        onPressed: () {
                          _DoctorDataController.searchController.clear();
                          _DoctorDataController.filterDoctors();
                        },
                        icon: Icon(Icons.clear, color: Colors.grey.shade600),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DoctorCard extends StatefulWidget {
  final Data doctorData;

  DoctorCard({required this.doctorData});
  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  List<String> dates = [];
  Map<String, List<String>> timeSlots = {};
  bool showDates = false;
  bool showTimeSlots = false;
  bool showInfo = false;
  String? selectedDate = null;
  String? selectedTime = null;
  String? start_time = null;
  String? end_time = null;
  DateTime _selectedDay = DateTime.now();
  String? dayOfWeek = null;

  // CalendarFormat _calendarFormat = CalendarFormat.month;
  // DateTime _selectedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    // Load data from the JSON file
    // loadJsonData();
  }

  void clearData() {
    setState(() {
      selectedDate = null;
      selectedTime = null;
      showDates = false;
      showTimeSlots = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          buildDoctorInfo(widget.doctorData),
          if (showInfo) buildInfo(widget.doctorData),
          buildButtons(),
          if (showDates) buildDates(widget.doctorData.availabilityHours),
        ],
      ),
    );
  }

  Widget buildInfo(doctorData) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text('Qualifications'),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text('BDS, MICOI (USA)',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text('Experience'),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text('25 Years Experience Overall',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text('Fees'),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text('₹ 500 /- per appointment',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text('Location'),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text('Airoli, Navi Mumbai',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDoctorInfo(
    doctorData,
  ) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorConstant.primary,
            ),
            child: Center(
              child: Text(
                widget.doctorData.name!.en![0].toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                      maxWidth: 200), // Adjust the max width as needed
                  child: Text(
                    widget.doctorData.name!.en.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 5),
                Text('Dentist'),
                SizedBox(height: 5),
                Text('BDS, MICOI (USA)',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtons() {
    return Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: ColorConstant.primary, width: 1.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              onPressed: () {
                setState(() {
                  showInfo = !showInfo;
                });
              },
              child: Text(
                showInfo ? 'Hide' : 'More Info',
                style: TextStyle(color: ColorConstant.primary),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: ColorConstant.primary, width: 1.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              onPressed: () {
                if (showDates) {
                  clearData();
                } else {
                  setState(() {
                    showDates = true;
                  });
                }
              },
              child: Text(
                showDates ? 'Cancel' : 'Book Appointment',
                style: TextStyle(color: ColorConstant.primary),
              ),
            ),
          ],
        ));
  }

  Widget buildTimeSlots(selectedDate, start_time, end_time) {
    DateTime currentTime = DateTime.now();
    String current_time = DateFormat('HH:mm').format(currentTime);
    DateTime currentDate =
        DateTime(currentTime.year, currentTime.month, currentTime.day);
    DateTime dateWithoutTime =
        DateTime(selectedDate.year, selectedDate.month, selectedDate.day);

    String selectedDateStr = DateFormat('yyyy-MM-dd').format(selectedDate);
    DateTime startTime = DateTime.parse('2000-01-01T$start_time:00');
    DateTime endTime = DateTime.parse('2000-01-01T$end_time:00');
    List<String> slots = [];

    while (startTime.isBefore(endTime)) {
      String formattedTime = DateFormat.Hm().format(startTime);
      if (currentDate != dateWithoutTime) {
        slots.add(formattedTime);
      } else if (currentDate == dateWithoutTime) {
        if (formattedTime.compareTo(current_time) > 0) {
          slots.add(formattedTime);
        }
      }
      startTime = startTime.add(Duration(minutes: 30));
    }
    return Container(
      decoration: BoxDecoration(color: Color.fromARGB(223, 233, 238, 236)),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Time Slots:"),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: slots.map((slot) {
                bool isSelected = selectedTime == slot;
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: ColorConstant.primary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      backgroundColor:
                          isSelected ? ColorConstant.primary : null,
                    ),
                    onPressed: () {
                      setState(() {
                        isSelected = true;
                        selectedTime = slot;
                        // print(selectedTime);
                      });
                    },
                    child: Text(
                      slot,
                      style: TextStyle(
                          color: isSelected
                              ? ColorConstant.whiteA700
                              : ColorConstant.primary),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                style: TextButton.styleFrom(
                  elevation: 5,
                  backgroundColor: ColorConstant.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                onPressed: () {
                  final doctorId = widget.doctorData.id;
                  final doctorName = widget.doctorData.name?.en ?? "";
                  final selectedslot = selectedTime;
                  String formattedDateTime = '$selectedDateStr $selectedslot';
                  final controller = Get.find<DoctorDataController>();
                  controller.confirmAppointment(
                      doctorId!, doctorName, formattedDateTime);

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Appointment Confirmation"),
                        content: Text(
                          "Your appointment is confirmed.",
                        ),
                        actions: <Widget>[
                          // TextButton(
                          //   style: TextButton.styleFrom(
                          //     backgroundColor: ColorConstant.primary,
                          //   ),
                          //   child: Text(
                          //     "Pay",
                          //     style: TextStyle(color: ColorConstant.whiteA700),
                          //   ),
                          //   onPressed: () {
                          //     clearData();

                          //     // Get.to(() => PaymentPage(widget.doctorData.));
                          //   },
                          // ),
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: ColorConstant.primary,
                            ),
                            child: Text(
                              "okk",
                              style: TextStyle(color: ColorConstant.whiteA700),
                            ),
                            onPressed: () {
                              clearData();

                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  'Confirm & Proceed',
                  style: TextStyle(
                    color: ColorConstant.whiteA700,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDates(List<AvailabilityHours>? availabilityHours) {
    CalendarFormat _calendarFormat = CalendarFormat.month;
    // print(_selectedDay);
    // print(selectedDate);

    Set<String> availableDaysOfWeek = Set<String>();
    if (availabilityHours != null) {
      availableDaysOfWeek = Set.from(availabilityHours
          .map((availabilityHour) => availabilityHour.day?.toLowerCase()));
    }
    // print(availableDaysOfWeek);
    DateTime currentDate = DateTime.now();
    int currentYear = currentDate.year;
    List<DateTime> availableDates = [];
    for (DateTime date = DateTime.utc(currentYear, 1, 1);
        date.isBefore(DateTime.utc(currentYear + 2, 12, 31));
        date = date.add(Duration(days: 1))) {
      DateTime currentDateWithoutTime =
          DateTime(currentDate.year, currentDate.month, currentDate.day);
      DateTime dateWithoutTime = DateTime(date.year, date.month, date.day);
      if (availableDaysOfWeek
          .contains(DateFormat('EEEE').format(date).toLowerCase())) {
        if (dateWithoutTime.isAtSameMomentAs(currentDateWithoutTime) ||
            date.isAfter(currentDateWithoutTime)) {
          availableDates.add(date);
        }
      }
    }
    // print(availableDates);
    return Container(
      decoration: BoxDecoration(color: Color.fromARGB(223, 233, 238, 236)),
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Available Days :",
            style: TextStyle(fontSize: 16),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: (availabilityHours ?? []).map((availabilityHour) {
                dayOfWeek == availabilityHour.day;

                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: ColorConstant.primary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      // backgroundColor:
                      //     isSelected ? ColorConstant.primary : null,
                    ),
                    onPressed: () {
                      // setState(() {
                      //   dayOfWeek = (isSelected ? null : availabilityHour.day)!;
                      //   print(dayOfWeek);
                      //   start_time =
                      //       isSelected ? null : availabilityHour.startAt;
                      //   end_time = isSelected ? null : availabilityHour.endAt;
                      //   showTimeSlots = true;
                      // });
                    },
                    child: Text(
                      availabilityHour.day?.toUpperCase() ?? '',
                      style: TextStyle(
                        color: ColorConstant.primary,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Text(
            "Choose date :",
            style: TextStyle(fontSize: 16),
          ),
          TableCalendar(
            calendarFormat: _calendarFormat,
            firstDay: DateTime.utc(currentYear, 1, 1),
            lastDay: DateTime.utc(currentYear + 2, 12, 31),
            focusedDay: _selectedDay,
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, date, events) {
                if (availableDates.contains(date)) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      '${date.day}',
                      style: TextStyle(
                          color: ColorConstant.primary,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                } else {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      '${date.day}',
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }
              },
            ),
            selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
            enabledDayPredicate: (day) => availableDates.contains(day),
            onDaySelected: (selected_day, focusedDay) {
              setState(() {
                _selectedDay = selected_day;
                dayOfWeek = DateFormat('EEEE').format(_selectedDay);

                final day = dayOfWeek?.toLowerCase();
                showTimeSlots = availabilityHours?.any((availabilityHour) {
                      return availabilityHour.day?.toLowerCase() == day;
                    }) ??
                    false;

                if (showTimeSlots) {
                  final matchingHour =
                      availabilityHours?.firstWhere((availabilityHour) {
                    return availabilityHour.day?.toLowerCase() == day;
                  });

                  if (matchingHour != null) {
                    start_time = matchingHour.startAt;
                    end_time = matchingHour.endAt;
                  }
                }
              });
            },
          ),
          SizedBox(height: 10),
          if (showTimeSlots) buildTimeSlots(_selectedDay, start_time, end_time),
        ],
      ),
    );
  }
}
