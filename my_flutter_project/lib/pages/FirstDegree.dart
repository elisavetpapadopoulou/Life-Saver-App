import 'package:flutter/material.dart';
import 'Homepage.dart'; // Make sure you have this page created to navigate back to

class FirstDegreeBurnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('First-Degree Burn'),
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
                'Run cool (not cold) water over the burn for at least 10 minutes to soothe pain and reduce heat.'),
          ),
          ListTile(
            leading: Icon(Icons.not_interested),
            title: Text('Avoid Ice!'),
            subtitle: Text(
                'Do not use ice or very cold water, as it may cause further damage.'),
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
            leading: Icon(Icons.search),
            title: Text('Monitor for Signs of Infection'),
            subtitle: Text(
                'Keep an eye on the burn for signs of infection, and seek medical attention if necessary.'),
          ),
        ],
      ),
    );
  }
}
