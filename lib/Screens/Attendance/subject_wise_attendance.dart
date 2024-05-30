import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:edumarshals/Model/subject_wise_attendance_model.dart';
import 'package:edumarshals/Utils/attendance_list_card.dart';
import 'package:edumarshals/Utils/daily_attendance_card.dart';
import 'package:edumarshals/Utils/floating_action%20_button.dart';
import 'package:edumarshals/Utils/weekly_widget.dart';
import 'package:edumarshals/Widget/AttendanceCard.dart';
import 'package:edumarshals/Widget/CustomAppBar.dart';
import 'package:edumarshals/main.dart';
import 'package:edumarshals/repository/subject_wise_attendance_repo.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:intl/intl.dart';

import '../../Widget/CommonDrawer.dart';

class SubjectWiseAtt extends StatefulWidget {
  final String subjectName;
  final String subjectDescription;

  SubjectWiseAtt({
    super.key,
    required this.subjectName,
    required this.subjectDescription,
  });

  final Color leftBarColor = Color(0xff004BB8);
  final Color rightBarColor = Color(0xff5299FF);
  final Color avgColor = Colors.orange;

  @override
  State<StatefulWidget> createState() => SubjectWiseAttState();
}

enum Month { January, Febuary, March, April, May, June, July, August, Septemer, October, November, December }

extension MonthExtension on Month {
  String get shortName {
    switch (this) {
      case Month.January:
        return 'Jan';
      case Month.Febuary:
        return 'Feb';
      case Month.March:
        return 'Mar';
      case Month.April:
        return 'Apr';
      case Month.May:
        return 'May';
      case Month.June:
        return 'Jun';
      case Month.July:
        return 'Jul';
      case Month.August:
        return 'Aug';
      case Month.Septemer:
        return 'Sep';
      case Month.October:
        return 'Oct';
      case Month.November:
        return 'Nov';
      case Month.December:
        return 'Dec';
      default:
        return '';
    }
  }
}

final _key = GlobalKey<ExpandableFabState>();

class SubjectWiseAttState extends State<SubjectWiseAtt> {
  final GlobalKey<ScaffoldState> scaffoldKey_ = GlobalKey<ScaffoldState>();

  final SubjectWiseAttendanceRepository _repository =
      SubjectWiseAttendanceRepository();
  List<SubjectWiseAttendanceModel>? _attendanceDataList;
  int _totalClasses = 0;
  int _totalPresentClasses = 0;

  final _key = GlobalKey<ExpandableFabState>();
  final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  final double width = 15;
  EasyInfiniteDateTimelineController _dailycontroller =
      EasyInfiniteDateTimelineController();
  DateTime _focusDate = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  DateTime _selectedMonth = DateTime.now();
  DateTime _startOfMonth =
      DateTime(DateTime.now().year, DateTime.now().month, 1);
  DateTime _endOfMonth =
      DateTime(DateTime.now().year, DateTime.now().month + 1, 0);

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;
  String filter = 'Monthly'; // Default filter
  late Map<String, List<Widget>> filterWidgets;
  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    _initFilterWidgets();
    _fetchAttendanceData();
    _initializeBarData();
  }

  void _initializeBarData() {
    final now = DateTime.now();
    final lastSevenMonths = List.generate(7, (index) {
      final month = DateTime(now.year, now.month - index, 1);
      return month;
    }).reversed.toList();

    final items = lastSevenMonths.map((date) {
      final totalClasses = _calculateTotalClassesForMonth(date);
      final attendedClasses = _calculateAttendedClassesForMonth(date);
      return makeGroupData(
          lastSevenMonths.indexOf(date), totalClasses, attendedClasses);
    }).toList();

    rawBarGroups = items;
    showingBarGroups = rawBarGroups;
  }

  double _calculateTotalClassesForMonth(DateTime date) {
    if (_attendanceDataList == null) return 0;

    return _attendanceDataList!.fold(0, (sum, model) {
      if (model.attendance == null) return sum;
      final monthlyTotalClasses = model.attendance!.where((attendance) {
        final attendanceDate = DateTime.parse(attendance.date!);
        return attendanceDate.year == date.year &&
            attendanceDate.month == date.month;
      }).length;
      return sum + monthlyTotalClasses;
    });
  }

  double _calculateAttendedClassesForMonth(DateTime date) {
    if (_attendanceDataList == null) return 0;

    return _attendanceDataList!.fold(0, (sum, model) {
      if (model.attendance == null) return sum;
      final monthlyAttendedClasses = model.attendance!.where((attendance) {
        final attendanceDate = DateTime.parse(attendance.date!);
        return attendanceDate.year == date.year &&
            attendanceDate.month == date.month &&
            attendance.attended == true;
      }).length;
      return sum + monthlyAttendedClasses;
    });
  }

  void _fetchAttendanceData() async {
    try {
      List<SubjectWiseAttendanceModel>? data =
          await _repository.fetchAttendance();
      setState(() {
        _attendanceDataList =
            data?.where((item) => item.subject == widget.subjectName).toList();
        _calculateTotals();
        _updateFilterWidgets();
        _initializeBarData(); // Update the bar data after fetching attendance data
      });
    } catch (error) {
      // Handle error
      print('Error fetching attendance data: $error');
    }
  }

  void _calculateTotals() {
    _totalClasses = _attendanceDataList?.fold(
            0, (sum, item) => sum! + (item.totalClasses ?? 0)) ??
        0;
    _totalPresentClasses = _attendanceDataList?.fold(
            0, (sum, item) => sum! + (item.totalPresent ?? 0)) ??
        0;
  }

  void _updateFilterWidgets() {
    filterWidgets = {
      'Monthly': [
        _buildMonthlyAttendance(),
      ],
      'Weekly': [
        _buildWeeklyWidgets(),
      ],
      'Daily': [
        _buildDailyWidgets(),
      ],
    };
  }

  void _initFilterWidgets() {
    filterWidgets = {
      'Monthly': [
        Center(
          child: CircularProgressIndicator(),
        )
      ],
      'Weekly': [
        Center(
          child: CircularProgressIndicator(),
        )
      ],
      'Daily': [
        Center(
          child: CircularProgressIndicator(),
        )
      ],
    };
  }

  @override
  Widget build(BuildContext context) {
    final sheight = MediaQuery.of(context).size.height;
    final swidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffF2F6FF),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: custom_floating_action_button(
        Gkey: _key,
      ),
      appBar: CustomAppBar(
        userName: PreferencesManager().name,
        userImage: PreferencesManager().studentPhoto,
        onTap: () {
          scaffoldKey_.currentState?.openDrawer();
        },
        scaffoldKey_: scaffoldKey_, // Pass the _scaffoldKey
      ),
      drawer: CommonDrawer(
        scaffoldKey_: scaffoldKey_, currentIndex: 1, // Pass the _scaffoldKey
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AttendanceCard(
                  attendedClasses: _totalPresentClasses,
                  totalClassess: _totalClasses,
                  title: widget.subjectName,
                  description: widget.subjectDescription),
              SizedBox(
                height: sheight * 0.03,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(width: 8),
                  Text("Attendance Chart",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 25)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: sheight * 0.1,
                    width: swidth * 0.25,
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: Color(0xff004BB8),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Total Classes',
                              style: TextStyle(fontSize: 8),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: Color(0xff5299FF),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Classes attended',
                              style: TextStyle(fontSize: 8),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sheight * 0.18,
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
              SizedBox(
                height: sheight * 0.03,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(filter + "\nAttendance",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 25)),
                      Row(
                        children: [
                          SizedBox(
                            height: 35,
                            width: 160,
                            child: DropdownDatePicker(
                              textStyle: TextStyle(fontSize: 12),
                              hintMonth: 'MM',
                              hintYear: 'YYYY',
                              monthFlex: 1,
                              yearFlex: 1,
                              width: 2,
                              hintTextStyle: TextStyle(fontSize: 8),
                              boxDecoration: BoxDecoration(),
                              showDay: false,
                              inputDecoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 2, vertical: 4),
                                border: OutlineInputBorder(),
                              ),
                              isDropdownHideUnderline: true,
                              isFormValidator: true,
                              startYear: DateTime.now().year - 4,
                              endYear: DateTime.now().year,
                              selectedYear: _selectedMonth.year,
                              selectedMonth: _selectedMonth.month,
                              onChangedYear: (value) {
                                if (value != null) {
                                  setState(() {
                                    _selectedMonth = DateTime(
                                        int.parse(value), _selectedMonth.month);
                                    _startOfMonth = DateTime(
                                        _selectedMonth.year,
                                        _selectedMonth.month,
                                        1);
                                    _endOfMonth = DateTime(_selectedMonth.year,
                                        _selectedMonth.month + 1, 0);
                                    _updateFilterWidgets();
                                  });
                                }
                              },
                              onChangedMonth: (value) {
                                if (value != null) {
                                  setState(() {
                                    _selectedMonth = DateTime(
                                        _selectedMonth.year, int.parse(value));
                                    _startOfMonth = DateTime(
                                        _selectedMonth.year,
                                        _selectedMonth.month,
                                        1);
                                    _endOfMonth = DateTime(_selectedMonth.year,
                                        _selectedMonth.month + 1, 0);
                                    _updateFilterWidgets();
                                  });
                                }
                              },
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                showFilter();
                              },
                              icon: Image.asset('assets/filter.png')),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [],
                  ),
                ],
              ),
              SizedBox(
                height: sheight * 0.02,
              ),
              ...(filterWidgets[filter] ?? []).map((widget) => widget).toList(),
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
    final now = DateTime.now();
    // Generate the list of the last seven months
    final lastSevenMonths = List.generate(7, (index) {
      final month = DateTime(now.year, now.month - index, 1);
      return month;
    }).reversed.toList();

    // Get the month and year for the current value
    final currentMonth = lastSevenMonths[value.toInt()];
    final monthShortName = Month.values[currentMonth.month - 1].shortName;
    final year = currentMonth.year.toString().substring(2);

    final Widget text = Text(
      '$monthShortName\'$year',
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 10,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, // margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(
      int x, double totalClasses, double attendedClasses) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: totalClasses,
          color: widget.leftBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: attendedClasses,
          color: widget.rightBarColor,
          width: width,
        ),
      ],
    );
  }

  void showFilter() {
    showFlexibleBottomSheet(
      minHeight: 0,
      initHeight: 0.4,
      maxHeight: 0.41,
      context: context,
      builder: _buildBottomSheet,
      anchors: [0, 0.4, 0.41],
      isSafeArea: true,
    );
  }

  Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    final sheight = MediaQuery.of(context).size.height;
    final swidth = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView(
            controller: scrollController,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "  Attendance",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.cancel_outlined),
                  )
                ],
              ),
              Text(
                "Time",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              CustomRadioButton(
                enableShape: true,
                unSelectedBorderColor: Color(0xff004BB8),
                buttonTextStyle: ButtonTextStyle(
                    selectedColor: Colors.white,
                    unSelectedColor: Color(0xff004BB8),
                    textStyle:
                        TextStyle(fontSize: 14, color: Color(0xff004BB8))),
                radioButtonValue: (value) {
                  setFilter(value);
                },
                selectedColor: Color(0xff004BB8),
                buttonLables: [
                  'Monthly',
                  'Weekly',
                  'Daily',
                ],
                buttonValues: [
                  'Monthly',
                  'Weekly',
                  'Daily',
                ],
                defaultSelected: filter,
                horizontal: false,
                enableButtonWrap: false,
                height: 36,
                padding: 6,
                selectedBorderColor: Color(0xff004BB8),
                unSelectedColor: Colors.white,
              ),
              SizedBox(
                height: sheight * 0.03,
              ),
              Text(
                "Absence/Presence",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              CustomCheckBoxGroup(
                enableShape: true,
                unSelectedBorderColor: Color(0xff004BB8),
                buttonTextStyle: ButtonTextStyle(
                    selectedColor: Colors.white,
                    unSelectedColor: Color(0xff004BB8),
                    textStyle: TextStyle(fontSize: 14)),
                unSelectedColor: Theme.of(context).canvasColor,
                buttonLables: [
                  "Absent",
                  "Present",
                ],
                buttonValuesList: [
                  "Absent",
                  "Present",
                ],
                checkBoxButtonValues: (values) {
                  print(values);
                },
                spacing: 12,
                defaultSelected: ["Present", "Absent"],
                horizontal: false,
                enableButtonWrap: false,
                selectedColor: Color(0xff004BB8),
                padding: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                      width: swidth * 0.3,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Color(0xff004BB8)),
                              foregroundColor:
                                  MaterialStatePropertyAll(Colors.white)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Apply"))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setFilter(String value) {
    setState(() {
      filter = value;
      _updateFilterWidgets();
    });
  }

  Widget _buildDailyWidgets() {
    List<SWAttendance>? dailyData = _attendanceDataList
        ?.expand((model) => model.attendance ?? [])
        .where((item) =>
            item is SWAttendance &&
            item.date == _focusDate.toIso8601String().split('T').first)
        .cast<SWAttendance>()
        .toList();

    return Column(
      children: [
        EasyInfiniteDateTimeLine(
          dayProps: EasyDayProps(
            dayStructure: DayStructure.dayNumDayStr,
            height: 38,
            width: 60,
            inactiveDayStyle: DayStyle(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              dayNumStyle: TextStyle(
                color: Color(0xff004BB8),
                fontWeight: FontWeight.w500,
              ),
              dayStrStyle: TextStyle(
                color: Color(0xff004BB8),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          controller: _dailycontroller,
          activeColor: Color(0xff004BB8),
          firstDate: _startOfMonth,
          focusDate: _focusDate,
          lastDate: _endOfMonth,
          showTimelineHeader: false,
          onDateChange: (selectedDate) {
            setState(() {
              _focusDate = selectedDate;
              _updateFilterWidgets();
            });
          },
        ),
        SizedBox(
          height: 15,
        ),
        if (dailyData == null || dailyData.isEmpty)
          Center(
            child: Text("No attendance data available for this date"),
          )
        else
          DailyAttendanceListCard(
            date: parseAndFormatDate(
              _focusDate.toIso8601String().split('T').first,
            ), // Formatted date
            isPresent: dailyData.map((e) => e.attended ?? false).toList(),
          ),
      ],
    );
  }

  Widget _buildWeeklyWidgets() {
    DateTime startOfWeek =
        _selectedDay.subtract(Duration(days: _selectedDay.weekday - 1));
    DateTime endOfWeek = startOfWeek.add(Duration(days: 6));
    List<SWAttendance>? weeklyData = _attendanceDataList
        ?.expand((model) => model.attendance ?? [])
        .where((item) =>
            item is SWAttendance &&
            item.date != null &&
            DateTime.parse(item.date!)
                .isAfter(startOfWeek.subtract(Duration(days: 1))) &&
            DateTime.parse(item.date!)
                .isBefore(endOfWeek.add(Duration(days: 1))))
        .cast<SWAttendance>()
        .toList();

    return Column(
      children: [
        WeeklyDatePicker(
          selectedWeek: _selectedDay,
          changeWeek: (value) => setState(() {
            _selectedDay = value;
            _updateFilterWidgets();
          }),
        ),
        if (weeklyData == null || weeklyData.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: Text("No attendance data available for this week"),
            ),
          )
        else
          ...weeklyData.map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: AttendanceListCard(
                  date: parseAndFormatDate(item.date!), // Formatted date
                  isPresent: [item.attended ?? false],
                ),
              )),
      ],
    );
  }

  Widget _buildMonthlyAttendance() {
    List<SWAttendance>? monthlyData = _attendanceDataList
        ?.expand((model) => model.attendance ?? [])
        .where((item) =>
            item is SWAttendance &&
            item.date != null &&
            DateTime.parse(item.date!).isAfter(_startOfMonth) &&
            DateTime.parse(item.date!).isBefore(_endOfMonth))
        .cast<SWAttendance>()
        .toList();

    if (monthlyData == null || monthlyData.isEmpty) {
      return Center(child: Text("No attendance data available for this month"));
    }

    return Column(
      children: [
        ...monthlyData.map((item) => AttendanceListCard(
            date: parseAndFormatDate(item.date!), // Formatted date
            isPresent: [item.attended ?? false])),
      ],
    );
  }

  String parseAndFormatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }
}