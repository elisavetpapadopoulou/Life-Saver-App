import 'package:flutter/material.dart';
import 'Homepage.dart';

class AllergiesScreen extends StatefulWidget {
  @override
  _AllergiesScreenState createState() => _AllergiesScreenState();
}

class _AllergiesScreenState extends State<AllergiesScreen> {
  List<String> allergies = ['Bees', 'Pineapples', 'Strawberries'];

  void _showAddAllergyDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newAllergy = '';
        return AlertDialog(
          title: Text('Add Allergy'),
          content: TextField(
            onChanged: (value) {
              newAllergy = value;
            },
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Allergy Name',
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
                if (newAllergy.isNotEmpty) {
                  setState(() {
                    allergies.add(newAllergy);
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

  void _deleteAllergy(String allergy) {
    setState(() {
      allergies.remove(allergy);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.bookmark), // Your icon here
            SizedBox(width: 8), // For spacing
            Text('Allergies'),
          ],
        ),
        backgroundColor:
            Color.fromARGB(255, 255, 182, 206), // Custom pink color
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomepageScreen(),
                ),
              )
            },
          ),
        ],
      ),
      body: ListView.separated(
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
        backgroundColor:
            Color.fromARGB(255, 255, 182, 206), // Matching the AppBar color
      ),
    );
  }
}
