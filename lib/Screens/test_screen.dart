import 'package:flutter/material.dart';
import 'package:edumarshals/repository/overall_attendance_repository.dart';
import 'package:edumarshals/model/student_attendance_data_model.dart';

class AttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  final AttendanceRepository _repository = AttendanceRepository();
  List<StudentAttendanceData>? _attendanceDataList;
  int _totalClasses = 0;
  int _totalPresentClasses = 0;

  @override
  void initState() {
    super.initState();
    _fetchAttendanceData();
  }

  Future<void> _fetchAttendanceData() async {
    List<StudentAttendanceData>? attendanceDataList =
        await _repository.fetchAttendance();
    int totalClasses = 0;
    int totalPresentClasses = 0;

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
      ),
      body: Center(
        child: _attendanceDataList != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Total Classes: $_totalClasses'),
                  Text('Total Present Classes: $_totalPresentClasses'),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _attendanceDataList!.length,
                      itemBuilder: (context, index) {
                        final attendanceData = _attendanceDataList![index];
                        return ListTile(
                          title: Text('Subject: ${attendanceData.subject}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Total Classes: ${attendanceData.totalClasses}'),
                              Text(
                                  'Total Present: ${attendanceData.totalPresent}'),
                              
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
