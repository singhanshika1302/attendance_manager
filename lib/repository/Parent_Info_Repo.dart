import 'dart:convert';
import 'package:edumarshals/main.dart';
import 'package:http/http.dart' as http;

class ParentInfoRepository {
  final String apiUrl;

  ParentInfoRepository(this.apiUrl);

  Future<Map<String, dynamic>> fetchParentInfo(String token) async {
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
        throw Exception('Failed to load parent info: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load parent info: $e');
    }
  }
}
