import 'package:edumarshals/Widget/AttendanceCard.dart';
import 'package:edumarshals/Widget/SubjectAttendanceCard.dart';
import 'package:flutter/material.dart';

import '../Widget/CustomAppBar.dart';

class OverAllAttd extends StatefulWidget {
  const OverAllAttd({super.key});

  @override
  State<OverAllAttd> createState() => _OverAllAttdState();
}

class _OverAllAttdState extends State<OverAllAttd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 255, 251),
      appBar: CustomAppBar(
          userName: 'Vidhi Gupta', userImage: "assets/Ellipse 7.jpg"),
      body: ListView(
        children: [
          Column(
            children: [
              // Container(),
              AttendanceCard(
                  title: "Overall Attendance",
                  description: "including all subjects and labs."),
              Container(
                alignment: Alignment.centerLeft, // Align text to the left
                margin:
                    EdgeInsets.only(left: 16.0), // Add left margin for the text
                child: Text(
                  "All Subject",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SubjectAttendanceCard(
                subjectName: "Mathematics - IV",
                attendedClasses: 60,
                totalClasses: 100,
              ),
              SubjectAttendanceCard(
                  subjectName: "Mathematics - IV",
                  attendedClasses: 90,
                  totalClasses: 100),
              SubjectAttendanceCard(
                  subjectName: "Mathematics - IV",
                  attendedClasses: 80,
                  totalClasses: 100),
              SubjectAttendanceCard(
                  subjectName: "Mathematics - IV",
                  attendedClasses: 70,
                  totalClasses: 100),
              SubjectAttendanceCard(
                  subjectName: "Mathematics - IV",
                  attendedClasses: 90,
                  totalClasses: 100),
              SubjectAttendanceCard(
                  subjectName: "Mathematics - IV",
                  attendedClasses: 90,
                  totalClasses: 100),
            ],
          ),
        ],
      ),
    );
  }
}
