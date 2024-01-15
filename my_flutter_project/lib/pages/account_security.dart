import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'ChangePasswordScreen.dart'; 

class AccountSecurityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accounts Security'),
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
      body: ListTile(
        title: Text('Change Password'),
        leading: Icon(Icons.lock),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
          );
        },
      ),
    );
  }
}
