import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'allergic_reaction.dart';
import 'injector.dart';

class AnaphylaxisPage extends StatelessWidget {
  const AnaphylaxisPage({Key? key}) : super(key: key);

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
        title: const Text('Anaphylaxis'),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 182, 206),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              leading: Icon(Icons.medical_services),
              title: Text('Use Epinephrine Auto-Injector'),
              subtitle: Text(
                  'If the person has been prescribed an epinephrine auto-injector (such as EpiPen), help them use it immediately. Instruct them to inject it into their thigh muscle.'),
            ),
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
            const ListTile(
              leading: Icon(Icons.list_alt),
              title: Text('Follow the Instructions'),
              subtitle: Text(
                  'Follow the specific instructions provided with the auto-injector. Typically, it involves holding the injector in place for a few seconds.'),
            ),
            const ListTile(
              leading: Icon(Icons.phone_in_talk),
              title: Text('Activate Emergency Services'),
              subtitle: Text(
                  'Call emergency services immediately and inform them that the person is experiencing anaphylaxis.'),
            ),
            const ListTile(
              leading: Icon(Icons.local_hospital),
              title: Text('Wait for Professional Help'),
              subtitle: Text('Wait for professional medical help to arrive.'),
            ),
          ],
        ),
      ),
    );
  }
}
