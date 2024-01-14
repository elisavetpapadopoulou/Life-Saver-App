import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Profile.dart';
import 'Emergency.dart';
import 'settings.dart';
import 'educate_yourself.dart';

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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsScreen()),
                      );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EducateYourselfScreen()),
                );
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

  const CallButton({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () =>
          _makeCall(context, label), // Call the _makeCall function here
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 255, 182, 206),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          SizedBox(height: 8.0),
          Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}

void _makeCall(BuildContext context, String phoneNumber) async {
  final String telScheme = 'tel:$phoneNumber';
  if (await canLaunchUrl(Uri.parse(telScheme))) {
    await launchUrl(Uri.parse(telScheme));
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(
              'Could not make the call. Please check your device settings.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Color.fromARGB(255, 255, 182, 206),
              ),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}