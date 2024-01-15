import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'signsoflife.dart';
import 'normal_breathing.dart';

class RecoveryPositionPage extends StatelessWidget {
  const RecoveryPositionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String imagePath = 'pictures/recovery.png';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const NormalBreathingPage()),
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
        title: const Text('Instructions'),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 182, 206),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(imagePath), // The image of the person lying down
              const SizedBox(height: 20),
              const Text(
                'Place the person on their back and ensure they are lying down in a safe position. Keep their airways clear.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ], // Add any additional instructions here
          ),
        ),
      ),
    );
  }
}
