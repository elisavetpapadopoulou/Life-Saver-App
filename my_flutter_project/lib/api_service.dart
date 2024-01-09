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
  Future<int?> login(String email, String password) async {
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

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final user = responseData['user'];
      return user[
          'user_id']; // Replace 'user_id' with the actual key used in your API response for the user ID
    }
    return null; // Return null or handle the error as needed
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

  Future<List<String>> fetchUserMedications(int userId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/api/user/$userId/medications'));
    if (response.statusCode == 200) {
      return List<String>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load medications');
    }
  }

  Future<void> addUserMedication(int userId, String medicationName) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/user/$userId/medications'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'name': medicationName}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to add medication');
    }
  }

  Future<void> removeUserMedication(int userId, String medicationName) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/api/user/$userId/medications'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'name': medicationName}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to remove medication');
    }
  }

  Future<List<String>> fetchUserAllergies(int userId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/api/user/$userId/allergies'));
    if (response.statusCode == 200) {
      return List<String>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load medications');
    }
  }

  Future<void> addUserAllergy(int userId, String allergyName) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/user/$userId/allergies'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'name': allergyName}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to add allergy');
    }
  }

  Future<void> removeUserAllergy(int userId, String allergyName) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/api/user/$userId/allergies'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'name': allergyName}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to remove allergy');
    }
  }

  // Additional methods can be added here as needed
}
