import 'package:flutter/material.dart';
import 'Homepage.dart'; // Make sure this import points to your actual Homepage screen

class ThirdDegreeBurnScreen extends StatelessWidget {
  const ThirdDegreeBurnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 182, 206),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            // Navigate to the HomePage when the X button is pressed
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomepageScreen()),
            );
          },
        ),
        title: Text('Third-Degree Burn'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Activate Emergency Services',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                'If the cut is deep, long, or involves a large wound, or if there\'s difficulty stopping the bleeding, seek professional medical help.'),
            SizedBox(height: 10),
            // ... Add all other instructions here in Text widgets
            Text(
              'Do NOT Cool with Water',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                'Do not use water on third-degree burns; cover the burn loosely with a clean, non-stick bandage or sterile gauze.'),
            // ... Continue adding other sections similarly
            SizedBox(height: 10),
            Text(
              'Avoid Home Remedies!',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Do not apply any ointments, creams, or home remedies.'),
            // ... Continue for each section of instructions
            // At the end of the list, you might have buttons or other interactive elements
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: ThirdDegreeBurnScreen()));
