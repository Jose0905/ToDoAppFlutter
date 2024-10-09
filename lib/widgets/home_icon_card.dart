import 'package:flutter/material.dart';

class HomeIconCard extends StatelessWidget {
  final IconData icon;
  const HomeIconCard({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10),
        ),
        width: 50,
        height: 50,
        child: Icon(
          icon,
          size: 40,
        ),
      ),
    );
  }
}
