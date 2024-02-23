import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AttendanceCard extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  final int attendedClasses;
  final int totalClassess;

  const AttendanceCard({super.key, 
    required this.title,
    required this.description,
    required this.attendedClasses,
    required this.totalClassess,
    this.color = const Color.fromRGBO(0, 75, 184, 1),
  });

  @override
  Widget build(BuildContext context) {
    double attendancePercentage = (attendedClasses / totalClassess) * 100;
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  softWrap: true,
                ),
                const SizedBox(height: 8.0),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  softWrap: true,
                ),
              ],
            ),
          ),
          SizedBox(
              width:
                  16.0), // Add some spacing between text and circular indicator
          CircularPercentIndicator(
            radius: 40.0,
            lineWidth: 15.0,
            percent: attendancePercentage / 100,
            // header: Text("Icon header"),
            center: Text(
              '${attendancePercentage.toStringAsFixed(1)}',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: const Color.fromRGBO(0, 75, 184, 1),
            progressColor: const Color.fromARGB(255, 66, 231, 0),
          ),
        ],
      ),
    );
  }
}
