import 'package:flutter/material.dart';
import 'allergic_reaction.dart'; 
import 'injector.dart'; 
import 'Homepage.dart';

class NotAnaphylaxisPage extends StatelessWidget {
  const NotAnaphylaxisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const AllergicReactionPage()),
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
        title: const Text('Not Anaphylaxis'),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 182, 206),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              leading: Icon(Icons.healing),
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
              leading: Icon(Icons.list),
              title: Text('Follow the Instructions'),
              subtitle: Text(
                  'Follow the specific instructions provided with the auto-injector. Typically, it involves holding the injector in place for a few seconds.'),
            ),
            const ListTile(
              leading: Icon(Icons.repeat),
              title: Text('Give a Second Dose if Necessary'),
              subtitle: Text(
                  'If the person has a second epinephrine auto-injector and the symptoms persist or worsen after about 5 to 15 minutes, a second dose may be administered.'),
            ),
            const ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text('Reassure and Keep Calm'),
              subtitle: Text(
                  'Encourage the person to stay as calm as possible. Anxiety and panic can exacerbate symptoms.'),
            ),
            const ListTile(
              leading: Icon(Icons.airline_seat_legroom_extra),
              title: Text('Position for Breathing'),
              subtitle: Text(
                  'Help the person sit or lie down in a comfortable position. Elevating the legs may help improve blood flow.'),
            ),
          ],
        ),
      ),
    );
  }
}
