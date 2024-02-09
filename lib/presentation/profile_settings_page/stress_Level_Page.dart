import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/app_bar/appbar_image.dart';
import 'package:goroga/widgets/app_bar/appbar_title.dart';

import '../../widgets/app_bar/custom_app_bar.dart';

class stressLevelPage extends StatefulWidget {
  final dynamic data;
  stressLevelPage({
    required this.data,
  });
  @override
  State<stressLevelPage> createState() => _stressLevelPageState();
}

class _stressLevelPageState extends State<stressLevelPage> {
  List<dynamic> weekdays = [];
  List<dynamic> beforeSessionStress = [];
  List<dynamic> afterSessionStress = [];
  List<dynamic> last7Weekdays = [];
  List<String> stressLevels = [
    "Minimal",
    "Low",
    "Mild",
    "Tolerable",
    "Moderate",
    "Worrisome",
    "Intense",
    "Severe",
    "Extreme"
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.data == null) {
      print("empty data");
      weekdays = [];
    } else {
      weekdays = widget.data.dates;
      beforeSessionStress = widget.data.stresslevels.beforeSessionStress;
      afterSessionStress = widget.data.stresslevels.afterSessionStress;
      if (weekdays.length > 7) {
        weekdays = weekdays.sublist(weekdays.length - 7);
        beforeSessionStress =
            beforeSessionStress.sublist(beforeSessionStress.length - 7);
        afterSessionStress =
            afterSessionStress.sublist(afterSessionStress.length - 7);
      }
      print("beforeSessionStress: ${beforeSessionStress}");
      print(weekdays);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
          height: getVerticalSize(80),
          title:
              AppbarTitle(text: "Stress Level".tr, margin: getMargin(left: 16)),
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
          Container(
            alignment: Alignment.centerRight,
            width: 250,
            child: ListTile(
              minLeadingWidth: 23,
              title: Text(
                'Stress Level | N/A',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Based on your last session'),
              leading: Icon(
                Icons.circle_rounded,
                color: ColorConstant.primary,
              ),
              // trailing: Icon(
              //   Icons.arrow_forward_ios,
              //   color: ColorConstant.primary,
              // ),
            ),
          ),
          Stack(
            children: [
              // Image.network(
              //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmJctbIxhrOV2WWwf9f4TAT3DVgPLiS2NNvPCordwDJApTF89IT5H-753N2HCpR_1bx0w&usqp=CAU',
              //   fit: BoxFit.cover,
              //   width: double.infinity,
              //   height: double.infinity,
              // ),

              Padding(
                padding: getPadding(all: 16),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Container(
                    alignment: Alignment.center,
                    child: weekdays.isEmpty
                        ? Text("No data found")
                        : AspectRatio(
                            aspectRatio: 1,
                            child: BarChart(BarChartData(
                              // extraLinesData: ExtraLinesData(horizontalLines: List.filled(10, HorizontalLine(y: ))),
                              borderData: FlBorderData(
                                  border: Border(
                                top: BorderSide.none,
                                right: BorderSide.none,
                                left: BorderSide(
                                    width: 2, color: ColorConstant.primary),
                                bottom: BorderSide(
                                    width: 2, color: ColorConstant.primary),
                              )),
                              groupsSpace: 10,

                              maxY: stressLevels.length.toDouble(),
                              gridData: FlGridData(show: false),
                              titlesData: FlTitlesData(
                                  show: true,
                                  topTitles: AxisTitles(
                                      sideTitles:
                                          SideTitles(showTitles: false)),
                                  rightTitles: AxisTitles(
                                      sideTitles:
                                          SideTitles(showTitles: false)),
                                  bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                    // interval: 1,
                                    showTitles: true,
                                    getTitlesWidget:
                                        (double value, TitleMeta meta) {
                                      int intValue = (value).toInt();

                                      if (intValue >= 0 &&
                                          intValue <= weekdays.length) {
                                        return Transform.rotate(
                                            angle: -50,
                                            child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 8.0),
                                                child: Text(
                                                  weekdays[intValue - 1],
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: ColorConstant
                                                          .primary),
                                                )));
                                      }

                                      return SizedBox.shrink();
                                    },
                                  )),
                                  leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 60,
                                    getTitlesWidget:
                                        (double value, TitleMeta meta) {
                                      int intValue = value.toInt();

                                      if (intValue > 0 &&
                                          intValue <= stressLevels.length) {
                                        return Text(
                                          stressLevels[intValue - 1],
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: ColorConstant.primary),
                                        );
                                      }

                                      return SizedBox.shrink();
                                    },
                                  ))),
                              barGroups: List.generate(
                                  beforeSessionStress.length, (index) {
                                return BarChartGroupData(
                                  x: index +
                                      1, // Adding 1 to start x values from 1
                                  barRods: [
                                    BarChartRodData(
                                      toY: beforeSessionStress[index]
                                          .id
                                          .toDouble(),
                                      fromY: 0,
                                      width: 15,
                                      color: ColorConstant.primary,
                                    ),
                                  ],
                                );
                              }),
                            )),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
