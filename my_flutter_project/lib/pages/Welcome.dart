import 'package:flutter/material.dart';
import 'Signup.dart'; // Make sure to import your signup screen
import 'Login.dart'; // Make sure to import your login screen

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors
          .white, // Set the background color to white or any color you want for the whole screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Create an account',
              style: TextStyle(
                color: Colors.black, // Set the text color that you want
                fontSize: 24,
              ),
            ),
            SizedBox(height: 20), // Space between text and button
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupScreen()));
              },
              child: Text('Sign Up'),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Color.fromARGB(255, 255, 182, 206), // Pink color
              ),
            ),
            SizedBox(height: 12), // Space between buttons
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text('Log in'),
              style: TextButton.styleFrom(
                foregroundColor:
                    Color.fromARGB(255, 255, 182, 206), // Pink color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
