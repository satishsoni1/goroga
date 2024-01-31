import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/app_bar/appbar_image.dart';
import 'package:goroga/widgets/app_bar/appbar_title.dart';

import '../../widgets/app_bar/custom_app_bar.dart';

class lastGAD extends StatefulWidget {
  final dynamic data;
  lastGAD({
    required this.data,
  });
  @override
  State<lastGAD> createState() => _lastGADState();
}

class _lastGADState extends State<lastGAD> {
  List<dynamic> days = [];
  List<dynamic> labels = [];
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.data);
    days = widget.data.data;
    labels = widget.data.labels;
    print("beforeSessionStress: ${days[1].month}");
    print(labels);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
          height: getVerticalSize(80),
          title: AppbarTitle(
              text: "Last GAD-7 score".tr, margin: getMargin(left: 16)),
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
      body:Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerRight,
            width: 250,
            child: ListTile(
              
              minLeadingWidth: 23,
              title: Text(
                'Last GAD7 score | 0',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('your last GAD-7 score'),
              leading: Icon(
                Icons.bar_chart_sharp,
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
                  width: 300,
                  child: Container(
                    alignment: Alignment.center,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: LineChart(LineChartData(
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
                        maxX: days.length.toDouble(),
                        maxY: labels.length.toDouble(),
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
                              interval: 1,
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta) {
                                int intValue = value.toInt();
                                if (intValue > 0 && intValue <= days.length) {
                                  return Text(
                                    days[intValue - 1].month.toString(),
                                    // "hi",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: ColorConstant.primary),
                                  );
                                }

                                return SizedBox.shrink();
                              },
                            )),
                            leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 60,
                              interval: 1,
                              getTitlesWidget: (double value, TitleMeta meta) {
                                int intValue = value.toInt();

                                if (intValue > 0 && intValue <= labels.length) {
                                  return Text(
                                    labels[intValue - 1],
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: ColorConstant.primary),
                                  );
                                }

                                return SizedBox.shrink();
                              },
                            ))),
                        // barGroups:
                        //     List.generate(beforeSessionStress.length-1, (index) {
                        //   return BarChartGroupData(
                        //     x: index + 1, // Adding 1 to start x values from 1
                        //     barRods: [
                        //       BarChartRodData(
                        //         toY: beforeSessionStress[index].id.toDouble(),
                        //         fromY: 0,
                        //         width: 15,
                        //         color: Colors.amber,
                        //       ),
                        //     ],
                        //   );
                        // }),
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
