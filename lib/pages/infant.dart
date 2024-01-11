import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'age.dart'; // Replace with the actual path if necessary

class InfantCprPage extends StatelessWidget {
  const InfantCprPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const AgePage()),
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
        title: const Text('CPR Instructions for an Infant'),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 182, 206),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
              const Text('Place your hands like the picture below.'),
              // Replace with your image path or asset
              Image.asset('pictures/infant_hands.png'), //or wtv you've named it
            
          
              
             
              const Text('Follow the photo with your hands formed in the way of the pictures above.'),
              Image.asset('pictures/cpr.png'),
            ],
          
        
      
    ));
  }
}
