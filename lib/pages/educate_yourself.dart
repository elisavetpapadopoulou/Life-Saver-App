import 'package:flutter/material.dart';
import 'articles_screen.dart';

class EducationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 182, 206), // Pink color
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black), // Black back icon
          onPressed: () {
            // When the back button is pressed, pop the current screen
            Navigator.pop(context);
          },
        ),
        title: const Text('Educate Yourself!'), 

        elevation: 0, // No shadow
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Chip(
                label: const Text(
                  'My points: 23',
                  style: TextStyle(fontWeight: FontWeight.bold), 
                ),
                backgroundColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Handle recent articles action
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ArticlesScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, primary: Colors.purple, // Text color
              ),
              child: const Text('Recent Articles'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle read again action
              },
              child: const Text('Read Again'),
              style: ElevatedButton.styleFrom(
                primary: Colors.purple, // Button color
                onPrimary: Colors.white, // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
