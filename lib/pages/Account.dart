import 'package:flutter/material.dart';
import 'Homepage.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  TextEditingController nameController =
      TextEditingController(text: "Anastasia");
  TextEditingController surnameController =
      TextEditingController(text: "Collins");
  TextEditingController emailController =
      TextEditingController(text: "anastasia_collins@gmail.com");
  TextEditingController phoneNumberController =
      TextEditingController(text: "123-456-7890");
  TextEditingController originalNameController =
      TextEditingController(text: "Anastasia");
  TextEditingController originalSurnameController =
      TextEditingController(text: "Collins");
  TextEditingController originalEmailController =
      TextEditingController(text: "anastasia_collins@gmail.com");
  TextEditingController originalPhoneNumberController =
      TextEditingController(text: "123-456-7890");
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          child: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildArrowLeftRow(context),
                    SizedBox(height: 65),
                    _buildStateLayerColumn(
                      context,
                      icon: Icons.person,
                      headlineText: "Name",
                      controller: nameController,
                    ),
                    SizedBox(height: 65),
                    _buildStateLayerColumn(
                      context,
                      icon: Icons.lock,
                      headlineText: "Surname",
                      controller: surnameController,
                    ),
                    SizedBox(height: 65),
                    _buildStateLayerColumn(
                      context,
                      icon: Icons.email,
                      headlineText: "Email",
                      controller: emailController,
                    ),
                    SizedBox(height: 65),
                    _buildStateLayerColumn(
                      context,
                      icon: Icons.phone,
                      headlineText: "Phone number",
                      controller: phoneNumberController,
                    ),
                    SizedBox(height: 19),
                    if (isEditing)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Save logic here
                              setState(() {
                                isEditing = false;
                                // Add logic to save changes
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'Save',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Cancel editing logic here
                              setState(() {
                                isEditing = false;
                                // Restore original values
                                nameController.text =
                                    originalNameController.text;
                                surnameController.text =
                                    originalSurnameController.text;
                                emailController.text =
                                    originalEmailController.text;
                                phoneNumberController.text =
                                    originalPhoneNumberController.text;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 182, 206),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (!isEditing) SizedBox(height: 10),
                    if (!isEditing) // Add this condition to show the button only when not editing
                      ElevatedButton(
                        onPressed: () {
                          // Toggle between edit and display mode
                          setState(() {
                            isEditing = !isEditing;
                            // Store original values when entering editing mode
                            originalNameController.text = nameController.text;
                            originalSurnameController.text =
                                surnameController.text;
                            originalEmailController.text = emailController.text;
                            originalPhoneNumberController.text =
                                phoneNumberController.text;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            isEditing ? 'Save' : 'Edit',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildArrowLeftRow(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Icon(Icons.lock, size: 24),
        const Padding(
          padding: EdgeInsets.only(left: 13, top: 13, bottom: 3),
          child: Text(
            "Account",
            style: TextStyle(fontSize: 18),
          ),
        ),
        Spacer(),
        IconButton(
          icon: Icon(Icons.close, size: 24),
          onPressed: () {
            // Navigate to the homepage when the close button is pressed
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomepageScreen()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildStateLayerColumn(BuildContext context,
      {required IconData icon,
      required String headlineText,
      required TextEditingController controller}) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 182, 206),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.black,
              ),
              SizedBox(width: 10),
              Text(
                headlineText,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ],
          ),
          SizedBox(height: 4),
          isEditing
              ? TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: headlineText,
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                )
              : Text(
                  controller.text,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
        ],
      ),
    );
  }
}
