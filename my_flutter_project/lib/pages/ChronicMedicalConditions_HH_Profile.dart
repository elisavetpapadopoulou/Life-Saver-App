import 'package:flutter/material.dart';
import 'Homepage.dart'; // Replace with your actual Homepage.dart path

// Model class for a chronic medical condition
class ChronicCondition {
  String name;
  Map<String, bool> symptoms;

  ChronicCondition({
    required this.name,
    required this.symptoms,
  });
}

class ChronicMedicalConditionsScreen extends StatefulWidget {
  @override
  _ChronicMedicalConditionsScreenState createState() =>
      _ChronicMedicalConditionsScreenState();
}

class _ChronicMedicalConditionsScreenState
    extends State<ChronicMedicalConditionsScreen> {
  List<ChronicCondition> conditions = [];

  @override
  void initState() {
    super.initState();
    // Initialize your chronic conditions list here
    conditions.add(
      ChronicCondition(
        name: 'Asthma',
        symptoms: {'Shortness of Breath': true, 'Coughing': true},
      ),
    );
    // Add more conditions as needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 182, 206),
        title: Text('Chronic Medical Conditions'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomepageScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: conditions.length,
        itemBuilder: (context, index) {
          return ChronicConditionCard(condition: conditions[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNewCondition(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 255, 182, 206),
      ),
    );
  }

  void _addNewCondition(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChronicConditionDetailScreen(
          condition: ChronicCondition(name: '', symptoms: {}),
          onSave: (newCondition) {
            setState(() {
              conditions.add(newCondition);
            });
          },
        ),
      ),
    );
  }
}

class ChronicConditionCard extends StatelessWidget {
  final ChronicCondition condition;

  const ChronicConditionCard({Key? key, required this.condition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('• ${condition.name}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...condition.symptoms.keys.map(
              (symptom) => condition.symptoms[symptom]!
                  ? Text('  • $symptom',
                      style: TextStyle(fontStyle: FontStyle.italic))
                  : SizedBox.shrink(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChronicConditionDetailScreen(
                          condition: condition,
                          onSave: (editedCondition) {
                            // Implement save logic here
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChronicConditionDetailScreen extends StatefulWidget {
  final ChronicCondition condition;
  final Function(ChronicCondition) onSave;

  ChronicConditionDetailScreen(
      {Key? key, required this.condition, required this.onSave})
      : super(key: key);

  @override
  _ChronicConditionDetailScreenState createState() =>
      _ChronicConditionDetailScreenState();
}

class _ChronicConditionDetailScreenState
    extends State<ChronicConditionDetailScreen> {
  late TextEditingController _nameController;
  late Map<String, bool> _symptoms;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.condition.name);
    _symptoms = Map.from(widget.condition.symptoms);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 182, 206),
        title: Text('Edit Chronic Condition'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: _saveCondition,
          ),
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Condition Name'),
            ),
            Divider(),
            Text('Symptoms:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ..._symptoms.keys.map(
              (symptom) => CheckboxListTile(
                value: _symptoms[symptom],
                title: Text(symptom),
                onChanged: (bool? value) {
                  setState(() {
                    _symptoms[symptom] = value ?? false;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveCondition() {
    final editedCondition = ChronicCondition(
      name: _nameController.text,
      symptoms: _symptoms,
    );
    widget.onSave(editedCondition);
    Navigator.pop(context);

    // TODO: Add database saving logic here
  }
}
