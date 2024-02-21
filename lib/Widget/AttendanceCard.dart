import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AttendanceCard extends StatelessWidget {
  final String title;
  final String description;
  final Color color;

  const AttendanceCard({super.key, 
    required this.title,
    required this.description,
    this.color = const Color.fromRGBO(0, 75, 184, 1),
  });

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(width: 16.0), // Add some spacing between text and circular indicator
          CircularPercentIndicator(
            radius: 40.0,
            lineWidth: 15.0,
            percent: 0.8,
            // header: Text("Icon header"),
            center: const Text("80",style: TextStyle(color: Colors.white),),
            backgroundColor: const Color.fromRGBO(0, 75, 184, 1),
            progressColor: const Color.fromARGB(255, 66, 231, 0),
          ),
        ],
      ),
    );
  }
}