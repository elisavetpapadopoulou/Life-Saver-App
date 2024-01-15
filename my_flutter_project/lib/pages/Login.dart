import 'package:flutter/material.dart';
import 'package:lifesaver/pages/Homepage.dart';
import '../api_service.dart'; // Replace with the correct path to your ApiService
import '../globals.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  final ApiService _apiService = ApiService(); // Initialize your ApiService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
        backgroundColor: Color.fromARGB(255, 255, 182, 206), // Pink color
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true, // This ensures the password is hidden
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed:
                    _isLoading ? null : _login, // Disable button when loading
                child: Text('Log In'),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color.fromARGB(255, 255, 182, 206), // Button color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });
// Perform the API call for login
    try {
      final response = await _apiService.login(
        _emailController.text,
        _passwordController.text,
      );
// Handle the response accordingly
      if (response != null) {
        Global.userId = response;
        // Navigate to the home screen if successful
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>
              HomepageScreen(), // Replace with your homepage widget
        ));
      } else {
        // Show error message
        throw Exception('Failed to load user profile');
      }
    } catch (e) {
      // Handle errors in catching network & JSON parsing
      print(e.toString());
      // Show error message
      _showDialog('Login Failed', 'Failed to login. Please try again.');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
