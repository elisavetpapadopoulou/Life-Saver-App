import 'package:flutter/material.dart';
import 'package:lifesaver/api_service.dart';
import 'article.dart';

class AllArticlesScreen extends StatefulWidget {
  final ApiService apiService;

  AllArticlesScreen({required this.apiService});

  @override
  _AllArticlesScreenState createState() => _AllArticlesScreenState();
}

class _AllArticlesScreenState extends State<AllArticlesScreen> {
  late Future<List<Article>> articlesFuture;

  @override
  void initState() {
    super.initState();
    articlesFuture = widget.apiService.fetchAllArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Articles'),
        backgroundColor: const Color.fromARGB(255, 255, 182, 206),
      ),
      body: FutureBuilder<List<Article>>(
        future: articlesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey), // Styled Progress Indicator
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.redAccent)),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No articles available.', style: TextStyle(color: Colors.grey)),
            );
          } else {
            final articles = snapshot.data!;
            return ListView.separated(
              itemCount: articles.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  leading: Icon(Icons.article, color: Colors.blueGrey), // Icon added
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
              separatorBuilder: (context, index) => Divider(), // Divider added
            );
          }
        },
      ),
    );
  }
}

