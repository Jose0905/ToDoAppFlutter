import 'package:flutter/material.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({
    super.key,
    super.backgroundColor = Colors.deepPurple,
    super.title = const Text(
      'To-Do App',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
    super.centerTitle = true,
  });
}
