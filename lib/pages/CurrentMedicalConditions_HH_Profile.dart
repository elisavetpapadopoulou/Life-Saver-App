import 'package:flutter/material.dart';

class HealthHistoryCurrentScreen extends StatelessWidget {
  const HealthHistoryCurrentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: SizedBox(
              height: 758.0,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 126.0,
                        vertical: 10.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(height: 734.0),
                          Divider(),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 24.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.grey[100],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildAppBar(context),
                          SizedBox(height: 8.0),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 20.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: Colors.grey[100],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildEditRow1(context),
                                SizedBox(height: 24.0),
                                Padding(
                                  padding: EdgeInsets.only(left: 12.0),
                                  child: _buildStateLayerRow1(
                                    context,
                                    chillsLabel: "Fever",
                                  ),
                                ),
                                SizedBox(height: 32.0),
                                _buildMedicalConditionRow(
                                  context,
                                  "Head Ache",
                                  Icons.favorite, // Different icon
                                ),
                                SizedBox(height: 32.0),
                                Padding(
                                  padding: EdgeInsets.only(left: 12.0),
                                  child: _buildStateLayerRow1(
                                    context,
                                    chillsLabel: "Chills",
                                  ),
                                ),
                                SizedBox(height: 17.0),
                                Align(
                                  alignment: Alignment.center,
                                  child: Divider(
                                    color: Colors.blueGrey[100],
                                    indent: 12.0,
                                    endIndent: 12.0,
                                  ),
                                ),
                                SizedBox(height: 14.0),
                                _buildEditRow2(context),
                                SizedBox(height: 17.0),
                                Padding(
                                  padding: EdgeInsets.only(left: 12.0),
                                  child: _buildStateLayerRow1(
                                    context,
                                    chillsLabel: "Fever",
                                  ),
                                ),
                                SizedBox(height: 32.0),
                                _buildMedicalConditionRow(
                                  context,
                                  "Dizziness",
                                  Icons.access_time, // Different icon
                                ),
                                SizedBox(height: 32.0),
                                _buildMedicalConditionRow(
                                  context,
                                  "Stomach Ache",
                                  Icons.star, // Different icon
                                ),
                                SizedBox(height: 17.0),
                                Align(
                                  alignment: Alignment.center,
                                  child: Divider(
                                    color: Colors.blueGrey[100],
                                    indent: 12.0,
                                    endIndent: 12.0,
                                  ),
                                ),
                                SizedBox(height: 34.0),
                              ],
                            ),
                          ),
                          SizedBox(height: 92.0),
                          ElevatedButton(
                            onPressed: () {
                              // Handle Add button press
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              padding: EdgeInsets.symmetric(
                                vertical: 16.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.add,
                                    color: Color.fromARGB(255, 255, 182, 206),
                                  ),
                                ),
                                Text(
                                  'Add',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Color.fromARGB(255, 255, 182, 206),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 14.0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor:
          const Color.fromARGB(255, 180, 89, 119), // Set the desired color here
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black), // Set color here
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Row(
        children: [
          Icon(Icons.person, color: Colors.black), // Set color here
          SizedBox(width: 13.0),
          Text("Current Medical Conditions"),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.close, color: Colors.black), // Set color here
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget _buildEditRow1(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 11.0),
            child: Text("Condition 1"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40.0,
                width: 40.0,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 34.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.deepPurple[500]!.withOpacity(0.08),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle Edit button press
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        padding: EdgeInsets.all(8.0),
                        shape: CircleBorder(),
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle Edit button press
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  shape: CircleBorder(),
                ),
                child: Text(
                  'Edit',
                  style: TextStyle(fontSize: 12.0, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEditRow2(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.0, right: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 4.0, bottom: 18.0),
            child: Text("Condition 2"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.0,
                width: 40.0,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 34.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.deepPurple[500]!.withOpacity(0.08),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle Edit button press
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        padding: EdgeInsets.all(8.0),
                        shape: CircleBorder(),
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle Edit button press
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  shape: CircleBorder(),
                ),
                child: Text(
                  'Edit',
                  style: TextStyle(fontSize: 12.0, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStateLayerRow1(BuildContext context,
      {required String chillsLabel}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.circle,
            color: Colors.deepPurple[500],
            size: 24.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.0, top: 3.0, bottom: 3.0),
            child: Text(
              chillsLabel,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.deepPurple[500],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicalConditionRow(
    BuildContext context,
    String conditionName,
    IconData iconData,
  ) {
    return Container(
      margin: EdgeInsets.only(left: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: Colors.black,
            size: 24.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.0, top: 3.0, bottom: 3.0),
            child: Text(
              conditionName,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
