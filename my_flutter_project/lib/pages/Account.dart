import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'package:lifesaver/api_service.dart'; // Ensure this is the correct path
import 'dart:convert';
import '../globals.dart';


class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isEditing = false;
  final ApiService _apiService = ApiService(); // ApiService instance

  // Personal data fields
  String initialPassword = '';
  String initialName = '';
  String initialSurname = '';
  String initialEmail = '';
  String initialPhoneNumber = '';
  String initialGender = '';
  int initialAge = 0;
  String initialBloodType = '';
  String initialBloodRhFactor = '';
  int initialPoints = 0;

  late TextEditingController nameController;
  late TextEditingController surnameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;


  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    surnameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    _fetchAccount();
  }

  void _fetchAccount() async {
    final userId = Global.userId;
    final response = await _apiService.getUserProfile(userId);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        initialPassword = data['password'] ?? '';
        initialName = data['name'] ?? '';
        initialSurname = data['surname'] ?? '';
        initialEmail = data['email'] ?? '';
        initialPhoneNumber = data['phone_number'] ?? '';
        initialGender = data['gender'] ?? '';
        initialAge = data['age'] ?? 0;
        initialBloodType = data['blood_type'] ?? '';
        initialBloodRhFactor = data['rh_factor'] ?? '';
        initialPoints = data['points'] ?? '';

        nameController.text = initialName;
        surnameController.text = initialSurname;
        emailController.text = initialEmail;
        phoneController.text = initialPhoneNumber;
      });
    } else {
      // Handle errors more gracefully here
      print('Failed to load user data. Status code: ${response.statusCode}');
    }
  }

  void _onSavePressed() async {
    final updateData = {
      'name': nameController.text,
      'surname': surnameController.text,
      'email': emailController.text,
      'phone_number': phoneController.text,
      'gender': initialGender,
      'age': initialAge,
      'blood_type': initialBloodType,
      'rh_factor': initialBloodRhFactor,
      'points': initialPoints
    };


    final response =
        await _apiService.updateUserProfile(Global.userId, updateData);

    if (response.statusCode == 200) {
      // Refresh data after saving
      _fetchAccount();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile updated successfully')),
      );
    } else {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update profile')),
      );
    }
    setState(() => isEditing = false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 182, 206),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text('Account'),
          actions: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomepageScreen(),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Replace _buildEditableField and _buildDisplayField with fields from AccountScreen
              isEditing
                  ? _buildEditableField("Name", nameController)
                  : _buildDisplayField("Name", nameController.text),
              isEditing
                  ? _buildEditableField("Surname", surnameController)
                  : _buildDisplayField("Surname", surnameController.text),
              isEditing
                  ? _buildEditableField("Email", emailController)
                  : _buildDisplayField("Email", emailController.text),
              isEditing
                  ? _buildEditableField("Phone Number", phoneController)
                  : _buildDisplayField("Phone Number", phoneController.text),
              isEditing ? _buildEditingButtons() : _buildEditButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField(String label, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildDisplayField(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(label, style: TextStyle(color: Colors.black54)),
        subtitle:
            Text(value, style: TextStyle(fontSize: 16, color: Colors.black)),
      ),
    );
  }

  Widget _buildEditingButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: _onCancelPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.grey,
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          ),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _onSavePressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Color.fromARGB(255, 255, 182, 206),
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          ),
          child: Text('Save'),
        ),
      ],
    );
  }

  void _onCancelPressed() {
    setState(() {
      isEditing = false;
      nameController.text = initialName;
      surnameController.text = initialSurname;
      emailController.text = initialEmail;
      phoneController.text = initialPhoneNumber;
      // Reset the fields to the initial values
      _fetchAccount(); // Refresh data to original
    });
  }

  Widget _buildEditButton() {
    return ElevatedButton(
      onPressed: _onEditPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 255, 182, 206),
        padding: EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        'Edit',
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }

  void _onEditPressed() {
    setState(() {
      isEditing = true;
    });
  }
}