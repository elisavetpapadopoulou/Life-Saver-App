import 'package:flutter/material.dart';
import 'Homepage.dart';
import '../api_service.dart'; // Ensure this path is correct
import '../globals.dart';

class AllergiesScreen extends StatefulWidget {
  @override
  _AllergiesScreenState createState() => _AllergiesScreenState();
}

class _AllergiesScreenState extends State<AllergiesScreen> {
  List<String> allergies = [];
  bool isLoading = true;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    fetchAllergies();
  }

  Future<void> fetchAllergies() async {
    setState(() => isLoading = true);
    try {
      int userId = Global.userId;
      var fetchedAllergies = await _apiService.fetchUserAllergies(userId);
      setState(() {
        allergies = fetchedAllergies;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching allergies: $e');
      setState(() => isLoading = false);
    }
  }

  void _showAddAllergyDialog() {
    String newAllergy = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Allergy'),
          content: TextField(
            onChanged: (value) {
              newAllergy = value;
            },
            autofocus: true,
            decoration: InputDecoration(hintText: 'Allergy Name'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () async {
                if (newAllergy.isNotEmpty) {
                  Navigator.of(context).pop(); // Close the dialog immediately
                  try {
                    await _apiService.addUserAllergy(Global.userId, newAllergy);
                  } catch (e) {
                    print('Failed to add allergy: $e');
                  }
                  await fetchAllergies(); // Refetch allergies
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteAllergy(String allergy) async {
    try {
      await _apiService.removeUserAllergy(Global.userId, allergy);
    } catch (e) {
      print('Failed to delete allergy: $e');
      // Optionally, you can add UI feedback here, like a snackbar, to inform the user of the failure
    }

    // Fetch and update the allergies list immediately after deletion
    await fetchAllergies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Allergies'),
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
              itemCount: allergies.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(allergies[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.black),
                    onPressed: () => _deleteAllergy(allergies[index]),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddAllergyDialog,
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 255, 182, 206),
      ),
    );
  }
}
