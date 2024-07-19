import 'package:flutter/material.dart';
import 'package:myapp/models/comment.dart';

class CommentCard extends StatelessWidget {
  final Comment comment;

  CommentCard({required this.comment});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(comment.content),
        subtitle: Text('By User ${comment.userId} on ${comment.createdAt}'),
      ),
    );
  }
}
