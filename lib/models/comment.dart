class Comment {
  final String id;
  final String content;
  final DateTime createdAt;
  final String newsId;
  final String userId;

  Comment({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.newsId,
    required this.userId,
  });

  // Methods to convert to/from JSON can be added here
}
