import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'Homepage.dart';
import 'Welcome.dart';
import 'Account.dart';
import 'account_security.dart';
import 'TermsOfUseScreen.dart';
import 'BluetoothScreen.dart';
import '../globals.dart';
import 'package:lifesaver/api_service.dart';


class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Do you want to log out of this device?'),
        content: Text('You will have to enter your login info again next time you log in'),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          ElevatedButton(
            child: Text('Log Out'),
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple, // The background color of the button
              onPrimary: Colors.white, // The color of the text
            ),
            onPressed: () {
              Global.clearUserId();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => WelcomeScreen()),
              );
            }
          ),
        ],
      );
    },
  );
}

void _showDeleteAccountDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // The user must tap a button to dismiss the dialog.
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Do you want to delete your account?'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Are you sure you want to delete your account?'),
              Text('This action is irreversible and all your data will be permanently removed from our system.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          ElevatedButton(
            child: Text('Delete Account'),
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple, 
              onPrimary: Colors.white,
            ),
            onPressed: () {
              final userId = Global.userId;
              final ApiService _apiService = ApiService();
              _apiService.deleteAccount(userId);
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => WelcomeScreen()),
              );
             // Navigator.of(context).pop(true);// Close the dialog after handling the deletion
            },
          ),
        ],
      );
    },
  );
}


class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true; // You may want to persist this state

  @override
  void initState() {
    super.initState();
    _checkNotificationStatus();
  }

  void _checkNotificationStatus() async {
    // Get the current notification status from shared preferences or your backend
  }

  void _toggleNotifications(bool value) async {
    setState(() {
      _notificationsEnabled = value;
    });

    FirebaseMessaging messaging = FirebaseMessaging.instance;
    if (value) {
      // Enable FCM notifications
      await messaging.subscribeToTopic('all');
    } else {
      // Disable FCM notifications
      await messaging.unsubscribeFromTopic('all');
    }

    // Here you might want to save the setting to shared preferences or your backend
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
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
                value: _notificationsEnabled,
                onChanged: _toggleNotifications,
                secondary: const Icon(Icons.notifications),
              ),
              ListTile(
                title: const Text('Account'),
                onTap: () {
                  // Navigate to Account settings screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountScreen()),
                  );
                },
                leading: const Icon(Icons.person),
              ),
              ListTile(
                title: const Text('Account Security'),
                onTap: () {
                  // Navigate to Account Security settings screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountSecurityScreen()),
                  );
                },
                leading: const Icon(Icons.security),
              ),
              ListTile(
                title: const Text('Log Out'),
                onTap: () => _showLogoutDialog(context),
                leading: const Icon(Icons.exit_to_app),
              ),
              ListTile(
                title: const Text('Delete Account'),
                onTap: () => _showDeleteAccountDialog(context),
                leading: const Icon(Icons.delete_forever),
              ),
              ListTile(
                title: const Text('Bluetooth'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BluetoothScreen()),
                  );
                },
                leading: const Icon(Icons.bluetooth),
              ),
              ListTile(
                title: const Text('Terms of use'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TermsOfUseScreen()),
                  );
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
