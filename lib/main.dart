import 'package:flutter/material.dart';
import 'package:lifesaver/pages/Welcome.dart';
import 'pages/Homepage.dart'; // Import your newly created file
import 'pages/Signup.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
    );
  }
}
