import 'package:flutter/material.dart';
import 'Homepage.dart';

class FractureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('First Aid Steps'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomepageScreen()),
              );
            },
          ),
        ],
        backgroundColor: Color.fromARGB(255, 255, 182, 206),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          FirstAidStep(
            title: 'Ensure Safety',
            description:
                'Ensure both your safety and the safety of the injured person. Be cautious of any potential hazards in the environment.',
          ),
          FirstAidStep(
            title: 'Activate Emergency Services',
            description:
                'If the cut is deep, long, or involves a large wound, or if there\'s difficulty stopping the bleeding, seek professional medical help.',
          ),
          FirstAidStep(
            title: 'Comfort the Person',
            description:
                'Reassure the person and encourage them to remain calm.',
          ),
          FirstAidStep(
            title: 'Do Not Move',
            description:
                'Advise the person not to move the injured area. Keep the person as still as possible.',
          ),
          FirstAidStep(
            title: 'Immobilize the Area',
            description:
                'If possible, immobilize the injured limb using a splint or by securing it to a stable object. This helps prevent further injury.',
          ),
          FirstAidStep(
            title: 'Elevate the Limb',
            description:
                'If the fracture is in an extremity (arm or leg), gently elevate the limb to help reduce swelling.',
          ),
          FirstAidStep(
            title: 'Details for Emergency Services',
            description:
                'Be prepared to provide details to emergency services, such as the person\'s condition, any known medical history, and the circumstances of the injury.',
          ),
          FirstAidStep(
            title: 'Apply Ice (If Available)',
            description:
                'Apply a cold compress or ice pack wrapped in a cloth to the injured area, but avoid placing ice directly on the skin.',
          ),
          FirstAidStep(
            title: 'Pain Medication',
            description:
                'If the person can take oral pain medication and it\'s safe to do so, offer over-the-counter pain relievers according to the recommended dosage.',
          ),
        ],
      ),
    );
  }
}

class FirstAidStep extends StatelessWidget {
  final String title;
  final String description;

  const FirstAidStep({Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
      ),
    );
  }
}
