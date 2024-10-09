import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/tarea.dart';
import 'package:todo_app/providers/agenda_provider.dart';

class NuevaTareaDialog extends StatefulWidget {
  const NuevaTareaDialog({super.key});

  @override
  State<NuevaTareaDialog> createState() => _NuevaTareaDialogState();
}

class _NuevaTareaDialogState extends State<NuevaTareaDialog> {
  String nombreTarea = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 18,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Crear nueva tarea',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ingrese una tarea',
              ),
              onChanged: (value) {
                log(value);
                setState(() {
                  nombreTarea = value;
                });
              },
            ),
            const SizedBox(
              height: 18,
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: FilledButton(
                onPressed: () {
                  log("Nueva tarea: $nombreTarea");
                  if (nombreTarea.isEmpty) {
                    Navigator.pop(context);
                    return;
                  }
                  if (nombreTarea.isNotEmpty) {
                    final nuevaTarea = Tarea(
                      titulo: nombreTarea,
                      fechaCreacion: DateTime.now(),
                    );
                    Provider.of<AgendaProvider>(context, listen: false)
                        .agregarTarea(nuevaTarea);
                  }
                  //Cerrar dialog
                  Navigator.pop(context);
                },
                child: const Text('Agregar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
