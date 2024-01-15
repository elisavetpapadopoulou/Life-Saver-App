import 'dart:convert';
import '../globals.dart';
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
      return user['user_id']; 
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

  Future<void> deleteAccount(int userId) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/api/user/$userId'), 
    );

    if (response.statusCode == 200) {
      // Account deleted successfully
      // You may want to clear user data and navigate to a login screen or perform other actions
    } else {
      // Handle errors and show feedback to the user
      print('Failed to delete account. Status code: ${response.statusCode}');
    }
  }


    // Change User Password
  Future<http.Response> changePassword(int userId, String oldPassword, String newPassword) async {
    final response = await http.put(
      Uri.parse('$baseUrl/api/user/$userId/change-password'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'oldPassword': oldPassword,
        'newPassword': newPassword,
      }),
    );
    return response;
  }

  Future<int> fetchUserPoints(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/api/user/$userId/points'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final points = jsonData['points']; // Replace 'points' with your API response key
      return points;
    }
    return 0; // Return 0 if there's an error
  }

  Future<String> fetchUserBadge(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/api/user/$userId/badge'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final badgeName = jsonData['badge']; // Replace 'badge' with your API response key
      return badgeName;
    }
    return 'No Badge'; // Return 'No Badge' if there's an error
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

  Future<List<Article>> fetchAllArticles() async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/articles'), // Replace with your API endpoint
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<Article> loadedArticles = [];

      jsonData.forEach((articleData) {
        loadedArticles.add(Article.fromJson(articleData));
      });

      return loadedArticles;
    } else {
      throw Exception('Failed to load articles');
    }
  }

  Future<bool> finishArticle(int userId, int articleId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/articles/$articleId/finish'),
      body: json.encode({'user_id': userId}),
      headers: {'Content-Type': 'application/json'},
    );
    return response.statusCode == 200;
  }

  Future<List<Article>> fetchReadArticles(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/api/read-articles/$userId'));
    if (response.statusCode == 200) {
      List<dynamic> articlesJson = json.decode(response.body);
      return articlesJson.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load read articles. Status code: ${response.statusCode}');
    }
  }
}

class Article {
  final int articleId;
  final String title;
  final String content;
  final String datePublished;

  Article({
    required this.articleId,
    required this.title,
    required this.content,
    required this.datePublished,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      articleId: json['article_id'],
      title: json['title'],
      content: json['content'],
      datePublished: json['date_published'],
    );
  }
}

