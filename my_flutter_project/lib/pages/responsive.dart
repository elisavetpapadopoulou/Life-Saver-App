import 'package:flutter/material.dart';
import 'Homepage.dart'; 
import 'medical.dart'; 
import 'assess_breathing.dart';

class ResponsivePage extends StatelessWidget {
  const ResponsivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 182, 206), 
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            // Navigate to the HomepageScreen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomepageScreen()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Navigate back to the MedicalPage
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MedicalPage()),
              );
            },
          ),
        ],
        title: const Text('Assess Breathing'),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 182, 206), 
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Check for normal breathing. Is the person breathing normally? Here are a few ways to check:',
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
            const ListTile(
              leading: Icon(Icons.adjust, color: Colors.black),
              title: Text('Look for Chest Movement'),
              subtitle: Text('Watch for any movement of the chest. Is the chest rising and falling?'),
            ),
            const ListTile(
              leading: Icon(Icons.hearing, color: Colors.black),
              title: Text('Listen for sounds of Breathing'),
              subtitle: Text('Normal breathing is typically quiet, but noisy or labored breathing may indicate an issue'),
            ),
            const ListTile(
              leading: Icon(Icons.touch_app, color: Colors.black),
              title: Text('Feel for Airflow'),
              subtitle: Text('Place your hand on the person’s chest or near their nose and mouth. Can you feel the flow of air, or do you detect any breath on your hand?'),
            ),
            const ListTile(
              leading: Icon(Icons.timer, color: Colors.black),
              title: Text('Check for Normal Breathing Rate'),
              subtitle: Text('A normal breathing rate for adults is 12 to 20 breaths per minute. Count the number of breaths the person takes in 60 seconds. Is the breathing within the normal range?'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to the AssessBreathingPage
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AssessBreathingPage()),
                );
              },
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Next'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Button color
                foregroundColor: Colors.black, // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
