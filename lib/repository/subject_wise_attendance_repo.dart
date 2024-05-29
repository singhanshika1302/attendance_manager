// attendance_repository.dart
import 'dart:convert';
import 'package:edumarshals/Model/subject_wise_attendance_model.dart';
import 'package:edumarshals/Screens/Attendance/subject_wise_attendance.dart';
import 'package:edumarshals/main.dart';
import 'package:http/http.dart' as http;

class SubjectWiseAttendanceRepository {
  static const String apiUrl =
      'https://akgec-edu.onrender.com/v1/student/attendance';

  Future<List<SubjectWiseAttendanceModel>?> fetchAttendance() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Cookie': 'accessToken=${PreferencesManager().token}',
        },
      );
      if (response.statusCode == 200) {
        print('API integrated successfully');

        final List<dynamic> jsonData = jsonDecode(response.body);
        final List<SubjectWiseAttendanceModel> attendanceList = jsonData
            .cast<Map<String, dynamic>>() 
            .map<SubjectWiseAttendanceModel>(
                (data) => SubjectWiseAttendanceModel.fromJson(data))
            .toList();

        printAttendanceData(attendanceList);
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

  void printAttendanceData(List<SubjectWiseAttendanceModel> data) {
    data.forEach((attendanceData) {
      print(attendanceData);
    });
  }
}