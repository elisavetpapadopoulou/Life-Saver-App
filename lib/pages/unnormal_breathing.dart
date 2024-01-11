import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'unresponsive.dart';
import 'gatherinfo.dart';

class UnnormalBreathingPage extends StatelessWidget {
  const UnnormalBreathingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const UnresponsivePage()),
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
        title: const Text('Unnormal Breathing'),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 182, 206),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              leading: Icon(Icons.security),
              title: Text('Ensure Safety'),
              subtitle: Text('First, ensure the safety of the person and your surroundings. If there are any potential hazards, move them to a safe location.'),
            ),
            const ListTile(
              leading: Icon(Icons.airline_seat_individual_suite),
              title: Text('Provide Comfort'),
              subtitle: Text('Keep the person comfortable and encourage them to sit or lie down, depending on their preference. Offer reassurance and stay with them until professional help arrives or they feel ready to get up.'),
            ),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('Activate Emergency Services'),
              subtitle: Text('If the person’s condition is not getting better, call emergency services 166, from the icon below immediately. Report the symptoms and follow the doctor’s instructions.'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const GatherInformationPage()),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
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