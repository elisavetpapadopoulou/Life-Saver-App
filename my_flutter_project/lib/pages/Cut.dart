import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'Bleeding.dart';
import 'NotBleeding.dart';

class CutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Color.fromARGB(255, 255, 182, 206),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomepageScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Bleeding',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Is the cut actively bleeding?',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Card(
              elevation: 2,
              child: Column(
                children: [
                  _buildListButton(context, 'It is', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BleedingScreen()),
                    );
                  }),
                  _buildListButton(context, 'It’s not', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotBleedingScreen()),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListButton(
      BuildContext context, String label, VoidCallback onTap) {
    return ListTile(
      title: Text(label),
      onTap: onTap,
    );
  }
}
