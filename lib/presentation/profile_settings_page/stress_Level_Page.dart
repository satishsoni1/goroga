import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
//   final List<String> weekdays = [
//  "Mon",
//     "Tue",
//     "Wed",
//     "Thu",
//     "Fri",
//     "Sat",
//     "Sun"
//   ];
  List<dynamic> weekdays = [];
  List<dynamic> beforeSessionStress = [];
  List<dynamic> afterSessionStress = [];

  List<String> stressLevels = [
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
  void initState() {
    // TODO: implement initState
    super.initState();
    weekdays = widget.data.dates;
    beforeSessionStress = widget.data.stresslevels.beforeSessionStress;
    afterSessionStress = widget.data.stresslevels.afterSessionStress;

    print("beforeSessionStress: ${beforeSessionStress}");
    print(afterSessionStress);
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
      body: Stack(
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
              width: 600,
              child: Container(
                alignment: Alignment.center,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: BarChart(BarChartData(
                  // extraLinesData: ExtraLinesData(horizontalLines: List.filled(10, HorizontalLine(y: ))),
                    borderData: FlBorderData(
                        border: Border(
                      top: BorderSide.none,
                      right: BorderSide.none,
                      left: BorderSide(width: 2, color: ColorConstant.primary),
                      bottom:
                          BorderSide(width: 2, color: ColorConstant.primary),
                    )),
                    groupsSpace: 10,

                    maxY: stressLevels.length.toDouble(),
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                        show: true,
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        bottomTitles: AxisTitles(
                          
                            sideTitles: SideTitles(
                              
                              interval: 2,
                          showTitles: true,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            int intValue = value.toInt();

                            if (intValue > 0 && intValue <= 7) {
                              return Text(
                                weekdays[intValue ],
                                style: TextStyle(
                                    fontSize: 12, color: ColorConstant.primary),
                              );
                            }

                            return SizedBox.shrink();
                          },
                        )),
                        leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 60,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            int intValue = value.toInt();

                            if (intValue > 0 &&
                                intValue <= stressLevels.length) {
                              return Text(
                                stressLevels[intValue - 1],
                                style: TextStyle(
                                    fontSize: 12, color: ColorConstant.primary),
                              );
                            }

                            return SizedBox.shrink();
                          },
                        ))),
                    barGroups:
                        List.generate(beforeSessionStress.length-1, (index) {
                      return BarChartGroupData(
                        x: index + 1, // Adding 1 to start x values from 1
                        barRods: [
                          BarChartRodData(
                            toY: beforeSessionStress[index].id.toDouble(),
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
    ));
  }
}
