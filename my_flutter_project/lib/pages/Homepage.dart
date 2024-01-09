import 'package:flutter/material.dart';
import 'Account.dart';
import 'Profile.dart';
import 'Emergency.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleIconButton(
                    icon: Icons.person,
                    onTap: () {
                      // Navigate to profile page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()),
                      );
                    },
                  ),
                  Transform.translate(
                    offset: Offset(0.0,
                        35.0), // Adjust the second parameter (20.0) for vertical translation
                    child: Text(
                      'Life Saver',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 28.0), // Adjusted font size
                    ),
                  ),
                  CircleIconButton(
                    icon: Icons.settings,
                    onTap: () {
                      // Handle settings button tap
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40.0), // Adjusted space
                  MenuButton(),
                  SizedBox(height: 40.0), // Adjusted space
                  Text(
                    'Your daily health tip!',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CallButton(icon: Icons.phone, label: '100'),
                CallButton(icon: Icons.phone, label: '112'),
                CallButton(icon: Icons.phone, label: '166'),
                CallButton(icon: Icons.phone, label: '122'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Placeholder for other menu button actions
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 255, 182, 206),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 20.0,
        ),
        child: Column(
          children: [
            _buildMenuItem(
              context,
              "Emergency!",
              Icons.warning,
              () {
                // Navigate to the EmergencyTypeScreen when "Emergency!" is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EmergencyTypeScreen()),
                );
              },
            ),
            SizedBox(height: 15),
            _buildMenuItem(
              context,
              "Educate Yourself!",
              Icons.school,
              () {
                // Placeholder for "Educate Yourself!" menu action
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context, String label, IconData icon, VoidCallback onTap) {
    return ElevatedButton(
      onPressed: onTap, // Use the onTap callback passed from the caller
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color iconColor;

  const CircleIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.iconColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(
        color: Color.fromARGB(255, 255, 182, 206),
        shape: CircleBorder(),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}

class CallButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;

  const CallButton({
    Key? key,
    required this.icon,
    required this.label,
    this.iconColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle call button tap
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(
            255, 255, 182, 206), // Set the button color to pastel pink
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Make the button circular
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Take minimum vertical space
        children: [
          CircleIconButton(
            icon: icon,
            onTap: () {
              // Handle call button tap
            },
            iconColor: Colors.black,
          ),
          SizedBox(height: 8.0),
          Text(
            label,
            style: TextStyle(
              color: Colors.black, // Set text color to black
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
