import 'dart:convert';
import 'package:edumarshals/Model/Subject_Model.dart';
import 'package:edumarshals/main.dart';
import 'package:http/http.dart' as http;

class SubjectRepository {
  final String apiUrl = 'https://akgec-edu.onrender.com/v1/student/subject';

Future<List<Subject>> fetchSubjects() async {
  final response = await http.get(
    Uri.parse(apiUrl),
    headers: {'Cookie': 'accessToken=${PreferencesManager().token}'},
  );
  print('Response Body: ${response.body}');
  print('Response Status Code: ${response.statusCode}');
  print('Access Token: ${PreferencesManager().token}');
  print('hgfd');
  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    if (responseData['subject'] != null) {
      Iterable subjectsJson = responseData['subject'];
      return subjectsJson.map((subjectJson) => Subject.fromJson(subjectJson)).toList();
    } else {
      throw Exception('No subjects found in response');
    }
  } else {
    throw Exception('Failed to load subjects: ${response.statusCode}');
  }
}



}

// Create repositories for other subjects as needed...
