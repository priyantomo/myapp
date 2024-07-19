import 'package:flutter/material.dart';
import 'package:myapp/models/news_report.dart';

class NewsCard extends StatelessWidget {
  final NewsReport newsReport;

  NewsCard({required this.newsReport});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(newsReport.title),
        subtitle: Text(newsReport.content),
        trailing: Text(newsReport.location),
        onTap: () {
          // Tindakan saat kartu berita diketuk
        },
      ),
    );
  }
}
