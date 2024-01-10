import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'Homepage.dart';

// Model class for a medical condition
class Condition {
  String name;
  DateTime startDate;
  DateTime endDate;
  Map<String, bool> symptoms;

  Condition({
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.symptoms,
  });
}

class PastMedicalConditionsScreen extends StatefulWidget {
  @override
  _PastMedicalConditionsScreenState createState() =>
      _PastMedicalConditionsScreenState();
}

class _PastMedicalConditionsScreenState
    extends State<PastMedicalConditionsScreen> {
  List<Condition> conditions = [];

  @override
  void initState() {
    super.initState();
    // Initialize your conditions list here, possibly with data from a database or API
    conditions.add(
      Condition(
        name: 'Old Flu',
        startDate: DateTime.now().subtract(Duration(days: 365)),
        endDate: DateTime.now().subtract(Duration(days: 355)),
        symptoms: {'Fever': true, 'Cough': true, 'Fatigue': false},
      ),
      // Add more past conditions here if needed
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 182, 206),
        title: Text('Past Medical Conditions'),
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
          Condition condition = conditions[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• ${condition.name}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(
                      '  ${DateFormat.yMMMd().format(condition.startDate)} - ${DateFormat.yMMMd().format(condition.endDate)}'),
                  ...condition.symptoms.keys.map(
                    (symptom) => condition.symptoms[symptom]!
                        ? Text('  • $symptom',
                            style: TextStyle(fontStyle: FontStyle.italic))
                        : SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// You can reuse the ConditionDetailScreen from CurrentMedicalConditionsScreen
// for editing the past conditions if needed.
class ConditionDetailScreen extends StatefulWidget {
  final Condition condition;
  final Function(Condition) onSave;

  ConditionDetailScreen(
      {Key? key, required this.condition, required this.onSave})
      : super(key: key);

  @override
  _ConditionDetailScreenState createState() => _ConditionDetailScreenState();
}

class _ConditionDetailScreenState extends State<ConditionDetailScreen> {
  late TextEditingController _nameController;
  late DateTime _startDate;
  late DateTime _endDate;
  late Map<String, bool> _symptoms;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.condition.name);
    _startDate = widget.condition.startDate;
    _endDate = widget.condition.endDate;
    _symptoms = Map.from(widget.condition.symptoms);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 182, 206),
        title: Text('Edit Condition'),
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
            _buildDateField('Start Date', _startDate,
                (pickedDate) => setState(() => _startDate = pickedDate)),
            _buildDateField('End Date', _endDate,
                (pickedDate) => setState(() => _endDate = pickedDate)),
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

  Widget _buildDateField(
      String label, DateTime date, ValueChanged<DateTime> onDateChanged) {
    return ListTile(
      title: Text('$label: ${DateFormat.yMMMd().format(date)}'),
      trailing: Icon(Icons.calendar_today),
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: date,
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (picked != null && picked != date) {
          onDateChanged(picked);
        }
      },
    );
  }

  void _saveCondition() {
    final editedCondition = Condition(
      name: _nameController.text,
      startDate: _startDate,
      endDate: _endDate,
      symptoms: _symptoms,
    );
    widget.onSave(editedCondition);
    Navigator.pop(context);

    // TODO: Add database saving logic here
    // This is where you would typically make a call to your backend service or database
    // to save the edited or new condition.
  }
}
