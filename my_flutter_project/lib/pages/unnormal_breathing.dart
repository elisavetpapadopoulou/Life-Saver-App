import 'package:flutter/material.dart';
import 'package:lifesaver/pages/responsive.dart';
import 'Homepage.dart';
import 'unresponsive.dart';
import 'recoveryposition.dart';
import 'assess_breathing.dart';
import 'signsoflife.dart';

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
        title: const Text('Normal Breathing'),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 182, 206),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              leading: Icon(Icons.check_circle_outline),
              title: Text('Confirm Unresponsiveness'),
              subtitle: Text(
                  'Tap or shake them gently and ask loudly, "Are you okay?"'),
            ),
            const ListTile(
              leading: Icon(Icons.phone_android),
              title: Text('Activate Emergency Services'),
              subtitle: Text(
                  'Call emergency services 166, from the icon below. Report that the person is unresponsive and provide details about their breathing status'),
            ),
            const ListTile(
              leading: Icon(Icons.airline_seat_individual_suite),
              title: Text('Place in Recovery Position'),
              subtitle: Text(
                  'If the person is breathing but remains unresponsive, consider placing them in the recovery position. This involves turning them onto their side to help maintain an open airway'),
            ),
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
            const ListTile(
              leading: Icon(Icons.medical_services),
              title: Text('Check for Signs of Life'),
              subtitle: Text(
                  'While waiting for emergency services, check for any signs of life. Look for movement, breathing, or any other indications of consciousness or responsiveness'),
            ),
            const ListTile(
              leading: Icon(Icons.info),
              title: Text('Monitor Vital Signs'),
              subtitle: Text(
                'Continue to monitor the person\'s breathing and other vital signs. Be prepared to provide updated information to emergency services',
              ),
            ),
            const ListTile(
                leading: Icon(Icons.person),
                title: Text('Stay with the Person'),
                subtitle: Text(
                  'Stay with the person and provide comfort. Continue to reassure them while waiting for professional help to arrive.',
                )),
          ],
        ),
      ),
    );
  }
}
