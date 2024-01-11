import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'assess_breathing.dart';
import 'instructions_blocked.dart';

class AirwayBlockedPage extends StatelessWidget {
  const AirwayBlockedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop()),
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
        title: const Text('Airway Blocked'),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 182, 206),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Clear the airway',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Text(
              'If the object is visible, attempt to remove it with your fingers. Be careful not to push it further down.',
            ),
            const Text(
              'Activate Emergency Services',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Text(
              'Call emergency services 166 immediately. Report that the person is unresponsive and provide details about their breathing status.',
            ),
            const Text(
              'Call emergency services 166 immediately. Report that the person is unresponsive and provide details about their breathing status.',
            ),
            const Text(
              'Kneel next to them',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Text(
              'Kneel down beside the person and place your hands on their chest.',
            ),
            const Text(
              'Give five blows',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Text(
              'Give up to five back blows between the shoulder blades with the heel of your hand.',
            ),
            const Text(
              'Check the airway repeatedly',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Text(
              'Check if the blockage has been cleared after each back blow.',
            ),
            const Text(
              'Abdominal thrusts',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Text(
              'If back blows do not clear the blockage, perform up to five abdominal thrusts...',
            ),
            const Text(
              'Continue',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Text(
              'Continue alternating between back blows and abdominal thrusts until the blockage is cleared or emergency services arrive.',
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (_) => const InstructionsBlockedPage()),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Abdominal thrusts instructions'),
            ),
          ],
        ),
      ),
    );
  }
}
