import 'package:flutter/material.dart';
import 'package:week_of_year/date_week_extensions.dart';

extension CompareDates on DateTime {
  bool isSameDateAs(DateTime other) {
    return this.day == other.day &&
        this.month == other.month &&
        this.year == other.year;
  }

  DateTime addDays(int days) {
    return DateTime(this.year, this.month, this.day + days);
  }
}

class WeeklyDatePicker extends StatefulWidget {
  final DateTime selectedDay;
  final Function(DateTime) changeDay;

  WeeklyDatePicker({
    Key? key,
    required this.selectedDay,
    required this.changeDay,
  }) : super(key: key);

  @override
  _WeeklyDatePickerState createState() => _WeeklyDatePickerState();
}

class _WeeklyDatePickerState extends State<WeeklyDatePicker> {
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
    "Dec"
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: _getInitialPage());
  }

  int _getInitialPage() {
    return (widget.selectedDay.weekOfYear - 1) * 7 +
        widget.selectedDay.weekday -
        1;
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
      color: Colors.transparent, // Adjust the color as needed
      child: PageView.builder(
        controller: _controller,
        onPageChanged: (int index) {
          final int daysToAdd = index - _getInitialPage();
          final DateTime newSelectedDay = widget.selectedDay.addDays(daysToAdd);
          widget.changeDay(newSelectedDay);
        },
        itemBuilder: (_, weekIndex) => _buildWeekCard(weekIndex),
      ),
    );
  }

  Widget _buildWeekCard(int weekIndex) {
    final DateTime startDate = DateTime.now()
        .add(Duration(days: weekIndex * 7 - widget.selectedDay.weekday + 1));
    final DateTime endDate = startDate.add(Duration(days: 7));

    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xff004BB8), // Adjust the color as needed
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.arrow_left_rounded,
                color: Colors.white,
                size: 40,
              ),
              Text(
                  '${startDate.day} ${months[startDate.month]} ${startDate.year}',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          ),
          Text(
            '-',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Row(
            children: [
              Text('${endDate.day} ${months[endDate.month]} ${startDate.year}',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Icon(Icons.arrow_right_rounded, size: 40, color: Colors.white)
            ],
          ),
        ],
      ),
    );
  }
}
