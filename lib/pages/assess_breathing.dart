import 'package:flutter/material.dart';
import 'Homepage.dart'; // Make sure this import points to the correct location
import 'medical.dart'; 
import 'normal_breathing.dart';
import 'not_breathing.dart';
import 'airway_blocked.dart';


class AssessBreathingPage extends StatelessWidget {
  const AssessBreathingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 182, 206),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Navigate back to the MedicalPage
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MedicalPage()),
              );
            },
          
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
          onPressed: () {
            // Navigate to the HomepageScreen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomepageScreen()),
            );
          },
          ),
        ],
        title: const Text('Assess Breathing'),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 182, 206),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Check for normal breathing. Is the person breathing normally? Here are a few ways to check:',
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
            // ... Additional instructions and checks
            const Text(
              'Access Depth and Regularity',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            const Text(
              'Observe the depth and regularity of each breath. Normal breathing is steady and even. Shallow, irregular, or labored breathing may indicate a problem.',
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Check their airway',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            const Text(
              'Place the person on their back, lean their head backwards gently from their chin, open their mouth and see if something is blocking their airway.',
            ),
            const SizedBox(height: 20.0),
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

  Widget buildBreathingAssessmentButton(BuildContext context, String label, Widget destinationPage) {
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
