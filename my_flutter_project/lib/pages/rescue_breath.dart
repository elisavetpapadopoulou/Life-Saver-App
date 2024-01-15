import 'package:flutter/material.dart';
import 'Homepage.dart';
//import 'not_breathing.dart'; // Ensure this is the correct path for your project

class RescueBreathPage extends StatelessWidget {
  const RescueBreathPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
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
        title: const Text('Rescue Breaths'),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 182, 206),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Image.asset('pictures/hand_placement.png'), // Replace with your actual image path
              const Text(
                'Hand placement\nPut the palm of your hand on the person’s forehead and tilt their head back. Gently lift their chin forward with your other hand.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Image.asset('pictures/breaths.png'), 
              const Text(
                'Breaths\nGive two rescue breaths, each 1 second. Watch for their chest to rise with each breath.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
