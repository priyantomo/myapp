import 'package:flutter/material.dart';
import 'package:myapp/services/api_service.dart';

class NewsDetailScreen extends StatefulWidget {
  final int newsId;

  NewsDetailScreen({required this.newsId});

  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  final ApiService _apiService = ApiService();
  final _commentController = TextEditingController();

  void _submitComment() async {
    try {
      await _apiService.addComment(widget.newsId, _commentController.text);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Komentar berhasil ditambahkan')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Gagal menambahkan komentar')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Berita')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Tampilkan detail berita di sini
            TextField(
              controller: _commentController,
              decoration: InputDecoration(labelText: 'Tambahkan komentar'),
            ),
            ElevatedButton(
              onPressed: _submitComment,
              child: Text('Kirim Komentar'),
            ),
          ],
        ),
      ),
    );
  }
}
