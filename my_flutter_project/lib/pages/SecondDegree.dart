import 'package:flutter/material.dart';
import 'Homepage.dart'; // Ensure this page is created for navigation

class SecondDegreeBurnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Second-Degree Burn'),
        backgroundColor: Color.fromARGB(255, 255, 182, 206),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomepageScreen()),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.local_fire_department),
            title: Text('Cool the Burn'),
            subtitle: Text(
                'Run cool (not cold) water over the burn for at least 10-20 minutes to soothe pain and reduce heat.'),
          ),
          ListTile(
            leading: Icon(Icons.not_interested),
            title: Text('Avoid Ice!'),
            subtitle: Text(
                'Do not use ice or very cold water, as it may cause further damage.'),
          ),
          ListTile(
            leading: Icon(Icons.warning),
            title: Text('Avoid Ice!'),
            subtitle: Text(
                'Do not intentionally break blisters, as they provide a natural barrier against infection.'),
          ),
          ListTile(
            leading: Icon(Icons.healing),
            title: Text('Pain Relief'),
            subtitle: Text(
                'Over-the-counter pain relievers (excluding aspirin) can be used to manage pain. However, seek for medical advice from an expert before taking any sort of medication.'),
          ),
          ListTile(
            leading: Icon(Icons.shield),
            title: Text('Protect the Burn'),
            subtitle: Text(
                'Cover the burn with a clean, non-stick bandage or sterile gauze.'),
          ),
          ListTile(
            leading: Icon(Icons.local_hospital),
            title: Text('Seek Medical Attention'),
            subtitle: Text(
                'If the burn is large, on the face, hands, feet, genitals, or major joints, or if there is concern about infection, seek medical attention.'),
          ),
        ],
      ),
    );
  }
}
