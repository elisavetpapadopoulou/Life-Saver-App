import 'package:flutter/material.dart';
import 'CurrentMedicalConditions_HH_Profile.dart';
import 'Homepage.dart';
import 'PastMedicalConditions_HH_Profile.dart';
import 'ChronicMedicalConditions_HH_Profile.dart';

class HealthHistoryScreen extends StatelessWidget {
  const HealthHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:
              Color.fromARGB(255, 255, 182, 206), // Set the desired color here
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Row(
            children: [
              Icon(Icons.menu_book),
              SizedBox(width: 13.0),
              Text("Health History"),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomepageScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildMedicalConditions(
                context,
                "Current Medical Conditions",
                "A list of your current medical conditions",
                Icons.favorite,
                CurrentMedicalConditionsScreen(),
              ),
              _buildMedicalConditions(
                context,
                "Past Medical Conditions",
                "A list of your conditions that have been overcome",
                Icons.access_time,
                PastMedicalConditionsScreen(),
              ),
              _buildMedicalConditions(
                context,
                "Chronic Medical Conditions",
                "A list of chronic medical Conditions",
                Icons.star,
                ChronicMedicalConditionsScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMedicalConditions(
    BuildContext context,
    String title,
    String description,
    IconData iconData,
    Widget screen,
  ) {
    return GestureDetector(
      onTap: () {
        onTapMedicalConditions(context, screen);
        print("Tapped: $title");
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          leading: Icon(
            iconData,
            color: Colors.black, // Change the color as needed
            size: 24.0,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            description,
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
        ),
      ),
    );
  }

  void onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  void onTapMedicalConditions(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }
}
