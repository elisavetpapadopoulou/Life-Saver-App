import 'package:flutter/material.dart';

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
  void dispose() {
    fullNameController.dispose();
    genderController.dispose();
    ageController.dispose();
    bloodTypeController.dispose();
    bloodRhFactorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeaderRow(context),
              SizedBox(height: 24.0),
              _buildEditableField("Full Name", fullNameController),
              SizedBox(height: 24.0),
              _buildGenderDropdown("Gender", genderController),
              SizedBox(height: 16.0),
              _buildEditableField("Age", ageController),
              SizedBox(height: 16.0),
              _buildBloodTypeDropdown("Blood Type", bloodTypeController),
              SizedBox(height: 16.0),
              _buildBloodRhFactorDropdown("Rh Factor", bloodRhFactorController),
              SizedBox(height: 24.0),
              if (!isEditing)
                ElevatedButton(
                  onPressed: _onEditPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 117, 68, 84),
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              if (isEditing)
                ElevatedButton(
                  onPressed: _onSavePressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 170, 107, 128),
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget _buildEditableField(String label, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          if (isEditing)
            TextFormField(
              controller: controller,
              style: TextStyle(fontSize: 16.0),
            )
          else
            Text(
              controller.text,
              style: TextStyle(fontSize: 16.0),
            ),
        ],
      ),
    );
  }

  Widget _buildGenderDropdown(String label, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          if (isEditing)
            DropdownButton<String>(
              value: controller.text,
              items: ['Male', 'Female']
                  .map((String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (String? value) {
                setState(() {
                  controller.text = value ?? '';
                });
              },
            )
          else
            Text(
              controller.text,
              style: TextStyle(fontSize: 16.0),
            ),
        ],
      ),
    );
  }

  Widget _buildBloodTypeDropdown(
      String label, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          if (isEditing)
            DropdownButton<String>(
              value: controller.text,
              items: ['O', 'A', 'B', 'AB']
                  .map((String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (String? value) {
                setState(() {
                  controller.text = value ?? '';
                });
              },
            )
          else
            Text(
              controller.text,
              style: TextStyle(fontSize: 16.0),
            ),
        ],
      ),
    );
  }

  Widget _buildBloodRhFactorDropdown(
      String label, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          if (isEditing)
            DropdownButton<String>(
              value: controller.text,
              items: ['+', '-']
                  .map((String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (String? value) {
                setState(() {
                  controller.text = value ?? '';
                });
              },
            )
          else
            Text(
              controller.text,
              style: TextStyle(fontSize: 16.0),
            ),
        ],
      ),
    );
  }

  void _onEditPressed() {
    setState(() {
      isEditing = true;
    });
  }

  void _onSavePressed() {
    setState(() {
      isEditing = false;
      fullName = fullNameController.text;
      gender = genderController.text;
      age = ageController.text;
      bloodType = bloodTypeController.text;
      bloodRhFactor = bloodRhFactorController.text;
    });
  }
}
