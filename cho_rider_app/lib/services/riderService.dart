import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/rider.dart';

class RiderService {
  final String baseUrl;
  final String apiKey;

  RiderService()
      : baseUrl = dotenv.env['BASE_URL'] ?? '',
        apiKey = dotenv.env['API_KEY'] ?? '';

  // Rider login
  Future<Rider?> login(String name, String password) async {
    final url = Uri.parse('$baseUrl/api/rider/login');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': apiKey,
      },
      body: jsonEncode({
        'name': name,
        'password': password,
      }),
    );

    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      // Check if the response contains rider data
      if (data.containsKey('rider')) {
        return Rider.fromMap(data['rider']);
      } else {
        print('Login response does not contain rider data.');
        return null;
      }
    } else {
      print('Failed to login: ${response.statusCode}');
      return null;
    }
  }

  // Save rider ID
  Future<void> saveRiderId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('riderId', id);
  }

  // Get rider ID
  Future<String?> getRiderId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('riderId');
  }
}
