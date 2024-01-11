import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'medical.dart'; // Replace with the actual path if necessary
import 'unnormal_breathing.dart'; // Replace with the actual path if necessary
import 'unnot_breathing.dart'; // Replace with the actual path if necessary

class UnresponsivePage extends StatelessWidget {
  const UnresponsivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const MedicalPage()),
          ),
        ),
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
        title: const Text('Assess Breathing'),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 182, 206),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Great, let\'s check the person\'s breathing.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'A normal breathing rate for adults is 12 to 20 breaths per minute. Count the number of breaths the person takes in 60 seconds. Is the breathing within the normal range?',
            ),
            const SizedBox(height: 10),
            const Text(
              'Observe the depth and regularity of each breath. Normal breathing is steady and even. Shallow, irregular, or labored breathing may indicate a problem',
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const UnnormalBreathingPage()),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              child: const Text('They are breathing normally'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const UnnotBreathingPage()),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              child: const Text('They are not breathing/breathing weakly'),
            ),
          ],
        ),
      ),
    );
  }
}
