class Quote {
  final int id;
  final String title;
  final String body;

  Quote({required this.id, required this.title, required this.body});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
