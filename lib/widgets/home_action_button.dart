// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_app/widgets/nueva_tarea_dialog.dart';

class HomeActionButton extends StatelessWidget {
  const HomeActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.indigoAccent.shade400,
      onPressed: () {
        mostrarDialogo(context);
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  Future<dynamic> mostrarDialogo(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return const NuevaTareaDialog();
      },
    );
  }
}
