import 'package:flutter/material.dart';
import 'Homepage.dart';

class HeadInjuryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Head Injury'),
        backgroundColor: Color.fromARGB(255, 255, 182, 206),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              // Assuming 'HomepageScreen' is the home page of your app
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomepageScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Ensure Safety'),
            subtitle: Text(
                'Ensure both your safety and the safety of the injured person. Be cautious of any potential hazards in the environment.'),
            onTap: () {
              // Navigate to the detail page for 'Ensure Safety'
            },
          ),
          ListTile(
            title: Text('Activate Emergency Services'),
            subtitle: Text(
                'If the cut is deep, long, or involves a large wound, or if there\'s difficulty stopping the bleeding, seek professional medical help.'),
            onTap: () {
              // Navigate to the detail page for 'Activate Emergency Services'
            },
          ),
          ListTile(
            title: Text('Check for Responsiveness'),
            subtitle: Text('Gently tap them and see if they respond.'),
            onTap: () {
              // Navigate to the detail page for 'Check for Responsiveness'
            },
          ),
          ListTile(
            title: Text('Check for Bleeding'),
            subtitle: Text(
                'Check for any possible open wounds, bleeding, without touching them.'),
            onTap: () {
              // Navigate to the detail page for 'Check for Bleeding'
            },
          ),
          ListTile(
            title: Text('Do Not Move'),
            subtitle: Text(
                'Advise the person not to move if they are concious. Keep the person as still as possible.'),
            onTap: () {
              // Navigate to the detail page for 'Do Not Move'
            },
          ),
          // ... Add more ListTiles for each step
        ],
      ),
    );
  }
}



// Define detail pages for each step similarly to how 'Ensure Safety' would be defined
