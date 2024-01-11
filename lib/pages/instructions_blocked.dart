import 'package:flutter/material.dart';
import 'airway_blocked.dart';
import 'Homepage.dart';

class InstructionsBlockedPage extends StatelessWidget {
  const InstructionsBlockedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    const String imagePath = 'pictures/blocked.png';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const AirwayBlockedPage()),
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
        title: const Text('Blocked Airway Instructions'),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 182, 206),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(imagePath), 
            ],
          ),
        ),
      ),
    );
  }
}