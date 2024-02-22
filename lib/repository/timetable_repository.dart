import 'package:edumarshals/main.dart';
import 'package:flutter/material.dart';
import 'package:edumarshals/modules/time_table_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
//...............repository for intigrating the timetable Get Api..................//
class ExamTimetableRepository {
  static const String apiUrl =
      'https://akgec-edu.onrender.com/v1/student/exam/timetable';
  static  String token = '${PreferencesManager().token}';

  Future<String?> fetchExamTimetable() async {
    try {
      var request = http.Request('GET', Uri.parse(apiUrl));
//..............accessToken is send inside the cookie of the header ....which is stored in PreferencesManager.............//
      request.headers['Cookie'] = 'accessToken=$token'; 
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        return await response.stream.bytesToString();
      } else {
        print('Failed to load data. Status Code: ${response.statusCode}');
        print('Reason: ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      print('Error during API call: $e');
      return null;
    }
  }
}


