import 'dart:convert';

import 'package:edumarshals/Model/student_attendance_data_model.dart';
import 'package:edumarshals/main.dart';
import 'package:http/http.dart' as http;
// import 'package:edumarshals/modules/student_attendance_data_model.dart';

//..............repository to call the Attendance Api through Model Structure ............//

class AttendanceRepository {
  static const String apiUrl =
      'https://akgec-edu.onrender.com/v1/student/attendance';


  Future<List<StudentAttendanceData>?> fetchAttendance() async {
    try {
      final response = await http.get(Uri.parse(apiUrl),
//............. giving AccessToken through Cookie to the GET API.........................//      
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Cookie': 'accessToken=${PreferencesManager().token}'
          });
      if (response.statusCode == 200) {
        print('api intigrated successfully');

        final List<dynamic> jsonData = jsonDecode(response.body);
        final List<StudentAttendanceData> attendanceList = jsonData
            .map((data) => StudentAttendanceData.fromJson(data))
            .toList();
  attendanceList.forEach((attendanceData) {
        print('Student ID: ${attendanceData.totalClasses}');
        print('Attendance Date: ${attendanceData.totalPresent}');
         print('Attendance Date: ${attendanceData.attendance}');         
        // Print other properties as needed
                // printAttendanceData(attendanceList);

      });
        return attendanceList;
        
      } else {
        print('Failed to load data. Status Code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error during API call: $e');
      return null;
    }
  }
}
 void printAttendanceData(List<StudentAttendanceData> data) {
    data.forEach((attendanceData) {
      print('Subject: ${attendanceData.subject}');
      print('Total Classes: ${attendanceData.totalClasses}');
      print('Total Present: ${attendanceData.totalPresent}');
      print('Attendance:');
      attendanceData.attendance?.forEach((entry) {
        print('  Date: ${entry.date}');
        print('  Attended: ${entry.attended}');
        print('  Is Academic: ${entry.isAc}');
      });
      print('\n');
    });
  }

