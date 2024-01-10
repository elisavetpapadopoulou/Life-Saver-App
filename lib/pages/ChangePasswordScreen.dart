import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'package:lifesaver/api_service.dart'; // Import your ApiService
import '../globals.dart'; // Import global variables if needed

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final ApiService _apiService = ApiService(); // ApiService instance

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  void _changePassword() async {
    String oldPassword = _oldPasswordController.text;
    String newPassword = _newPasswordController.text;

    // Check if the new password is different from the old password
    if (oldPassword == newPassword) {
      _showSnackBar("New password cannot be the same as the old password.");
      return;
    }

    // Call your API service to change the password
    final response = await _apiService.changePassword(
        Global.userId, oldPassword, newPassword);

    if (response.statusCode == 200) {
      _showSnackBar("Password changed successfully.");
      Navigator.pop(context);
    } else {
      _showSnackBar("Failed to change password. Error: ${response.statusCode}");
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _cancel() {
    Navigator.pop(context); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomepageScreen()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 255, 182, 206),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, 
          children: <Widget>[
            TextField(
              controller: _oldPasswordController,
              decoration: InputDecoration(
                labelText: 'Insert old password',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => _oldPasswordController.clear(),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _newPasswordController,
              decoration: InputDecoration(
                labelText: 'Insert new password',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => _newPasswordController.clear(),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Save'),
              onPressed: _changePassword,
              style: ElevatedButton.styleFrom(
                primary: Colors.purple, 
                onPrimary: Colors.white, 
              ),
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: _cancel,
            ),
          ],
        ),
      ),
    );
  }
}

