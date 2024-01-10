import 'package:flutter/material.dart';
import 'all_articles.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:lifesaver/api_service.dart';
import '../globals.dart';
import 'read_articles.dart';

class EducateYourselfScreen extends StatefulWidget {
  @override
  _EducateYourselfScreenState createState() => _EducateYourselfScreenState();
}

class _EducateYourselfScreenState extends State<EducateYourselfScreen> {
  int userPoints = 0;
  String badge = '';
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    // Fetch user points and badge on screen initialization
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final userId = Global.userId;
    final points = await _apiService.fetchUserPoints(userId);
    final badgeName = await _apiService.fetchUserBadge(userId);

    setState(() {
      userPoints = points;
      badge = badgeName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Educate Yourself'),
        backgroundColor: const Color.fromARGB(255, 255, 182, 206),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
                        // Welcoming Text
            Text(
              'Welcome to the Educate Yourself Section!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Explore our articles to gain knowledge and earn points. '
                'Learning about first aid can be a lifesaver in emergencies. '
                'Start your educational journey now!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Badge Holder Widget
            TrophyHolder(badge: badge),

            // Display Badge Name
            Text(
              badge.isNotEmpty ? badge : 'No Badge',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            // Display User Points
            Text(
              'Points: $userPoints',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),

            // Buttons to Navigate to Articles
            ElevatedButton(
              onPressed: () {
                // Navigate to all articles
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AllArticlesScreen(apiService: _apiService),
                  ),
                );
              },
              child: Text('All Articles'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to articles the user has already read
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReadArticlesScreen(apiService: _apiService),
                  ),
                );
              },
              child: Text('Read Articles'),
            ),
          ],
        ),
      ),
    );
  }
}

class TrophyHolder extends StatelessWidget {
  final String badge; // User's badge, e.g., 'Gold', 'Silver', 'Bronze', or 'No Badge'

  TrophyHolder({required this.badge});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Gold Trophy
        Icon(
          Icons.emoji_events,
          color: badge == 'Gold' ? Colors.yellow : Colors.grey, // Set color based on badge
          size: 32.0,
        ),
        // Silver Trophy
        Icon(
          Icons.emoji_events,
          color: badge == 'Silver' ? Colors.blueGrey : Colors.grey, // Set color based on badge
          size: 32.0,
        ),
        // Bronze Trophy
        Icon(
          Icons.emoji_events,
          color: badge == 'Bronze' ? Colors.brown : Colors.grey, // Set color based on badge
          size: 32.0,
        ),
      ],
    );
  }
}
