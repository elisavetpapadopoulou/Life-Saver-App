import 'package:flutter/material.dart';
import 'PersonalData_Profile.dart';
import 'HealthHistory_Profile.dart';
import 'Allergies_Profile.dart';
import 'Medication_Profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            backgroundColor: Color.fromARGB(255, 255, 182, 206),
            elevation: 0,
            leading: CircleIconButton(
              icon: Icons.person,
              onTap: () {
                // Handle profile button tap
              },
              iconColor: Colors.white,
              backgroundColor:
                  Color.fromARGB(255, 255, 182, 206), // Set to pink
              size: 36.0,
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Profile options sections
              _buildProfileOption(
                context,
                icon: Icons.person,
                headlineText: "Personal Data",
                supportingText: "Name, Gender, Age, Blood Type",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PersonalDataScreen(),
                    ),
                  );
                },
              ),
              _buildProfileOption(
                context,
                icon: Icons.menu_book,
                headlineText: "Health History",
                supportingText:
                    "List of current, past and chronic medical conditions",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HealthHistoryScreen(),
                    ),
                  );
                },
              ),
              _buildProfileOption(
                context,
                icon: Icons.bookmark,
                headlineText: "Allergies",
                supportingText:
                    "Supporting line text lorem ipsum dolor sit amet, consectetur.",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllergiesScreen(),
                    ),
                  );
                },
              ),
              _buildProfileOption(
                context,
                icon: Icons.medical_services,
                headlineText: "Medications",
                supportingText: "List of current medications",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicationScreen(),
                    ),
                  );
                },
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption(
    BuildContext context, {
    required IconData icon,
    required String headlineText,
    required String supportingText,
    required VoidCallback onTap,
  }) {
    return Material(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 22),
          child: Row(
            children: [
              Icon(icon, size: 24),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(headlineText, style: TextStyle(fontSize: 18)),
                  SizedBox(height: 4),
                  Text(supportingText, style: TextStyle(fontSize: 16)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color iconColor;
  final Color backgroundColor;
  final double size;

  const CircleIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.iconColor = Colors.black,
    required this.backgroundColor,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: CircleBorder(),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(
          icon,
          color: iconColor,
        ),
        iconSize: size,
      ),
    );
  }
}
