import 'package:flutter/material.dart';
import 'pages/Homepage.dart'; // Import your newly created file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomepageScreen(),
    );
  }
}
