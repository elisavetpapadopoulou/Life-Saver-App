import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'unnormal_breathing.dart'; 
import 'injector.dart'; 

class GatherInformationPage extends StatelessWidget {
  const GatherInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const UnnormalBreathingPage()),
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
        title: const Text('Gather Information'),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 182, 206),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Gather Information'),
              subtitle: Text('Ask the person about any symptoms or discomfort they may be experiencing. Gather information about their medical history, known allergies, and any medications they may be taking.'),
            ),
            const ListTile(
              leading: Icon(Icons.healing),
              title: Text('If Necessary, Administer First Aid'),
              subtitle: Text('If the person has a known medical condition and carries prescribed medication (e.g., an inhaler or an epinephrine auto-injector), assist them in using it according to their doctor\'s instructions.'),
            ),
            const ListTile(
              leading: Icon(Icons.accessibility_new),
              title: Text('Stay with the Person'),
              subtitle: Text('Stay with the person and provide comfort. Continue to reassure them while waiting for professional help to arrive.'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const InjectorPage()),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Injector instructions'),
            ),
          ],
        ),
      ),
    );
  }
}
