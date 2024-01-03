import 'package:flutter/material.dart';
import 'CurrentMedicalConditions_HH_Profile.dart';

class HealthHistoryScreen extends StatelessWidget {
  const HealthHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: SizedBox(
              height: 758.0,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 126.0,
                        vertical: 10.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(height: 700.0),
                          Divider(),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 24.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.grey[100],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildAppBar(context),
                          SizedBox(height: 61.0),
                          _buildMedicalConditions(
                            context,
                            "Current Medical Conditions",
                            "A list of your current medical conditions",
                            Icons.favorite, // Different icon
                            HealthHistoryCurrentScreen(),
                          ),
                          SizedBox(height: 61.0),
                          _buildMedicalConditions(
                            context,
                            "Past Medical Conditions",
                            "A list of your conditions that have been overcome",
                            Icons.access_time, // Different icon
                            HealthHistoryCurrentScreen(),
                          ),
                          SizedBox(height: 47.0),
                          _buildMedicalConditions(
                            context,
                            "Chronic Medical Conditions",
                            "A list of chronic medical Conditions",
                            Icons.star, // Different icon
                            HealthHistoryCurrentScreen(),
                          ),
                          SizedBox(height: 192.0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Inside the _buildAppBar method
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor:
          Color.fromARGB(255, 198, 123, 148), // Set the desired color here
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
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
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
