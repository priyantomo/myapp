import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Citizen Journalism App'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
