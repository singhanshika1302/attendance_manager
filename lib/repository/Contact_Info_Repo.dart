import 'dart:convert';
import 'package:edumarshals/main.dart';
import 'package:http/http.dart' as http;

class ContactInfoRepository {
  final String apiUrl;

  ContactInfoRepository(this.apiUrl);

  Future<Map<String, dynamic>> fetchContactInfo(String token) async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Cookie': 'accessToken=${PreferencesManager().token}', // Add the token to the cookies header
        },
      );
      if (response.statusCode == 200) {
        print(response.statusCode);
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load Contact info: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load Contact info: $e');
    }
  }
}
