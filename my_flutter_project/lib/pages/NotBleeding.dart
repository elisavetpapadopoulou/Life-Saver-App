import 'package:flutter/material.dart';
import 'Homepage.dart'; // Ensure this is the correct path to your Homepage screen

class NotBleedingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => HomepageScreen())),
        ),
        title: Text('Not Bleeding Instructions'),
        backgroundColor: Color.fromARGB(255, 255, 182, 206),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Instruction details
              Text(
                "Activate Emergency Services",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                  "If the cut is deep, long, or involves a large wound, or if there's difficulty stopping the bleeding, seek professional medical help."),
              SizedBox(height: 20),
              Text(
                "Wash Hands",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                  "Before touching the cut or wound, wash hands thoroughly with soap and water to..."),
              SizedBox(height: 20),
              Text(
                "Clean the Wound",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                  "1. Gently Rinse: Rinse the cut under cool, running water to remove dirt and debris. Avoid using hot water, as it can cause more pain and damage to the tissue."),
              Text(
                  "2. Use Mild Soap: Use a mild soap to clean around the wound, but avoid getting soap inside the cut."),
              Text(
                  "3. Pat Dry: Gently pat the area dry with a clean cloth or sterile gauze."),
              SizedBox(height: 20),
              Text(
                "Apply Antiseptic",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                  "Apply an antiseptic solution, such as hydrogen peroxide or rubbing alcohol, to the wound to help prevent infection."),
              SizedBox(height: 20),
              Text(
                "Apply an Antibiotic Ointment",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                  "Apply a thin layer of over-the-counter antibiotic ointment to the cut. This can help prevent infection and promote..."),
              SizedBox(height: 20),
              Text(
                "Cover the Cut",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                  "Cover the cut with a sterile dressing, adhesive bandage, or sterile gauze pad to protect it from dirt and bacteria."),
              SizedBox(height: 20),
              Text(
                "Monitor for Signs of Infection",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                  "Monitor the cut for signs of infection, such as increased redness, swelling, or pus. Seek medical attention if signs of infection develop."),
              SizedBox(height: 20),
              Text(
                "Tetanus Shot",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                  "If the cut is deep or caused by a dirty or rusty object, check the person's tetanus vaccination status. A tetanus shot may be necessary if it's been more than five years since the last one."),
              SizedBox(height: 20),
              Text(
                "Do NOT Use Butter or Ice",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                  "Avoid using butter, ice, or other home remedies directly on the wound, as they can cause more harm than good."),
              // ... Add any additional instructions here
            ],
          ),
        ),
      ),
    );
  }
}
