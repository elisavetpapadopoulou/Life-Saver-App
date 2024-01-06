import 'package:flutter/material.dart';
import 'Homepage.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Go back to the previous screen
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomepageScreen()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 255, 182, 206),
      ),
      body: Container(
        child: ListView(
          children: ListTile.divideTiles(
            context: context,
            tiles: [
              SwitchListTile(

                title: const Text('Notifications'),
                value: true, // Replace with a variable that holds current value
                onChanged: (bool value) {
                  // Update the state with new value
                },
                secondary: const Icon(Icons.notifications),
              ),
              ListTile(
                title: const Text('Account'),
                onTap: () {
                  // Navigate to Account settings screen
                },
                leading: const Icon(Icons.person),
              ),
              ListTile(
                title: const Text('Account Security'),
                onTap: () {
                  // Navigate to Account Security settings screen
                },
                leading: const Icon(Icons.security),
              ),
              ListTile(
                title: const Text('Log Out'),
                onTap: () {
                  // Handle log out action
                },
                leading: const Icon(Icons.exit_to_app),
              ),
              ListTile(
                title: const Text('Delete Account'),
                onTap: () {
                  // Handle account deletion action
                },
                leading: const Icon(Icons.delete_forever),
              ),
              ListTile(
                title: const Text('Bluetooth'),
                onTap: () {
                  // Navigate to Bluetooth settings screen
                },
                leading: const Icon(Icons.bluetooth),
              ),
              ListTile(
                title: const Text('Terms of use'),
                onTap: () {
                  // Show terms of use
                },
                leading: const Icon(Icons.description),
              ),
            ],
          ).toList(),
        ),
      ),
    );
  }
}
