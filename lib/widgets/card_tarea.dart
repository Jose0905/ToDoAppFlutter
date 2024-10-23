import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/agenda_provider.dart';
import 'package:todo_app/util/formatter_util.dart';

import '../models/tarea.dart';
import 'editar_tarea_dialog.dart';
import 'eliminar_tarea_dialog.dart';

class CardTarea extends StatelessWidget {
  const CardTarea({
    super.key,
    required this.tarea,
  });

  final Tarea tarea;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (tarea.tipoTarea != TipoTarea.porHacer)
                      FilledButton(
                        onPressed: () {
                          Provider.of<AgendaProvider>(context, listen: false)
                            ..editarTipoTarea(
                              TipoTarea.porHacer,
                              tarea,
                            )
                            ..cambiarTipoTareaSeleccionada(TipoTarea.porHacer);
                          Navigator.pop(context);
                        },
                        child: const Text('Marcar como por hacer'),
                      ),
                    if (tarea.tipoTarea != TipoTarea.haciendo)
                      FilledButton(
                        onPressed: () {
                          Provider.of<AgendaProvider>(context, listen: false)
                            ..editarTipoTarea(
                              TipoTarea.haciendo,
                              tarea,
                            )
                            ..cambiarTipoTareaSeleccionada(TipoTarea.haciendo);
                          Navigator.pop(context);
                        },
                        child: const Text('Marcar como haciendo'),
                      ),
                    if (tarea.tipoTarea != TipoTarea.hecha)
                      FilledButton(
                        onPressed: () {
                          Provider.of<AgendaProvider>(context, listen: false)
                            ..editarTipoTarea(
                              TipoTarea.hecha,
                              tarea,
                            )
                            ..cambiarTipoTareaSeleccionada(TipoTarea.hecha);
                          Navigator.pop(context);
                        },
                        child: const Text('Marcar como hecha'),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tarea.titulo),
                    Text(
                      'Creado: ${FormatterUtil.fechaConHora(tarea.fechaCreacion)}',
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return EditarTareaDialog(
                            tarea: tarea,
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Icon(Icons.edit),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return EliminarTareaDialog(tarea: tarea);
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Icon(Icons.delete),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
