import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'Pictures.dart';

class BleedingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Color.fromARGB(255, 255, 182, 206),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomepageScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInstruction(
                title: "Activate Emergency Services",
                content:
                    "Call emergency services166, from the icon below immediately. Report the incident and follow their advice.",
                context: context,
                showButton: false),
            _buildInstruction(
                title: "Do NOT Remove Blood-Soaked Dressings!",
                content:
                    "Avoid removing blood-soaked dressings once applied. It may disrupt clot formation and worsen bleeding.",
                context: context,
                showButton: false),
            _buildInstruction(
                title: "Keep yourself safe!",
                content:
                    "Protect yourself from exposure to blood by using gloves if available.",
                context: context,
                showButton: false),
            _buildInstruction(
                title: "Apply Direct Pressure",
                content:
                    "Use a clean cloth, sterile dressing, or your hands to apply direct pressure on the wound. Press down firmly and maintain constant pressure.",
                context: context,
                showButton: false),
            _buildInstruction(
                title: "Use a Bandage or Cloth",
                content:
                    "If the initial cloth becomes soaked with blood, do not remove it. Add additional layers of cloth or bandages on top and continue applying direct pressure.",
                context: context,
                showButton: false),
            _buildInstruction(
                title: "Elevate the Injured Limb",
                content:
                    "If the bleeding is from an extremity (arm or leg), try to elevate the limb above the level of the heart. This can help reduce blood flow to the area and minimize bleeding.",
                context: context,
                showButton: false),
            _buildInstruction(
              title: "Use Pressure Points (If Necessary)",
              content:
                  "If direct pressure alone is not stopping the bleeding, consider applying pressure to a pressure point. Pressure points are areas on the body where a major artery lies close to the skin's surface. Common pressure points include the brachial artery (arm) and femoral artery (groin). Apply pressure with your fingers or thumb until help arrives.",
              context: context,
              showButton: true,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PressurePointsScreen()),
                );
              },
            ),

            _buildInstruction(
              title: "Use Tourniquet (As a Last Resort)",
              content:
                  "If bleeding is severe and cannot be controlled by direct pressure or pressure points, consider using a tourniquet as a last resort. Place the tourniquet 2-3 inches above the wound, never on a joint, and tighten until bleeding stops. Note the time when the tourniquet was applied.",
              context: context,
              showButton: true,
              onPressed: () {
                // Navigate to the tourniquet instruction page

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TourniquetInstructionScreen()),
                );
              },
            ),
            _buildInstruction(
              title: "Stay with the Person",
              content:
                  "Stay with the injured person and continue to apply pressure until professional help arrives. Provide reassurance and keep the person calm.",
              context: context,
              showButton: false,
            ),
            // Add other instructions as needed
          ],
        ),
      ),
    );
  }

  Widget _buildInstruction({
    required String title,
    required String content,
    required BuildContext context,
    bool showButton = false,
    VoidCallback? onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(fontSize: 16),
          ),
          if (showButton)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: onPressed, // Use the provided callback
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 255, 182, 206),
                  shape: StadiumBorder(),
                ),
                child: Text('Press for instructions'),
              ),
            ),
        ],
      ),
    );
  }
}

class BleedingInstruction {
  final String title;
  final String content;
  final bool isImportant;

  BleedingInstruction({
    required this.title,
    required this.content,
    this.isImportant = false,
  });
}
