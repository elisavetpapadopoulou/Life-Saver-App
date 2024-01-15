import 'package:flutter/material.dart';
import 'package:lifesaver/api_service.dart'; // Ensure this is the correct path
import 'dart:convert';
import 'Homepage.dart'; // Replace with the correct path to your Homepage screen
import '../globals.dart';

class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({Key? key}) : super(key: key);

  @override
  _PersonalDataScreenState createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
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
  late TextEditingController genderController;
  late TextEditingController ageController;
  late TextEditingController bloodTypeController;
  late TextEditingController bloodRhFactorController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    surnameController = TextEditingController();
    genderController = TextEditingController();
    ageController = TextEditingController();
    bloodTypeController = TextEditingController();
    bloodRhFactorController = TextEditingController();
    _fetchPersonalData();
  }

  void _fetchPersonalData() async {
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
        genderController.text = initialGender;
        ageController.text = initialAge.toString();
        bloodTypeController.text = initialBloodType;
        bloodRhFactorController.text = initialBloodRhFactor;
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
      'email': initialEmail,
      'phone_number': initialPhoneNumber,
      'gender': genderController.text,
      'age': int.tryParse(ageController.text) ?? 0,
      'blood_type': bloodTypeController.text, // Changed from bloodType
      'rh_factor': bloodRhFactorController.text, // Changed from bloodRhFactor
      'points': initialPoints
    };

    final response =
        await _apiService.updateUserProfile(Global.userId, updateData);

    if (response.statusCode == 200) {
      // Refresh data after saving
      _fetchPersonalData();
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
    // The build method with your UI code
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 182, 206),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text('Personal Data'),
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
              isEditing
                  ? _buildEditableField("Name", nameController)
                  : _buildDisplayField("Name", nameController.text),
              isEditing
                  ? _buildEditableField("Surname", surnameController)
                  : _buildDisplayField("Surname", surnameController.text),
              isEditing
                  ? _buildEditableField("Gender", genderController)
                  : _buildDisplayField("Gender", genderController.text),
              isEditing
                  ? _buildEditableField("Age", ageController)
                  : _buildDisplayField("Age", ageController.text),
              isEditing
                  ? _buildEditableField("Blood Type", bloodTypeController)
                  : _buildDisplayField("Blood Type", bloodTypeController.text),
              isEditing
                  ? _buildEditableField("Rh Factor", bloodRhFactorController)
                  : _buildDisplayField(
                      "Rh Factor", bloodRhFactorController.text),
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
      genderController.text = initialGender;
      ageController.text = initialAge.toString();
      bloodTypeController.text = initialBloodType;
      bloodRhFactorController.text =
          initialBloodRhFactor; // Reset the fields to the initial values
      _fetchPersonalData(); // Refresh data to original
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
