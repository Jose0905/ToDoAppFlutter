import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/tarea.dart';
import 'package:todo_app/providers/agenda_provider.dart';
import 'package:todo_app/widgets/card_tarea.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tareas = Provider.of<AgendaProvider>(context).tareas;

    return ListView.builder(
      itemCount: tareas.length,
      itemBuilder: (context, index) {
        Tarea tarea = tareas[index];
        return CardTarea(tarea: tarea);
      },
    );
  }
}
