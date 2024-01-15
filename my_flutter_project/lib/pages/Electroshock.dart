import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'Pictures.dart';
import 'CPR.dart';

class ElectroshockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Electroshock'),
        backgroundColor: Color.fromARGB(255, 255, 182, 206),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          InstructionStep(
            title: 'Disconnect Power',
            description:
                'If the person is still in contact with the electrical source, disconnect the power source if it can be done safely. Do not touch the person if they are still in contact with electricity.',
          ),
          InstructionStep(
            title: 'Activate Emergency Services',
            description:
                'If the cut is deep, long, or involves a large wound, or if there\'s difficulty stopping the bleeding, seek professional medical help.',
          ),
          InstructionStep(
            title: 'Check for Responsiveness',
            description: 'Gently tap them and see if they respond.',
          ),
          InstructionStep(
            title: 'Check Breathing',
            description:
                'If the person is unresponsive, check for normal breathing. If breathing is absent, start CPR.',
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CPRHandPlacementScreen()),
                  );
                },
                child: Text('Press for instructions'),
              ),
            ],
          ),
          InstructionStep(
            title: 'Move Away from the Source',
            description:
                'If it\'s safe to do so, move the person away from the electrical source using a non-conductive object, such as a wooden broom handle. Do not use metal objects.',
          ),
          InstructionStep(
            title: 'Avoid Direct Contact',
            description:
                'Do not touch the person directly if they are still in contact with electricity. Use a non-conductive object to move them away from the source.',
          ),
          InstructionStep(
            title: 'Check for Injuries',
            description:
                'Assess the person for burns, entry and exit wounds, or other injuries caused by the electric shock.',
          ),
          InstructionStep(
            title: 'Monitor for Shock',
            description:
                'Be alert to signs of shock, such as pale skin, rapid breathing, or weakness. If shock is suspected, help the person lie down and keep them warm.',
          ),
          InstructionStep(
            title: 'Avoid Water',
            description:
                'Do not use water on the person if they are still in contact with electricity. Water conducts electricity and can worsen the situation.',
          ),
        ],
      ),
    );
  }
}

class InstructionStep extends StatelessWidget {
  final String title;
  final String description;

  const InstructionStep({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(description),
      isThreeLine: true,
    );
  }
}

// TODO: Implement the pages for further instructions and the next page in the sequence
