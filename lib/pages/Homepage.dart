import 'package:flutter/material.dart';

//import 'Profile.dart';
import 'emergency.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({Key? key}) : super(key: key);
  static const String routeName = '/HomepageScreen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleIconButton(
                    icon: Icons.person,
                    onTap: () {
                      // Navigate to profile page
                      
                    },
                  ),
                  Transform.translate(
                    offset: const Offset(0.0,
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
                  const SizedBox(height: 40.0), // Adjusted space
                  const MenuButton(),
                  const SizedBox(height: 40.0), // Adjusted space
                  Text(
                    'Your daily health tip!',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            const Row(
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
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // This button's function is not specified. Add functionality if needed.
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 255, 182, 206), // Set primary color to the pink color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 20.0,
        ), // Increased padding
        child: Column(
          children: [
            _buildMenuItem(context, "Emergency!", Icons.warning, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EmergencyPage()),
              );
            }),
            const SizedBox(height: 15),
            _buildMenuItem(context, "Educate Yourself!", Icons.school, () {
              // Add navigation for "Educate Yourself!" when ready
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String label, IconData icon, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent, // Set primary color to transparent
        elevation: 0,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.black, // Changed icon color to black
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(
              color: Colors.black, // Changed text color to black
              fontSize: 18.0, // Increased font size
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
      decoration: const ShapeDecoration(
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  const EmergencyPage())
        );
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
          const SizedBox(height: 8.0),
          Text(
            label,
            style: const TextStyle(
              color: Colors.black, // Set text color to black
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
