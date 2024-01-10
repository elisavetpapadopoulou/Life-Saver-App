import 'package:flutter/material.dart';
import 'Homepage.dart';

class TourniquetInstructionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tourniquet'),
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
      body: Center(
        child: Image.asset(
            'pictures/tourniquet.png'), // Replace with your image asset or network image
      ),
    );
  }
}

class PressurePointsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pressure Points'),
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
      body: Center(
        child: Image.asset(
            'pictures/pressure_points.png'), // Replace with your image asset or network image
      ),
    );
  }
}
