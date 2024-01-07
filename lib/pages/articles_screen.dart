import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'article.dart'; // Replace with the correct path to your Article model

class ArticlesScreen extends StatefulWidget {
  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  late Future<List<Article>> futureArticles;

  @override
  void initState() {
    super.initState();
    futureArticles = fetchArticles();
  }

Future<List<Article>> fetchArticles() async {
  print('fetchArticles called'); // This should print when the method is called
  try {
    final response = await http.get(
      Uri.parse('http://localhost:7070/articles'),
    ).timeout(const Duration(seconds: 30));
    print('Response status: ${response.statusCode}'); // Check the status code
    print('Response body: ${response.body}'); // This should print the response body
    List articlesJson = json.decode(response.body);
    return articlesJson.map((json) => Article.fromJson(json)).toList();
  } catch (e) {
    print('Caught error: $e'); // If there's an error, it will be printed here
    rethrow;
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recent Articles'),
      ),
      body: FutureBuilder<List<Article>>(
        future: futureArticles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No articles found'));
          } else {
            return ListView(
              children: snapshot.data!.map((article) => ListTile(
                leading: Icon(Icons.article),
                title: Text(article.title),
                onTap: () {
                  // TODO: Navigate to the article detail page
                },
              )).toList(),
            );
          }
        },
      ),
    );
  }
}
