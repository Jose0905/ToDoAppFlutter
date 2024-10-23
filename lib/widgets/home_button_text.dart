import 'package:flutter/material.dart';

class HomeButtonText extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final bool isSelected;

  const HomeButtonText({
    super.key,
    required this.title,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle bottomBarTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: isSelected ? FontWeight.w800 : FontWeight.w400,
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
