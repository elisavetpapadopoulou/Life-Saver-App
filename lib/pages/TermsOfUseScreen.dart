import 'package:flutter/material.dart';

class TermsOfUseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms of Use'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 255, 182, 206),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(), // Ensure it's always scrollable
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Welcome to LifeSaver: Your Emergency Medical Companion! Before using our services, '
          'please take a moment to read our Terms of Use.\n\n'
          '1. Acceptance of Terms: By accessing or using LifeSaver, you agree to abide by these Terms of '
          'Use and all applicable laws and regulations. If you do not agree with any part of these terms, '
          'please refrain from using our services.\n\n'
          '2. Use of the Service: You must be at least 16 years old to use LifeSaver. Your use of the service '
          'is at your sole risk. The service is provided on an "as is" and "as available" basis.\n\n'
          '3. Privacy: Protecting your privacy is important to us. Our Privacy Policy outlines how we collect, '
          'use, disclose, and manage your personal information. Please review our privacy policy to understand our practices.\n\n'
          '4. User Conduct: You agree not to engage in any activity that may disrupt or interfere with the '
          'functionality of LifeSaver. This includes but is not limited to violating laws, infringing on intellectual '
          'property rights, or engaging in harmful activities.\n\n'
          '5. Termination: We reserve the right to terminate or suspend your access to LifeSaver at our '
          'discretion, without notice, for any reason, including if you violate these Terms of Use.\n\n'
          '6. Changes to Terms: We may update these Terms of Use from time to time. Any changes will be '
          'effective immediately upon posting. Your continued use of LifeSaver after changes are posted constitutes '
          'your acceptance of the modified terms.\n\n'
          '7. Contact Us: If you have any questions or concerns regarding these Terms of Use, please contact us at lifesaver@gmail.com.\n\n'
          'Thank you for using LifeSaver!',
          style: TextStyle(
            fontSize: 14, // Set your desired text size
            // You can add more styling as required
          ),
        ),
      ),
    );
  }
}


