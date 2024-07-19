import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/news_report_screen.dart';
import 'screens/news_detail_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Inisialisasi Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Majalah Gelora Bumi Kartini',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/news_report': (context) => NewsReportScreen(),
        '/profile': (context) => ProfileScreen(),
        '/settings': (context) => SettingsScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/news_detail') {
          final args = settings.arguments as Map<String, dynamic>;
          final newsId = args['newsId'] as int;

          return MaterialPageRoute(
            builder: (context) => NewsDetailScreen(newsId: newsId),
          );
        }
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      },
    );
  }
}
