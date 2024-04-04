import 'dart:convert';
import 'package:edumarshals/main.dart';
import 'package:http/http.dart' as http;
import 'package:edumarshals/Model/assignment_Model.dart';

class AssignmentRepository {
  static const String apiUrl = 'https://akgec-edu.onrender.com/v1/student/assignment';

  Future<List<Assignment>> fetchAssignments() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Cookie': 'accessToken=${PreferencesManager().token}'
        },
      );

      if (response.statusCode == 200) {
        print('repository successfully intigrated${response.statusCode}');
        final Map<String, dynamic> data = json.decode(response.body);
        final assignmentModel = assignment_Model.fromJson(data);

        return assignmentModel.assignment ?? [];
      } else {
        print('Failed to load assignments: ${response.statusCode}');
        // Instead of returning null, throw an exception or return an empty list.
        throw Exception('Failed to load assignments: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during API call: $e');
      // Instead of returning null, throw an exception or return an empty list.
      throw Exception('Error during API call: $e');
    }
    // You can add other methods for posting, updating, or deleting assignments if needed.
  }
}
