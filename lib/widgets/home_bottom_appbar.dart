import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_app/widgets/home_button_text.dart';

class HomeBottomAppBar extends StatelessWidget {
  const HomeBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.deepPurple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          HomeButtonText(
            title: 'Por Hacer',
            onTap: () {
              log('Tap en Por Hacer');
            },
          ),
          HomeButtonText(
            title: 'Haciendo',
            onTap: () {
              log('Tap en Haciendo');
            },
          ),
          HomeButtonText(
            title: 'Hechas',
            onTap: () {
              log('Tap en Hecho');
            },
          ),
        ],
      ),
    );
  }
}
