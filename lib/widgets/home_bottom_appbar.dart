import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/tarea.dart';
import 'package:todo_app/widgets/home_button_text.dart';

import '../providers/agenda_provider.dart';

class HomeBottomAppbar extends StatelessWidget {
  const HomeBottomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tipoTareaSeleccionada =
        Provider.of<AgendaProvider>(context).tipoTareaSeleccionada;

    return BottomAppBar(
      color: Colors.deepPurple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          HomeButtonText(
            title: 'Por Hacer',
            onTap: () {
              Provider.of<AgendaProvider>(context, listen: false)
                  .cambiarTipoTareaSeleccionada(TipoTarea.porHacer);
            },
            isSelected: tipoTareaSeleccionada == TipoTarea.porHacer,
          ),
          HomeButtonText(
            title: 'Haciendo',
            onTap: () {
              Provider.of<AgendaProvider>(context, listen: false)
                  .cambiarTipoTareaSeleccionada(TipoTarea.haciendo);
            },
            isSelected: tipoTareaSeleccionada == TipoTarea.haciendo,
          ),
          HomeButtonText(
            title: 'Hechas',
            onTap: () {
              Provider.of<AgendaProvider>(context, listen: false)
                  .cambiarTipoTareaSeleccionada(TipoTarea.hecha);
            },
            isSelected: tipoTareaSeleccionada == TipoTarea.hecha,
          ),
        ],
      ),
    );
  }
}
