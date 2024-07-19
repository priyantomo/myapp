import 'package:flutter/material.dart';
import 'package:myapp/widgets/custom_app_bar.dart';
import 'package:myapp/widgets/news_card.dart';
import 'package:myapp/models/news_report.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Data dummy untuk ilustrasi
    final List<NewsReport> newsReports = [
      NewsReport(
        title: 'Breaking News',
        content: 'Content of the breaking news...',
        location: 'Location',
        createdAt: DateTime.now(),
        status: 'Published',
      ),
      // Tambahkan lebih banyak laporan berita dummy sesuai kebutuhan
    ];

    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        children: newsReports.map((report) => NewsCard(newsReport: report)).toList(),
      ),
    );
  }
}
