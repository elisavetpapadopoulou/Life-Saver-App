import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'medical.dart';
import 'assess_breathing.dart';
import 'normal_breathing.dart';
import 'not_breathing.dart';
import 'airway_blocked.dart';

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
              subtitle: Text(
                  'Watch for any movement of the chest. Is the chest rising and falling?'),
            ),
            const ListTile(
              leading: Icon(Icons.hearing, color: Colors.black),
              title: Text('Listen for sounds of Breathing'),
              subtitle: Text(
                  'Normal breathing is typically quiet, but noisy or labored breathing may indicate an issue'),
            ),
            const ListTile(
              leading: Icon(Icons.touch_app, color: Colors.black),
              title: Text('Feel for Airflow'),
              subtitle: Text(
                  'Place your hand on the person’s chest or near their nose and mouth. Can you feel the flow of air, or do you detect any breath on your hand?'),
            ),
            const ListTile(
              leading: Icon(Icons.timer, color: Colors.black),
              title: Text('Check for Normal Breathing Rate'),
              subtitle: Text(
                  'A normal breathing rate for adults is 12 to 20 breaths per minute. Count the number of breaths the person takes in 60 seconds. Is the breathing within the normal range?'),
            ),
            // ... Additional instructions and checks
            const ListTile(
              leading: Icon(Icons.watch, color: Colors.black),
              title: Text('Access Depth and Regularity'),
              subtitle: Text(
                  'Observe the depth and regularity of each breath. Normal breathing is steady and even. Shallow, irregular, or labored breathing may indicate a problem.'),
            ),
            const ListTile(
              leading: Icon(Icons.block, color: Colors.black),
              title: Text('Check their airway'),
              subtitle: Text(
                  'Place the person on their back, lean their head backwards gently from their chin, open their mouth and see if something is blocking their airway.'),
            ),
            buildBreathingAssessmentButton(
              context,
              'They are breathing normally',
              const NormalBreathingPage(), // Replace with the correct page
            ),
            buildBreathingAssessmentButton(
              context,
              'They are not breathing/breathing weakly',
              const NotBreathingPage(), // Replace with the correct page
            ),
            buildBreathingAssessmentButton(
              context,
              'Something is blocking their airway',
              const AirwayBlockedPage(), // Replace with the correct page
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBreathingAssessmentButton(
      BuildContext context, String label, Widget destinationPage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => destinationPage),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white, // Button color
          foregroundColor: Colors.black, // Text color
        ),
        child: Text(label),
      ),
    );
  }
}
