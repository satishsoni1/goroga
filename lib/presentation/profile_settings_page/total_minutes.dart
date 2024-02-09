import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/app_bar/appbar_image.dart';
import 'package:goroga/widgets/app_bar/appbar_title.dart';

import '../../widgets/app_bar/custom_app_bar.dart';

class totalMinutes extends StatefulWidget {
  final dynamic data;
  totalMinutes({
    required this.data,
  });
  @override
  State<totalMinutes> createState() => _totalMinutesState();
}

class _totalMinutesState extends State<totalMinutes> {
  List<dynamic> weekdays = [];
  List<dynamic> minutes = [];
//  List<String> no_of_sessions = [
//     "1",
//     "2",
//     "3",
//     "4",
//     "5",
//     "6",
//     "7",
//     "8"
//   ];
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.data == null) {
      print("empty data");
      weekdays = [];
    } else {
      weekdays = widget.data.labels;
      minutes = widget.data.data;
      if (weekdays.length > 7) {
        weekdays = weekdays.sublist(weekdays.length - 7);
        minutes = minutes.sublist(minutes.length - 7);
        print("${weekdays}${minutes}");
      }
      print("${weekdays}${minutes}");
    }

    // print("beforeSessionStress: ${beforeSessionStress}");
    // print(afterSessionStress);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
          height: getVerticalSize(80),
          title: AppbarTitle(
              text: "Total Minutes".tr, margin: getMargin(left: 16)),
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
                          'Total Minutes | ' + "0",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('Total minutes spent in sessions'),
                        leading: Icon(
                          Icons.hourglass_top_rounded,
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
                  width: 600,
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

                              maxY: 60,
                              //   minY: 10,
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
                                    getTitlesWidget:
                                        (double value, TitleMeta meta) {
                                      int intValue = value.toInt();

                                      if (intValue >= 0 && intValue <= 7) {
                                        return Transform.rotate(
                                          angle: -50,
                                          child: Container(
                                            margin: getMargin(top: 8.0),
                                            child: Text(
                                              weekdays[intValue],
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: ColorConstant.primary),
                                            ),
                                          ),
                                        );
                                      }

                                      return SizedBox.shrink();
                                    },
                                  )),
                                  leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                          showTitles: true,
                                          reservedSize: 60,
                                          interval: 10

                                          // getTitlesWidget: (double value, TitleMeta meta) {
                                          //   int intValue = value.toInt();

                                          //   if (intValue > 0 &&
                                          //       intValue <= no_of_sessions.length) {
                                          //     return Text(
                                          //       no_of_sessions[intValue - 1],
                                          //       // textDirection: TextDirection.rtl,
                                          //       textAlign: TextAlign.center,
                                          //       style: TextStyle(
                                          //           fontSize: 12, color: ColorConstant.primary),
                                          //     );
                                          //   }

                                          //   return SizedBox.shrink();
                                          // },
                                          ))),
                              barGroups: List.generate(minutes.length , (index) {
                                return BarChartGroupData(
                                  x: index,
                                  barRods: [
                                    BarChartRodData(
                                      toY: minutes[index].toDouble(),
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
