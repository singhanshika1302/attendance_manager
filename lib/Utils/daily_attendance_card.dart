import 'package:flutter/material.dart';

class DailyAttendanceListCard extends StatefulWidget {
  final String date;
  final List<bool> isPresent;

  DailyAttendanceListCard(
      {Key? key, required this.date, required this.isPresent})
      : super(key: key);

  @override
  State<DailyAttendanceListCard> createState() =>
      _DailyAttendanceListCardState();
}

class _DailyAttendanceListCardState extends State<DailyAttendanceListCard> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6.0, // Adjust the spacing between cards as needed

      children: List.generate(
        widget.isPresent.length,
        (index) {
          var n = index + 1;
          String num = n.toString();
          return Card(
            color: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Lecture ' + num,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    widget.isPresent[index] ? "Present" : "Absent",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: widget.isPresent[index]
                          ? Color(0xff00CE46)
                          : Color(0xffF75757),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
