import 'package:flutter/material.dart';
import 'package:myapp/services/auth_service.dart'; // Mengimpor AuthService

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true; // Nilai default, kamu dapat memuat ini dari preferensi yang disimpan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pengaturan Notifikasi', style: Theme.of(context).textTheme.headlineMedium),
            SwitchListTile(
              title: Text('Aktifkan Notifikasi'),
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
                // Simpan pengaturan notifikasi jika perlu
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await AuthService().signOut();
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text('Keluar dari Akun'),
            ),
          ],
        ),
      ),
    );
  }
}
