import 'package:flutter/material.dart';
import 'package:myapp/services/api_service.dart';

class NewsReportScreen extends StatefulWidget {
  @override
  _NewsReportScreenState createState() => _NewsReportScreenState();
}

class _NewsReportScreenState extends State<NewsReportScreen> {
  final ApiService _apiService = ApiService();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _locationController = TextEditingController();
  String _photoUrl = '';

  void _submitNews() async {
    try {
      await _apiService.addNews(
        _titleController.text,
        _contentController.text,
        _locationController.text,
        _photoUrl,
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('News added successfully')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to add news')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Report News')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _titleController, decoration: InputDecoration(labelText: 'Title')),
            TextField(controller: _contentController, decoration: InputDecoration(labelText: 'Content')),
            TextField(controller: _locationController, decoration: InputDecoration(labelText: 'Location')),
            TextField(controller: TextEditingController(text: _photoUrl), decoration: InputDecoration(labelText: 'Photo URL')),
            ElevatedButton(onPressed: _submitNews, child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}
