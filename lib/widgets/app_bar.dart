import 'package:flutter/material.dart';

/* scaffold requires to implement like this */
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  CustomAppBar({required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(title,
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300)),
    );
  }
}
