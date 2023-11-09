class News {
  final String id;
  final String imagePath;
  final String newsletter;
  final String title;
  final String subtitle;
  final String body;

  News({
    required this.id,
    required this.imagePath,
    required this.newsletter,
    required this.title,
    required this.subtitle,
    required this.body,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'],
      imagePath: json['imagePath'],
      newsletter: json['newsletter'],
      title: json['title'],
      subtitle: json['subtitle'],
      body: json['body'],
    );
  }
}
