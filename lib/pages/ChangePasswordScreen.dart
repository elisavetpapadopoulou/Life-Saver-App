import 'package:flutter/material.dart';
import 'Homepage.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  void _changePassword() {
    // Implement the logic to change the password
    // This usually involves validating the old password against your backend
    // and then updating to the new password if the old password is correct
    // Finally, give the user feedback about the password change (success or failure)
    Navigator.pop(context); // This would typically happen after a successful password change
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
