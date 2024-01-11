import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'not_breathing.dart';
import 'adult.dart';
import 'child.dart';
import 'infant.dart';

class AgePage extends StatelessWidget {
  const AgePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop()),
        backgroundColor: const Color.fromARGB(255, 255, 182, 206),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const HomepageScreen()),
            ),
          ),
        ],
        title: const Text('How old is the person?'),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 182, 206),
      body: Padding(
        // Removed const from Padding
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Click on the age status of the person in need of CPR',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 20),
            Card(
              child: Column(
                children: [
                  _buildAgeButton(context, 'An adult', const AdultCprPage()),
                  _buildAgeButton(context, 'A child', const ChildCprPage()),
                  _buildAgeButton(context, 'An infant', const InfantCprPage()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAgeButton(
      BuildContext context, String label, Widget destinationPage) {
    return ListTile(
      title: Text(label),
      onTap: () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => destinationPage),
      ),
    );
  }
}
