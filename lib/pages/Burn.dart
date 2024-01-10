import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'FirstDegree.dart';
import 'SecondDegree.dart';

class BurnScreen extends StatefulWidget {
  @override
  _BurnScreenState createState() => _BurnScreenState();
}

class _BurnScreenState extends State<BurnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Assess the Degree of Burn'),
        backgroundColor: Color.fromARGB(255, 255, 182, 206),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
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
            title: Text('First Degree (Superficial)'),
            subtitle: Text('Redness, mild pain.'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FirstDegreeBurnScreen()));
            },
          ),
          ListTile(
            title: Text('Second Degree (Partial Thickness)'),
            subtitle: Text('Redness, blistering, more pain.'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecondDegreeBurnScreen()));
            },
          ),
          ListTile(
            title: Text('Third Degree (Full Thickness)'),
            subtitle: Text(
                'White or charred appearance, may involve all layers of skin, less pain (due to nerve damage).'),
            onTap: () {
              // TODO: Navigate to Third Degree Burn Page
            },
          ),
        ],
      ),
    );
  }
}
