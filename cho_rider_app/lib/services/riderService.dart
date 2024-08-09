// ignore: file_names
import 'dart:convert';
// ignore: depend_on_referenced_packages
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

    // Print the response details for debugging
    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      print("Successful login");
      final Map<String, dynamic> data = jsonDecode(response.body);
      return Rider.fromMap(data);
    } else {
      print('Failed to login: ${response.statusCode}');
      return null;
    }
  }

  // Get rider by ID
  Future<Rider?> getRiderById(String id) async {
    final url = Uri.parse('$baseUrl/riders/$id');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': apiKey,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return Rider.fromMap(data);
    } else {
      print('Failed to fetch rider: ${response.statusCode}');
      return null;
    }
  }

  // Update rider
  Future<bool> updateRider(Rider rider) async {
    final url = Uri.parse('$baseUrl/riders/${rider.id}');
    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': apiKey,
      },
      body: jsonEncode(rider.toMap()),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print('Failed to update rider: ${response.statusCode}');
      return false;
    }
  }

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
