import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/tarea.dart';
import 'package:todo_app/providers/agenda_provider.dart';

class EditarTareaDialog extends StatefulWidget {
  final Tarea tarea;

  const EditarTareaDialog({
    super.key,
    required this.tarea,
  });

  @override
  State<EditarTareaDialog> createState() => _EditarTareaDialogState();
}

class _EditarTareaDialogState extends State<EditarTareaDialog> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController(text: widget.tarea.titulo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Editar Tarea',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                labelText: 'Ingrese un nombre',
                hintText: 'Editar tarea',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: FilledButton(
                onPressed: () {
                  Provider.of<AgendaProvider>(context, listen: false)
                      .editarTarea(
                    textEditingController.text,
                    widget.tarea,
                  );
                  Navigator.pop(context);
                },
                child: const Text('Editar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
