import 'package:flutter/material.dart';

class HomeButtonText extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const HomeButtonText({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle bottomBarTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: bottomBarTextStyle,
      ),
    );
  }
}
