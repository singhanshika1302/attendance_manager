import 'package:flutter/material.dart';
import 'package:week_of_year/date_week_extensions.dart';

extension CompareDates on DateTime {
  bool isSameDateAs(DateTime other) {
    return this.day == other.day &&
        this.month == other.month &&
        this.year == other.year;
  }

  DateTime addDays(int days) {
    return this.add(Duration(days: days));
  }
}

class WeeklyDatePicker extends StatefulWidget {
  final DateTime selectedWeek;
  final Function(DateTime) changeWeek;

  WeeklyDatePicker({
    Key? key,
    required this.selectedWeek,
    required this.changeWeek,
  }) : super(key: key);

  @override
  _WeeklyDatePickerState createState() => _WeeklyDatePickerState();
}

class _WeeklyDatePickerState extends State<WeeklyDatePicker> {
  late DateTime _currentStartDate;
  final DateTime _todaysDateTime = DateTime.now();
  late final PageController _controller;
  List months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: _getInitialPage());
    _currentStartDate = _getStartDateForWeek(widget.selectedWeek);
  }

  int _getInitialPage() {
    return widget.selectedWeek.weekOfYear - 1;
  }

  DateTime _getStartDateForWeek(DateTime date) {
    int daysToSubtract =
        date.weekday - 1; // Monday as the first day of the week
    return DateTime(date.year, date.month, date.day - daysToSubtract);
  }

  void _onArrowTapped(int daysToAdd) {
    setState(() {
      _currentStartDate = _currentStartDate.addDays(daysToAdd);
      widget.changeWeek(_currentStartDate);
      _controller.jumpToPage(_controller.page!.toInt() + daysToAdd ~/ 7);
    });
  }

  void updateSelectedDate(DateTime newDate) {
    setState(() {
      _currentStartDate = _getStartDateForWeek(newDate);
      _controller.jumpToPage(_getInitialPage());
      widget.changeWeek(_currentStartDate);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xff004BB8),
              ),
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (int index) {
                  final int weeksToAdd = (index - _getInitialPage()) * 7;
                  setState(() {
                    _currentStartDate =
                        _getStartDateForWeek(widget.selectedWeek)
                            .addDays(weeksToAdd);
                    widget.changeWeek(_currentStartDate);
                  });
                },
                itemBuilder: (_, weekIndex) {
                  return _buildWeekCard(weekIndex - _getInitialPage());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeekCard(int weekOffset) {
    final DateTime startDate = _currentStartDate.addDays(weekOffset * 7);
    final DateTime endDate = startDate.addDays(6);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => _onArrowTapped(-7),
          icon: Icon(
            Icons.arrow_left_rounded,
            color: Colors.white,
            size: 40,
          ),
        ),
        Text(
          '${startDate.day} ${months[startDate.month - 1]} ${startDate.year}',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          '-',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          '${endDate.day} ${months[endDate.month - 1]} ${startDate.year}',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        IconButton(
          onPressed: () => _onArrowTapped(7),
          icon: Icon(
            Icons.arrow_right_rounded,
            color: Colors.white,
            size: 40,
          ),
        ),
      ],
    );
  }
}