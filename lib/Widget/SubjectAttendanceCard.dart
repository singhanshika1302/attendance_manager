import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SubjectAttendanceCard extends StatelessWidget {
  final String subjectName;
  final int attendedClasses;
  final int totalClasses;

  const SubjectAttendanceCard({super.key, 
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
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5.0,
              spreadRadius: 2.0,
              offset: const Offset(0, 2),
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
                    style: GoogleFonts.roboto(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                     
                      color: Color.fromARGB(255, 0, 0, 0),
                    )
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Attendance: $attendedClasses / $totalClasses',
                    style: GoogleFonts.roboto(fontSize: 14)
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16.0),
            CircularPercentIndicator(
              radius: 30.0,
              lineWidth: 10.0,
              percent: attendancePercentage / 100,
              center: Text(
                '${attendancePercentage.toStringAsFixed(1)}%',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              backgroundColor: Colors.white,
              progressColor: const Color.fromARGB(255, 22, 192, 28),
            ),
          ],
        ),
      ),
    );
  }
}
