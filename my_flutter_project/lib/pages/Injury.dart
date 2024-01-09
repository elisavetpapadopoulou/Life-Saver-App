import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'Cut.dart';
import 'Fracture.dart';
import 'Burn.dart';

class InjuryTypeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Color.fromARGB(255, 255, 182, 206),
        elevation: 0,
        actions: [
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'What Type of Injury is it?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Please answer the questions the best you can. If not possible, press the emergency call icons below',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Card(
              elevation: 2,
              child: Column(
                children: [
                  _buildListItem(context, 'Cut'),
                  _buildListItem(context, 'Burn'),
                  _buildListItem(context, 'Fracture'),
                  _buildListItem(context, 'Head Injury'),
                  _buildListItem(context, 'Electric Shock'),
                  _buildListItem(context, 'Dislocation'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, String injuryType) {
    return ListTile(
      title: Text(injuryType),
      onTap: () {
        switch (injuryType) {
          case 'Cut':
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CutScreen()));
            break;
          case 'Burn':
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => BurnScreen()));
            break;
          case 'Fracture':
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FractureScreen()));
            break;
          case 'Head Injury':
            // Navigate to HeadInjuryScreen
            break;
          case 'Electric Shock':
            // Navigate to ElectricShockScreen
            break;
          case 'Dislocation':
            // Navigate to DislocationScreen
            break;
          default:
            // Handle default case
            break;
        }
      },
    );
  }
}
