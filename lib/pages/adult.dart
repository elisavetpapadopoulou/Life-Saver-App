import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'age.dart';

class AdultCprPage extends StatelessWidget {
  const AdultCprPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Replace with the correct paths for your images
    const String handImage = 'pictures/adult_hands.png';
    const String handPlacementImage = 'pictures/cpr.png';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop()),
        backgroundColor: const Color.fromARGB(255, 255, 182, 206),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const HomepageScreen()),
            ),
          ),
        ],
        title: const Text('CPR for Adults'),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 182, 206),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          // Center the column itself within the scroll view
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center the children vertically
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center the children horizontally
            children: [
              const Text(
                'Hands',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const Text(
                'Place your hands like the picture below.',
                style: TextStyle(fontSize: 16),
                textAlign:
                    TextAlign.center, // Center the text within the Text widget
              ),
              Image.asset(handImage), // Display hand positioning image
              const SizedBox(height: 20),
              const Text(
                'Hand placement',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const Text(
                'Follow the photo with your hands formed in the way of the pictures above.',
                style: TextStyle(fontSize: 16),
                textAlign:
                    TextAlign.center, // Center the text within the Text widget
              ),
              Image.asset(handPlacementImage), // Display hand placement image
            ],
          ),
        ),
      ),
    );
  }
}
