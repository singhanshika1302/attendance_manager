import 'dart:convert';
import 'package:edumarshals/main.dart';
import 'package:http/http.dart' as http;
import 'package:edumarshals/Model/classnotes_Model.dart';

class ClassNotesRepository {
  static const String apiUrl = 'https://akgec-edu.onrender.com/v1/student/classNotes';

  Future<List<ClassNotes>?> fetchClassNotes() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Cookie': 'accessToken=${PreferencesManager().token}'
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        if (data.containsKey('classNotes') && data['classNotes'] is List) {
          final List<dynamic> classNotesData = data['classNotes'];

          final List<ClassNotes>? classNotes = classNotesData
              .map((classNote) => ClassNotes.fromJson(classNote))
              .toList();

          // Print the class notes for debugging
          for (var classNote in classNotes ?? []) {
            print('Subject: ${classNote.subject?.name}');
            print('Classnotes URL: ${classNote.classNotesUrl}');
            print('Teacher: ${classNote.teacher?.name}');
            print('---');
          }

          return classNotes;
        } else {
          throw Exception('Invalid API response structure');
        }
      } else {
        throw Exception('Failed to load class notes: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error during API call: $e');
    }
  }


}