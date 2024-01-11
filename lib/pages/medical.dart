import 'package:flutter/material.dart';
import 'Homepage.dart'; 
import 'emergency.dart';
import 'responsive.dart'; 
import 'unresponsive.dart';

class MedicalPage extends StatelessWidget {
  const MedicalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100, 
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Navigate to the EmergencyPage
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) =>  const EmergencyPage()),
              );
            },
          
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
          onPressed: () {
            // Navigate to the Homepage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomepageScreen()),
            );
          },
          ),
        ],
        title: const Text('Check for Responsiveness'),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 182, 206), 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Is the person responsive? Tap or shake them gently and ask loudly, "Are you okay?"',
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the ResponsivePage
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ResponsivePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Button color
                foregroundColor: Colors.black, // Text color
              ),
              child: const Text('They are responsive'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the UnresponsivePage
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const UnresponsivePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Button color
                foregroundColor: Colors.black, // Text color
              ),
              child: const Text('They are not responsive'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
