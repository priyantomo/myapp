import 'package:flutter/material.dart';
import 'package:myapp/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  final AuthService _authService = AuthService(); // Inisialisasi AuthService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              User? user = await _authService.signInWithGoogle();
              if (user != null) {
                Navigator.pushReplacementNamed(context, '/home');
              } else {
                // Jika pengguna null, tampilkan pesan kesalahan atau lakukan penanganan
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Gagal login dengan Google')),
                );
              }
            } catch (e) {
              // Tangani kesalahan jika terjadi selama proses login
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Terjadi kesalahan: ${e.toString()}')),
              );
            }
          },
          child: Text('Login dengan Google'),
        ),
      ),
    );
  }
}
