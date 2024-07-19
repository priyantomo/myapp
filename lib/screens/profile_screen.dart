import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/services/auth_service.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Pengguna'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await AuthService().signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: _user == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(_user!.photoURL ?? 'https://www.example.com/default_profile_image.png'),
                  ),
                  SizedBox(height: 16),
                  Text('Nama: ${_user!.displayName ?? 'Nama tidak tersedia'}', style: Theme.of(context).textTheme.headlineMedium),
                  SizedBox(height: 8),
                  Text('Email: ${_user!.email ?? 'Email tidak tersedia'}', style: Theme.of(context).textTheme.bodyMedium),
                  SizedBox(height: 8),
                  Text('UID: ${_user!.uid}', style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
    );
  }
}
