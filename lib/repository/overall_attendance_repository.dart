import 'package:edumarshals/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:edumarshals/model/student_attendance_data_model.dart';

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
