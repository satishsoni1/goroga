import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/app_bar/appbar_image.dart';
import 'package:goroga/widgets/app_bar/appbar_title.dart';

import '../../widgets/app_bar/custom_app_bar.dart';

class stressLevelPage extends StatefulWidget {
  const stressLevelPage({Key? key}) : super(key: key);

  @override
  State<stressLevelPage> createState() => _stressLevelPageState();
}

class _stressLevelPageState extends State<stressLevelPage> {
  final List<String> weekdays = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun"
  ];

  final List<String> stressLevels = [
    "Minimal",
    "Low",
    "Mild",
    "Tolerable",
    "Moderate",
    "Worrisome",
    "Intense",
    "Severe"
  ];

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
      body: Padding(
        padding: getPadding(all: 16),
        child: SizedBox(
          width: 300,
          child: Container(
            child: AspectRatio(
              aspectRatio: 1,
              child: BarChart(BarChartData(
                  borderData: FlBorderData(
                      border: Border(
                    top: BorderSide.none,
                    right: BorderSide.none,
                    left: BorderSide(width: 2),
                    bottom: BorderSide(width: 2),
                  )),
                  groupsSpace: 10,
          
                  // maxY: 100,
                  //   minY: 10,
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                      show: true,
                      topTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          int intValue = value.toInt();
          
                          if (intValue > 0 && intValue <= weekdays.length) {
                            return Text(
                              weekdays[intValue - 1],
                              style: TextStyle(fontSize: 12),
                            );
                          }
          
                          return SizedBox.shrink();
                        },
                      )),
                      leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          int intValue = value.toInt();
          
                          if (intValue > 0 && intValue < stressLevels.length) {
                            return Text(
                              stressLevels[intValue - 1],
                              style: TextStyle(fontSize: 12),
                            );
                          }
          
                          return SizedBox.shrink();
                        },
                      ))),
                  barGroups: [
                    BarChartGroupData(x: 1, barRods: [
                      BarChartRodData(
                          toY: 10, fromY: 0, width: 15, color: Colors.amber),
                    ]),
                    BarChartGroupData(x: 2, barRods: [
                      BarChartRodData(
                          toY: 10, fromY: 0, width: 15, color: Colors.amber),
                    ]),
                    BarChartGroupData(x: 3, barRods: [
                      BarChartRodData(
                          toY: 10, fromY: 0, width: 15, color: Colors.amber),
                    ]),
                    BarChartGroupData(x: 4, barRods: [
                      BarChartRodData(
                          toY: 10, fromY: 0, width: 15, color: Colors.amber),
                    ]),
                    BarChartGroupData(x: 5, barRods: [
                      BarChartRodData(
                          toY: 10, fromY: 0, width: 15, color: Colors.amber),
                    ]),
                    BarChartGroupData(x: 6, barRods: [
                      BarChartRodData(
                          toY: 10, fromY: 0, width: 15, color: Colors.amber),
                    ]),
                    BarChartGroupData(x: 7, barRods: [
                      BarChartRodData(
                          toY: 10, fromY: 0, width: 15, color: Colors.amber),
                    ])
                  ])),
            ),
          ),
        ),
      ),
    ));
  }
}
