import 'package:flutter/material.dart';
import 'Homepage.dart'; // Replace with the correct path to your Homepage screen

class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({Key? key}) : super(key: key);

  @override
  _PersonalDataScreenState createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  bool isEditing = false;

  // Placeholder values for personal data
  String fullName = "John Doe";
  String gender = "Male";
  String age = "56";
  String bloodType = "O";
  String bloodRhFactor = "+";

  late TextEditingController fullNameController;
  late TextEditingController genderController;
  late TextEditingController ageController;
  late TextEditingController bloodTypeController;
  late TextEditingController bloodRhFactorController;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController(text: fullName);
    genderController = TextEditingController(text: gender);
    ageController = TextEditingController(text: age);
    bloodTypeController = TextEditingController(text: bloodType);
    bloodRhFactorController = TextEditingController(text: bloodRhFactor);
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
          title: Text('Personal Data'),
          actions: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pushReplacement(
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
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              isEditing
                  ? _buildEditableField("Full Name", fullNameController)
                  : _buildDisplayField("Full Name", fullName),
              isEditing
                  ? _buildGenderDropdown()
                  : _buildDisplayField("Gender", gender),
              isEditing
                  ? _buildEditableField("Age", ageController)
                  : _buildDisplayField("Age", age),
              isEditing
                  ? _buildBloodTypeDropdown()
                  : _buildDisplayField("Blood Type", bloodType),
              isEditing
                  ? _buildBloodRhFactorDropdown()
                  : _buildDisplayField("Rh Factor", bloodRhFactor),
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

  Widget _buildGenderDropdown() {
    return _buildDropdownField(
      "Gender",
      genderController,
      ['Male', 'Female'],
      (String? newValue) {
        genderController.text = newValue ?? '';
      },
    );
  }

  Widget _buildBloodTypeDropdown() {
    return _buildDropdownField(
      "Blood Type",
      bloodTypeController,
      ['O', 'A', 'B', 'AB'],
      (String? newValue) {
        bloodTypeController.text = newValue ?? '';
      },
    );
  }

  Widget _buildBloodRhFactorDropdown() {
    return _buildDropdownField(
      "Rh Factor",
      bloodRhFactorController,
      ['+', '-'],
      (String? newValue) {
        bloodRhFactorController.text = newValue ?? '';
      },
    );
  }

  Widget _buildDropdownField(
    String label,
    TextEditingController controller,
    List<String> items,
    ValueChanged<String?> onChanged,
  ) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField<String>(
        value: controller.text,
        onChanged: onChanged,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
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
            primary: Colors.grey,
            onPrimary: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          ),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _onSavePressed,
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 255, 182, 206),
            onPrimary: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          ),
          child: Text('Save'),
        ),
      ],
    );
  }

  Widget _buildEditButton() {
    return ElevatedButton(
      onPressed: _onEditPressed,
      style: ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 255, 182, 206),
        onPrimary: Colors.white,
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

  void _onCancelPressed() {
    setState(() {
      isEditing = false;
      // Reset the fields to the initial values
      fullNameController.text = fullName;
      genderController.text = gender;
      ageController.text = age;
      bloodTypeController.text = bloodType;
      bloodRhFactorController.text = bloodRhFactor;
    });
  }

  void _onSavePressed() {
    setState(() {
      isEditing = false;
      // Save changes and update the original values
      fullName = fullNameController.text;
      gender = genderController.text;
      age = ageController.text;
      bloodType = bloodTypeController.text;
      bloodRhFactor = bloodRhFactorController.text;
    });
  }
}
