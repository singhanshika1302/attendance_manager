

import 'package:edumarshals/Widget/AttendanceCard.dart';
import 'package:edumarshals/Widget/SubjectAttendanceCard.dart';
import 'package:edumarshals/main.dart';
import 'package:flutter/material.dart';
import 'package:edumarshals/repository/overall_attendance_repository.dart';
import 'package:edumarshals/model/student_attendance_data_model.dart';
// import '../Widget/CustomAppBar.dart';
import 'package:edumarshals/Widget/CustomAppBar.dart';

class OverAllAttd extends StatefulWidget {
  const OverAllAttd({super.key});

  @override
  State<OverAllAttd> createState() => _OverAllAttdState();
}

class _OverAllAttdState extends State<OverAllAttd> {
  final AttendanceRepository _repository = AttendanceRepository();
  List<StudentAttendanceData>? _attendanceDataList;
  int _totalClasses = 0;
  int _totalPresentClasses = 0;

  @override
  void initState() {
    super.initState();
    _fetchAttendanceData();
  }

//.............calling attendance repository ...................................//
  Future<void> _fetchAttendanceData() async {
    List<StudentAttendanceData>? attendanceDataList =
        await _repository.fetchAttendance();
    int totalClasses = 0;
    int totalPresentClasses = 0;
//...............function to store total present and total classes .............//
    if (attendanceDataList != null) {
      for (var data in attendanceDataList) {
        totalClasses += data.totalClasses ?? 0;
        totalPresentClasses += data.totalPresent ?? 0;
      }
    }
    setState(() {
      _attendanceDataList = attendanceDataList;
      _totalClasses = totalClasses;
      print('totalclasses${_totalClasses}');
      // print('totalPresentClasses${_totalPresentClasses}');
      _totalPresentClasses = totalPresentClasses;
      print('totalPresentClasses${_totalPresentClasses}');
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 255, 251),
      appBar: CustomAppBar(
          userName: '${PreferencesManager().name}',
          userImage: "assets/Ellipse 7.jpg"),
      body: ListView(
        children: [
          Column(
            children: [
              // Container(),
//.................. assiging data to the attendace card........................//
              AttendanceCard(
                  title: "Overall Attendance",
                  totalClassess: _totalClasses,
                  attendedClasses: _totalPresentClasses,
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
              Container(
                height: screenHeight * 0.8,
//.................fetching list in which all attendace is stored................//
                child: _attendanceDataList != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: _attendanceDataList!.length,
                              itemBuilder: (context, index) {
                                final attendanceData =
                                    _attendanceDataList![index];
//.......................assigning subject attendace to the SubjectAttendaceCard......//
                                return SubjectAttendanceCard(
                                  subjectName:
                                      'Subject: ${attendanceData.subject}',
                                  attendedClasses: attendanceData.totalPresent!,
                                  totalClasses: attendanceData.totalClasses!,
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    : CircularProgressIndicator(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
