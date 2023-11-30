class Post {
  final String imagePath;
  final String title;
  final String content;
  final String timestamp;
  final String author;
  final String authorImage;

  Post({
    required this.imagePath,
    required this.title,
    required this.content,
    required this.timestamp,
    required this.author,
    required this.authorImage,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      imagePath: json['imagePath'],
      title: json['title'],
      content: json['content'],
      timestamp: json['timestamp'],
      author: json['author'],
      authorImage: json['authorImage'],
    );
  }
}
