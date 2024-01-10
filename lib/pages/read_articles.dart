import 'package:flutter/material.dart';
import 'package:lifesaver/api_service.dart';
import 'article.dart';
import '../globals.dart';

class ReadArticlesScreen extends StatefulWidget {
  final ApiService apiService;

  ReadArticlesScreen({required this.apiService});

  @override
  _ReadArticlesScreenState createState() => _ReadArticlesScreenState();
}

class _ReadArticlesScreenState extends State<ReadArticlesScreen> {
  late Future<List<Article>> articlesFuture;

  @override
  void initState() {
    super.initState();
    // Assuming Global.userId holds the current user's ID
    articlesFuture = widget.apiService.fetchReadArticles(Global.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Read Articles'),
        backgroundColor: const Color.fromARGB(255, 255, 182, 206),
      ),
      body: FutureBuilder<List<Article>>(
        future: articlesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.redAccent)),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No read articles available.', style: TextStyle(color: Colors.grey)),
            );
          } else {
            final articles = snapshot.data!;
            return ListView.separated(
              itemCount: articles.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  leading: Icon(Icons.check, color: Colors.green), // Icon to indicate read articles
                  title: Text(articles[index].title),
                  subtitle: Text(articles[index].datePublished),
                  onTap: () {
                    // Navigate to the article details page
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ArticlePage(
                          apiService: widget.apiService,
                          article: articles[index],
                        ),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => Divider(),
            );
          }
        },
      ),
    );
  }
}
