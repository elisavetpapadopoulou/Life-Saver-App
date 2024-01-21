import 'package:flutter/material.dart';
import 'package:lifesaver/pages/assess_breathing.dart';
import 'package:lifesaver/pages/responsive.dart';
import 'Homepage.dart';
import 'age.dart';
import 'rescue_breath.dart';

class NotBreathingPage extends StatelessWidget {
  const NotBreathingPage({Key? key}) : super(key: key);
  static const String routeName = '/notBreathingPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const ResponsivePage()),
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
          title: Text('Breathing not normal')),
      backgroundColor: const Color.fromARGB(255, 255, 182, 206),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              leading: Icon(Icons.check_circle_outline),
              title: Text('Confirm Unresponsiveness'),
              subtitle: Text(
                  'Ensure the person is lying on their back. Tap or shake them gently and ask loudly, "Are you okay?"'),
            ),
            const ListTile(
              leading: Icon(Icons.phone_android),
              title: Text('Activate Emergency Services'),
              subtitle: Text(
                  'Call emergency services 166 from the icon below immediately. Report that the person is unresponsive and not breathing'),
            ),
            const ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Begin CPR'),
              subtitle: Text(
                  'If you are trained in CPR, begin chest compressions. Place your hands on the center of the chest, just below the nipple line. Push hard and fast. Perform compressions at a rate of at least 100-120 compressions per minute.'),
            ),
            const ListTile(
              leading: Icon(Icons.accessibility_new),
              title: Text('Stay with the Person'),
              subtitle: Text(
                  'Stay with the person and provide any additional information or assistance requested by emergency services. Continue CPR until professional help takes over.'),
            ),
            const ListTile(
              leading: Icon(Icons.medical_information),
              title: Text('CPR and Rescue Breaths'),
              subtitle: Text(
                  'Start with chest compressions, then provide rescue breaths.'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const AgePage()),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('CPR instructions'),
            ),
            const ListTile(
              leading: Icon(Icons.medication),
              title: Text('Chest Compressions'),
              subtitle: Text(
                  'Begin with 30 chest compressions at a rate of 100 to 120 compressions per minute.'),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Rescue Breaths'),
              subtitle: Text(
                  'After 30 compressions, give 2 rescue breaths by tilting the person\'s head back slightly to open the airway, lifting the chin, pinching the nose shut, and making a complete seal over the person\'s mouth with your mouth.'),
            ),
            const SizedBox(height: 20), // Add space between the buttons
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const RescueBreathPage()),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Rescue Breath intructions'),
            ),
          ],
        ),
      ),
    );
  }
}
