import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SubjectAttendanceCard extends StatelessWidget {
  final String subjectName;
  final int attendedClasses;
  final int totalClasses;

  SubjectAttendanceCard({
    required this.subjectName,
    required this.attendedClasses,
    required this.totalClasses,
  });

  @override
  Widget build(BuildContext context) {
    double attendancePercentage = (attendedClasses / totalClasses) * 100;

    return InkWell(
      onTap: () {
        // Handle the tap event
      },
      child: Container(
        margin: EdgeInsets.all(16.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5.0,
              spreadRadius: 2.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subjectName,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Attendance: $attendedClasses / $totalClasses',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.0),
            CircularPercentIndicator(
              radius: 30.0,
              lineWidth: 10.0,
              percent: attendancePercentage / 100,
              center: Text(
                '${attendancePercentage.toStringAsFixed(1)}%',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              backgroundColor: Colors.white,
              progressColor: Color.fromARGB(255, 22, 192, 28),
            ),
          ],
        ),
      ),
    );
  }
}
