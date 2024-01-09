import 'package:lifesaver/pages/Homepage.dart';
import '../api_service.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../globals.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  final List<String> _genders = [
    'Male',
    'Female',
    'Other'
  ]; // Add gender options
  final List<String> _bloodTypes = [
    'A',
    'B',
    'AB',
    'O'
  ]; // Add blood type options
  final List<String> _rhFactors = ['+', '-']; // Add rh factor options

  String _selectedGender = 'Male'; // Default value
  String _selectedBloodType = 'A'; // Default value
  String _selectedRhFactor = '+'; // Default value

  bool _agreeToTerms = false;
  bool _isLoading = false;

  final ApiService _apiService =
      ApiService(); // Define ApiService instance here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Color.fromARGB(255, 255, 182, 206),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name')),
              TextField(
                  controller: _surnameController,
                  decoration: InputDecoration(labelText: 'Surname')),
              TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true), // Hide password input),
              TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email')),
              TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Phone Number')),
              TextField(
                  controller: _ageController,
                  decoration: InputDecoration(labelText: 'Age')),
              DropdownButtonFormField(
                value: _selectedGender,
                items: _genders.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedGender = newValue!;
                  });
                },
                decoration: InputDecoration(labelText: 'Gender'),
              ),
              DropdownButtonFormField(
                value: _selectedBloodType,
                items: _bloodTypes.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedBloodType = newValue!;
                  });
                },
                decoration: InputDecoration(labelText: 'Blood Type'),
              ),
              DropdownButtonFormField(
                value: _selectedRhFactor,
                items: _rhFactors.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedRhFactor = newValue!;
                  });
                },
                decoration: InputDecoration(labelText: 'Rh Factor'),
              ),
              CheckboxListTile(
                value: _agreeToTerms,
                onChanged: (newValue) {
                  setState(() {
                    _agreeToTerms = newValue ?? false;
                  });
                },
                title: Text("I agree to the Terms of Use"),
              ),
              ElevatedButton(
                child: Text('Create Account'),
                onPressed: _agreeToTerms
                    ? _signup
                    : null, // Disable if not agreed to terms
              ),
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signup() async {
    // Add input validation here if needed
    if (_agreeToTerms && _passwordController.text.length >= 6) {
      setState(() => _isLoading = true);
      try {
        int age = int.tryParse(_ageController.text) ??
            0; // Default to 0 or another appropriate value
        final response = await _apiService.signUp(
            _nameController.text,
            _surnameController.text,
            _emailController.text,
            _passwordController
                .text, // Consider hashing the password in production
            _phoneController.text,
            _selectedGender,
            age,
            _selectedBloodType,
            _selectedRhFactor);

        if (response.statusCode == 200 || response.statusCode == 201) {
          final responseData = json.decode(response.body);
          Global.userId = responseData['user_id'];
          // Navigate to the home page on successful signup
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomepageScreen()),
          );
        } else {
          // Handle errors or unsuccessful signup
          _showDialog(
              'Signup Failed', 'Failed to create account. Please try again.');
        }
      } catch (e) {
        _showDialog('Error', 'An error occurred. Please try again later.');
        print("Signup error: $e");
      } finally {
        setState(() => _isLoading = false);
      }
    } else {
      // Show error if terms not agreed or password too short
      _showDialog(
          'Error', 'Please agree to the terms and check your password.');
    }
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(message),
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
