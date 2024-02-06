import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/explore_page/models/program_model.dart';
import 'package:goroga/presentation/home_page/controller/beforesessionController.dart';
import 'package:goroga/presentation/home_page/widgets/video_screen.dart';
import 'package:goroga/widgets/app_bar/custom_app_bar.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../../widgets/app_bar/appbar_image.dart';

class beforeSession extends StatefulWidget {
  final dynamic data;
  beforeSession({
    required this.data,
  });

  @override
  State<beforeSession> createState() => _beforeSessionState();
}

class _beforeSessionState extends State<beforeSession> {
  BeforeSessionController _controller =
      Get.put(BeforeSessionController()); // Initialize the controller
  List<dynamic> sessionUsers = [];
  var patientId = null;
  double _sliderValue = 0;
  Color getSliderActiveColor() {
    if (_sliderValue >= 0 && _sliderValue <= 2) {
      return ColorConstant.primary;
    } else if (_sliderValue >= 2 && _sliderValue <= 3) {
      return Colors.blue.shade300;
    } else if (_sliderValue >= 3 && _sliderValue <= 4) {
      return Color.fromARGB(255, 145, 64, 175);
    } else if (_sliderValue >= 4 && _sliderValue <= 5) {
      return Color.fromARGB(255, 223, 112, 221);
    } else if (_sliderValue >= 5 && _sliderValue <= 6) {
      return Colors.pink.shade900;
    } else if (_sliderValue >= 6 && _sliderValue <= 7) {
      return Colors.red.shade800;
    } else if (_sliderValue >= 7 && _sliderValue <= 8) {
      return Colors.red;
    } else if (_sliderValue >= 8 && _sliderValue <= 9) {
      return Colors.red;
    } else if (_sliderValue >= 9 && _sliderValue <= 10) {
      return Colors.red;
    }
    // Default color if none of the conditions match
    return ColorConstant.primary;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchData();
  }

  String text = "";
  int stress_level = 0;
  Future<void> fetchData() async {
    try {
      dynamic data = await _controller.getPatient();
      setState(() {
        sessionUsers = data.data;
      });
    } catch (e) {
      print("error:$e");
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    var sessionId = widget.data.id;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: Text(
          "Before you start the session",
          style: TextStyle(
              color: ColorConstant.primary, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        height: getVerticalSize(70),
        leadingWidth: 52,
        leading: AppbarImage(
          height: getSize(28),
          width: getSize(28),
          svgPath: ImageConstant.imgArrowleft,
          margin: getMargin(left: 24, top: 10, bottom: 13),
          onTap: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: DropdownButtonFormField<dynamic>(
                icon: Icon(Icons.arrow_drop_down),
                hint: Text('Select Patient'),
                // value: dropvalue,
                items: sessionUsers.map((item) {
                  return DropdownMenuItem<dynamic>(
                    value: item.id.toString(),
                    child: Text(item.name.toString()),
                  );
                }).toList(),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.brown.shade50),
                onChanged: (item) {
                  setState(() {
                    patientId = item;
                  });
                }),
          ),
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.brown.shade50,
            child: Column(children: [
              SizedBox(
                  width: 200,
                  child: Text(
                    "How is your stress level right now?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  )),
              SizedBox(
                height: 10,
              ),
              if (_sliderValue >= 0 && _sliderValue <= 2)
                Text(
                  "Minimal",
                  style: TextStyle(
                      color: ColorConstant.primary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )
              else if (_sliderValue >= 2 && _sliderValue <= 3)
                Text("Low",
                    style: TextStyle(
                        color: Colors.blue.shade300,
                        fontSize: 24,
                        fontWeight: FontWeight.bold))
              else if (_sliderValue >= 3 && _sliderValue <= 4)
                Text(
                  "Mild",
                  style: TextStyle(
                      color: Color.fromARGB(255, 145, 64, 175),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )
              else if (_sliderValue >= 4 && _sliderValue <= 5)
                Text(
                  "Tolerable",
                  style: TextStyle(
                      color: Color.fromARGB(255, 223, 112, 221),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )
              else if (_sliderValue >= 5 && _sliderValue <= 6)
                Text(
                  "Moderate",
                  style: TextStyle(
                      color: Colors.pink.shade900,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )
              else if (_sliderValue >= 6 && _sliderValue <= 7)
                Text(
                  "Worrisome",
                  style: TextStyle(
                      color: Colors.red.shade800,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )
              else if (_sliderValue >= 7 && _sliderValue <= 8)
                Text(
                  "Intense",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )
              else if (_sliderValue >= 8 && _sliderValue <= 9)
                Text(
                  "Severe",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )
              else if (_sliderValue >= 9 && _sliderValue <= 10)
                Text(
                  "Extreme",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              Slider(
                value: _sliderValue,
                min: 0,
                max: 10,
                // divisions: 5,
                label: _sliderValue.round().toString(),

                activeColor: getSliderActiveColor(),
                inactiveColor: ColorConstant.blueGray100,
                onChanged: (double value) {
                  setState(() {
                    _sliderValue = value;
                    if (_sliderValue > 0 && _sliderValue <= 2) {
                      stress_level = 1;
                    } else if (_sliderValue >= 2 && _sliderValue <= 3) {
                      stress_level = 2;
                    } else if (_sliderValue >= 3 && _sliderValue <= 4) {
                      stress_level = 3;
                    } else if (_sliderValue >= 4 && _sliderValue <= 5) {
                      stress_level = 4;
                    } else if (_sliderValue >= 5 && _sliderValue <= 6) {
                      stress_level = 5;
                    } else if (_sliderValue >= 6 && _sliderValue <= 7) {
                      stress_level = 6;
                    } else if (_sliderValue >= 7 && _sliderValue <= 8) {
                      stress_level = 7;
                    } else if (_sliderValue >= 8 && _sliderValue <= 9) {
                      stress_level = 8;
                    } else if (_sliderValue >= 9 && _sliderValue <= 10) {
                      stress_level = 9;
                    }
                  });
                  // print(_sliderValue);
                },
              ),
              ElevatedButton(
                  onPressed: (() {
                    print(patientId);
                    _controller.beforeSessionData(
                        stress_level, text, sessionId, patientId);

                    Get.to(() => VideoPlayerScreen(
                          data: widget.data,
                        ));
                  }),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstant.primary),
                  child: Text(
                    "Next",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white),
                  )),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                cursorColor: ColorConstant.primary,
                decoration: InputDecoration(
                  filled: true,

                  // labelText: 'Journal: How are you feeling?',
                  hintText: 'Journal: How are you feeling?',
                  hintStyle: TextStyle(
                      color: Colors.grey), // Set the color for the hint text
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
                onChanged: (value) {
                  setState(
                    () {
                      text = value;
                      // print(text);
                    },
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: Container(
                  // padding: EdgeInsets.all(10),
                  child: Column(children: [
                    Text(
                      "This will help you track your progress over time.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        // fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ]),
                ),
              ),
            ]),
          ),
        ],
      ),
    ));
  }
}
