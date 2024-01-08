import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl =
      'http://10.0.2.2:5000'; // Change as needed for production

  // Sign Up
  Future<http.Response> signUp(
      String name,
      String surname,
      String email,
      String password,
      String phoneNumber,
      String gender,
      int age,
      String bloodType,
      String rhFactor) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'surname': surname,
        'email': email,
        'phone_number': phoneNumber,
        'gender': gender,
        'age': age,
        'blood_type': bloodType,
        'rh_factor': rhFactor,
        'password': password
      }),
    );
    return response;
  }

  // Login
  Future<http.Response> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    return response;
  }

  // Get User Profile
  Future<http.Response> getUserProfile(int userId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/user/$userId'),
    );
    return response;
  }

  // Update User Profile
  Future<http.Response> updateUserProfile(
      int userId, Map<String, dynamic> updateData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/api/user/$userId'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(updateData),
    );
    return response;
  }

  // Additional methods can be added here as needed
}
