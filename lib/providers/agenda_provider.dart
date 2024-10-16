import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:todo_app/models/tarea.dart';

class AgendaProvider extends ChangeNotifier {
  final List<Tarea> _tareas = [];

  List<Tarea> get tareas => _tareas;

  void agregarTarea(Tarea tarea) {
    // String fechaFormateada = DateFormat('dd/MM/yyyy HH:mm').format(fecha);
    _tareas.add(tarea);
    // _fechas.add(fechaFormateada.toString());
    notifyListeners();
  }

  void eliminarTarea(Tarea tarea) {
    final index = _tareas.indexOf(tarea);
    _tareas.removeAt(index);
    notifyListeners();
  }

  void editarTarea(String nuevoNombreTarea, Tarea tareaActual) {
    final index = _tareas.indexOf(tareaActual);
    _tareas[index] = _tareas[index].copyWith(titulo: nuevoNombreTarea);
    notifyListeners(); // _tareas.re
  }
}
