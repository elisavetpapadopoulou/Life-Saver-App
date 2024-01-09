import 'package:flutter/material.dart';
import 'Homepage.dart';
import '../api_service.dart'; // Ensure this path is correct
import '../globals.dart';

class MedicationScreen extends StatefulWidget {
  @override
  _MedicationScreenState createState() => _MedicationScreenState();
}

class _MedicationScreenState extends State<MedicationScreen> {
  List<String> medications = [];
  bool isLoading = true;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    fetchMedications();
  }

  Future<void> fetchMedications() async {
    setState(() => isLoading = true);
    try {
      int userId = Global.userId;
      var fetchedMeds = await _apiService.fetchUserMedications(userId);
      setState(() {
        medications = fetchedMeds;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching medications: $e');
      setState(() => isLoading = false);
    }
  }

  void _showAddMedicationDialog() {
    String newMedication = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Medication'),
          content: TextField(
            onChanged: (value) {
              newMedication = value;
            },
            autofocus: true,
            decoration: InputDecoration(hintText: 'Medication Name'),
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
              onPressed: () async {
                if (newMedication.isNotEmpty) {
                  try {
                    await _apiService.addUserMedication(
                        Global.userId, newMedication);
                  } catch (e) {
                    print('Failed to add medication: $e');
                  }
                  await fetchMedications();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _removeMedication(String medication) async {
    try {
      await _apiService.removeUserMedication(Global.userId, medication);
    } catch (e) {
      print('Failed to remove medication: $e');
    }
    await fetchMedications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medication', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 255, 182, 206),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomepageScreen()),
              );
            },
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: medications.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(medications[index]),
                  trailing: TextButton(
                    child:
                        Text('Remove', style: TextStyle(color: Colors.black)),
                    onPressed: () => _removeMedication(medications[index]),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddMedicationDialog,
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 255, 182, 206),
      ),
    );
  }
}
