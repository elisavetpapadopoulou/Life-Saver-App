import 'package:flutter/material.dart';
import 'package:lifesaver/api_service.dart';
import '../globals.dart'; // Assuming you have global variables defined here

class ArticlePage extends StatefulWidget {
  final ApiService apiService; // Pass ApiService as an argument
  final Article article; // Pass the selected Article

  ArticlePage({required this.apiService, required this.article});

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  bool isFinished = false;

  Future<void> finishArticle() async {
    // Implement logic to gain 10 points for finishing the article
    try {
      final userId = Global.userId; // Assuming you have a global user ID
      // The API call to finish the article
      bool finished = await widget.apiService.finishArticle(userId, widget.article.articleId);
      if (finished) {
        setState(() {
          isFinished = true;
        });
        // Possibly show a message or execute other logic upon successful completion
      }
    } catch (e) {
      // Handle any errors here, such as showing an error message
      print('Error finishing article: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.title),
        backgroundColor: const Color.fromARGB(255, 255, 182, 206),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.article.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.article.content,
                style: TextStyle(fontSize: 16),
              ),
            ),
            if (!isFinished)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: finishArticle,
                  child: Text('Finish'),
                ),
              ),
            if (isFinished)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Thank you for finishing the article! You have gained 10 points.',
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
