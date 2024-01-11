import 'package:flutter/material.dart';
import 'Homepage.dart'; // Make sure this import points to the correct location
import 'normal_breathing.dart'; // Make sure this import points to the correct location

class SignsOfLifePage extends StatelessWidget {
  const SignsOfLifePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop()),
        backgroundColor: const Color.fromARGB(255, 255, 182, 206),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const HomepageScreen()),
            ),
          ),
        ],
        title: const Text('Check for Signs of Life'),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 182, 206),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Check for Signs of Life',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'While waiting for emergency services, check for any signs of life. Look for movement, breathing, or any other indications of consciousness or responsiveness',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Text(
              'Monitor Vital Signs',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Continue to monitor the person\'s breathing and other vital signs. Be prepared to provide updated information to emergency services',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Text(
              'Stay with the Person',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Stay with the person and provide comfort. Continue to reassure them while waiting for professional help to arrive.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
