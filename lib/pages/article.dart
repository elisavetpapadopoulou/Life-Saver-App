class Article {
  final int id;
  final String title;
  final String content;
  final DateTime datePublished;

  Article({required this.id, required this.title, required this.content, required this.datePublished});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['article_id'],
      title: json['title'],
      content: json['content'],
      datePublished: DateTime.parse(json['date_published']),
    );
  }
}
