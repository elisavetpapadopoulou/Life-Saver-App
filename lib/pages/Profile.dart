import 'package:flutter/material.dart';
import 'PersonalData_Profile.dart';
import 'HealthHistory_Profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            backgroundColor: Color.fromARGB(255, 219, 143, 168),
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: 758,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 126,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 734),
                        Divider(),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CircleIconButton(
                      icon: Icons.person,
                      onTap: () {
                        // Handle profile button tap
                      },
                      iconColor: Colors.black,
                      backgroundColor: Colors.white,
                      size: 36.0,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey[100],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildElevatedColumn(
                          context,
                          _buildColumn(
                            context,
                            icon: Icons.person,
                            headlineText: "Personal Data",
                            supportingText: "Name, Gender, Age, Blood Type",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PersonalDataScreen(),
                                ),
                              );
                            },
                          ),
                          () {
                            // Navigate to PersonalDataScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PersonalDataScreen(),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 47),
                        _buildElevatedColumn(
                          context,
                          _buildColumn(
                            context,
                            icon: Icons.menu_book,
                            headlineText: "Health History",
                            supportingText:
                                "List of current, past and chronic medical conditions",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HealthHistoryScreen(),
                                ),
                              );
                            },
                          ),
                          () {
                            // Navigate to HealthHistoryScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HealthHistoryScreen(),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 57),
                        /*_buildElevatedColumn(
                          context,
                          _buildColumn(
                            context,
                            icon: Icons.bookmark,
                            headlineText: "Allergies",
                            supportingText:
                                "Supporting line text lorem ipsum dolor sit amet, consectetur.",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AllergiesScreen(),
                                ),
                              );
                            },
                          ),
                          () {
                            // Navigate to AllergiesScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllergiesScreen(),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 55),
                        _buildElevatedColumn(
                          context,
                          _buildColumn(
                            context,
                            icon: Icons.access_time,
                            headlineText: "Medications",
                            supportingText: "List of current medications",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MedicationsScreen(),
                                ),
                              );
                            },
                          ),
                          () {
                            // Navigate to MedicationsScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MedicationsScreen(),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 55),
                        */
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildElevatedColumn(
      BuildContext context, Widget child, VoidCallback onTap) {
    return Material(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }

  Widget _buildColumn(
    BuildContext context, {
    required IconData icon,
    required String headlineText,
    required String supportingText,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 22),
      child: Row(
        children: [
          Icon(icon, size: 24),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(headlineText, style: TextStyle(fontSize: 18)),
                SizedBox(height: 4),
                Text(supportingText, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color iconColor;
  final Color backgroundColor;
  final double size;

  const CircleIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.iconColor = Colors.black,
    required this.backgroundColor,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: CircleBorder(),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(
          icon,
          color: iconColor,
        ),
        iconSize: size,
      ),
    );
  }
}
