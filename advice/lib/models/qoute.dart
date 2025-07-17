class Quote {
  final String content;
  final String author;

  Quote({required this.content, required this.author});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      content: json['content'] ?? json['text'] ?? json['quote'] ?? '',
      author: json['author'] ?? json['author_name'] ?? json['by'] ?? 'Unknown',
    );
  }
}