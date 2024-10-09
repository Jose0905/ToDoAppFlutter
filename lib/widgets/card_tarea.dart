import 'package:flutter/material.dart';
import 'package:todo_app/models/tarea.dart';
import 'package:todo_app/util/formatter_util.dart';
import 'package:todo_app/widgets/eliminar_tarea_dialog.dart';
import 'package:todo_app/widgets/home_icon_card.dart';

class CardTarea extends StatelessWidget {
  const CardTarea({
    super.key,
    required this.tarea,
  });

  final Tarea tarea;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tarea.titulo,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                      'Creado el ${FormatterUtil.fechaConHora(tarea.fechaCreacion)}'),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: const HomeIconCard(icon: Icons.edit),
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
                  child: const HomeIconCard(icon: Icons.delete),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
