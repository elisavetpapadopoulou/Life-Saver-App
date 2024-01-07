import 'package:flutter/material.dart';
import 'Homepage.dart';

class MedicationScreen extends StatefulWidget {
  @override
  _MedicationScreenState createState() => _MedicationScreenState();
}

class _MedicationScreenState extends State<MedicationScreen> {
  List<String> medications = ['Augmentin', 'Epilepsy Pills'];

  void _showAddMedicationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newMedication = '';
        return AlertDialog(
          title: Text('Add Medication'),
          content: TextField(
            onChanged: (value) {
              newMedication = value;
            },
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Medication Name',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                if (newMedication.isNotEmpty) {
                  setState(() {
                    medications.add(newMedication);
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _removeMedication(String medication) {
    setState(() {
      medications.remove(medication);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.medical_services,
                color: Colors.white), // Your chosen icon
            SizedBox(width: 8), // For spacing
            Text(
              'Medication',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 255, 182, 206),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomepageScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: medications.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(medications[index]),
            trailing: TextButton(
              child: Text('Remove', style: TextStyle(color: Colors.black)),
              onPressed: () => _removeMedication(medications[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddMedicationDialog,
        child: Icon(Icons.add),
        backgroundColor: Colors.white,
      ),
    );
  }
}
