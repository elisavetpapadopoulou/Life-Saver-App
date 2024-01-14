import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'recoveryposition.dart'; 
import 'assess_breathing.dart';
import 'signsoflife.dart';


class NormalBreathingPage extends StatelessWidget {
  const NormalBreathingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const AssessBreathingPage()),
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
      ),
      backgroundColor: const Color.fromARGB(255, 255, 182, 206),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              leading: Icon(Icons.check_circle_outline),
              title: Text('Confirm Unresponsiveness'),
              subtitle: Text('Tap or shake them gently and ask loudly, "Are you okay?"'),
            ),
            const ListTile(
              leading: Icon(Icons.phone_android),
              title: Text('Activate Emergency Services'),
              subtitle: Text('Call emergency services 166, from the icon below. Report that the person is unresponsive and provide details about their breathing status'),
            ),
            const ListTile(
              leading: Icon(Icons.airline_seat_individual_suite),
              title: Text('Place in Recovery Position'),
              subtitle: Text('If the person is breathing but remains unresponsive, consider placing them in the recovery position. This involves turning them onto their side to help maintain an open airway'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const RecoveryPositionPage()),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Press for instructions'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const SignsOfLifePage()),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
