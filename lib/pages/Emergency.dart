import 'package:flutter/material.dart';
import 'package:lifesaver/pages/Homepage.dart';
import 'Injury.dart';

class EmergencyTypeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
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
              'What Type of Emergency is it?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Please answer the questions the best you can. If not possible, press the emergency call icons below',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Card(
              elevation: 2,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Medical (e.g., heart attack)'),
                    onTap: () {
                      //
                    },
                  ),
                  ListTile(
                    title: Text('Injury (e.g., bleeding, fractures)'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InjuryTypeScreen()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Allergic reaction'),
                    onTap: () {
                      // Handle Allergic reaction selection
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
