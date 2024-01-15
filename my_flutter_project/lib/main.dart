import 'package:flutter/material.dart';
import 'package:lifesaver/pages/Welcome.dart';
import 'dart:io';
import 'pages/Welcome.dart';

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
