import 'dart:convert';
import 'package:edumarshals/Model/Event_Model.dart';
import 'package:http/http.dart' as http;

class EventRepository {
  Future<List<EventModel>> fetchEvents() async {
    final response = await http.get(Uri.parse('https://akgec-edu.onrender.com/v1/student/event'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['event'];
      return data.map((e) => EventModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load events');
    }
  }
}
