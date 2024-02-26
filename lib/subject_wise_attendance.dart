import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:edumarshals/Utils/floating_action%20_button.dart';
import 'package:edumarshals/attendance_card.dart';
import 'package:edumarshals/attendance_list_card.dart';
import 'package:edumarshals/custom_appbar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class barGraph extends StatefulWidget {
  barGraph({super.key});
  final Color leftBarColor = Color(0xff004BB8);

  final Color rightBarColor = Colors.lightBlue;
  final Color avgColor = Colors.orange;
  @override
  State<StatefulWidget> createState() => barGraphState();
}

class barGraphState extends State<barGraph> {
  final _key = GlobalKey<ExpandableFabState>();
  final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  final double width = 15;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 20, 16);
    final barGroup5 = makeGroupData(4, 17, 6);
    final barGroup6 = makeGroupData(5, 19, 1.5);
    final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: custom_floating_action_button(),
      appBar: CustomAppBar(userName: "user", userImage: "image"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AttendanceCard(
                  title: "Mathematics",
                  description:
                      "your attendance is 75% above. You attended 51 lectures out of 63 lectures."),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(width: 8),
                  Text("Attendance Chart",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 25)),

                  //const Text(
                  // 'state',
                  //  style: TextStyle(color: Color(0xff77839a), fontSize: 16),
                  //),
                ],
              ),
              const SizedBox(
                height: 38,
              ),
              SizedBox(
                height: 150,
                child: BarChart(
                  BarChartData(
                    maxY: 20,
                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: Colors.grey,
                        getTooltipItem: (a, b, c, d) => null,
                      ),
                      touchCallback: (FlTouchEvent event, response) {
                        if (response == null || response.spot == null) {
                          setState(() {
                            touchedGroupIndex = -1;
                            showingBarGroups = List.of(rawBarGroups);
                          });
                          return;
                        }

                        touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                        setState(() {
                          if (!event.isInterestedForInteractions) {
                            touchedGroupIndex = -1;
                            showingBarGroups = List.of(rawBarGroups);
                            return;
                          }
                          showingBarGroups = List.of(rawBarGroups);
                          if (touchedGroupIndex != -1) {
                            var sum = 0.0;
                            for (final rod
                                in showingBarGroups[touchedGroupIndex]
                                    .barRods) {
                              sum += rod.toY;
                            }
                            final avg = sum /
                                showingBarGroups[touchedGroupIndex]
                                    .barRods
                                    .length;

                            showingBarGroups[touchedGroupIndex] =
                                showingBarGroups[touchedGroupIndex].copyWith(
                              barRods: showingBarGroups[touchedGroupIndex]
                                  .barRods
                                  .map((rod) {
                                return rod.copyWith(
                                    toY: avg, color: widget.avgColor);
                              }).toList(),
                            );
                          }
                        });
                      },
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: bottomTitles,
                          reservedSize: 42,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 28,
                          interval: 1,
                          getTitlesWidget: leftTitles,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    barGroups: showingBarGroups,
                    gridData: const FlGridData(show: false),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SizedBox(width: 1),
                  Text(" Monthly attandance",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 25)),
                  IconButton(
                      onPressed: () {
                        showFilter();
                      },
                      icon: Icon(Icons.filter_list_alt))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              attendance_list_card(date: "1 jan,24", isPresent: true),
              attendance_list_card(date: "2 jan,24", isPresent: true),
              attendance_list_card(date: "3 jan,24", isPresent: false),
              attendance_list_card(date: "4 jan,24", isPresent: true),
              attendance_list_card(date: "6 jan,24", isPresent: true),
              attendance_list_card(date: "7 jan,24", isPresent: false),
              attendance_list_card(date: "9 jan,24", isPresent: true),
            ],
          ),
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '10';
    } else if (value == 10) {
      text = '25';
    } else if (value == 19) {
      text = '50';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>[
      'Aug\'23',
      'Sept\'23',
      'Oct\'23',
      'Nov\'23',
      'Dec\'23',
      'Jan\'24',
      'Feb\'24'
    ];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 10,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: widget.leftBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: widget.rightBarColor,
          width: width,
        ),
      ],
    );
  }

  void showFilter() {
    showFlexibleBottomSheet(
      minHeight: 0,
      initHeight: 0.3,
      maxHeight: 0.33,
      context: context,
      builder: _buildBottomSheet,
      anchors: [0, 0.3, 0.33],
      isSafeArea: true,
    );
  }

  Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return Material(
      child: Container(
        child: ListView(
          controller: scrollController,
        ),
      ),
    );
  }
}