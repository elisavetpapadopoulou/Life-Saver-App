import 'package:flutter/material.dart';
import 'Homepage.dart';

// Placeholder classes for each CPR instruction screen
class CPRHandPlacementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('CPR Hand Placement'),
        backgroundColor: Color.fromARGB(255, 255, 182, 206),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hands',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Place your hands like the picture below.'),
              // Placeholder for images
              Image.asset(
                  'pictures/adult_hands.png'), // Replace with your asset image
              Text(
                'Hand placement',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                  'Follow the photo with your hands formed in the way of the pictures above.'),
              // Placeholder for gif
              Image.asset('pictures/cpr.png'), // Replace with your asset gif
            ],
          ),
        ),
      ),
    );
  }
}
