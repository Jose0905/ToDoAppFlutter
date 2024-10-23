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
    final List<Tarea> tareas = Provider.of<AgendaProvider>(context).tareas;
    final tipoTareaSeleccionada =
        Provider.of<AgendaProvider>(context).tipoTareaSeleccionada;

    // Filtrando la lista tareas según el tipo de tarea seleccionada.
    final List<Tarea> tareasPorTipo = tareas.where((tarea) {
      return tarea.tipoTarea == tipoTareaSeleccionada;
    }).toList();

    return ListView.builder(
      itemCount: tareasPorTipo.length,
      itemBuilder: (context, index) {
        Tarea tarea = tareasPorTipo[index];
        return CardTarea(tarea: tarea);
      },
    );
  }
}
