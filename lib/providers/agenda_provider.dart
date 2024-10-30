import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:todo_app/models/tarea.dart';

class AgendaProvider extends ChangeNotifier {
  final List<Tarea> _tareas = [];
  TipoTarea _tipoTareaSeleccionada = TipoTarea.porHacer;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  List<Tarea> get tareas => _tareas;
  TipoTarea get tipoTareaSeleccionada => _tipoTareaSeleccionada;

  Future<void> cargarTareas() async {
    // await _storage.deleteAll();
    final String? tareasGuardadas = await _storage.read(key: 'tareas');
    if (tareasGuardadas != null) {
      final List<dynamic> tareasJSON = json.decode(tareasGuardadas);

      final List<Tarea> tareas = tareasJSON.map((tareaJson) {
        return Tarea.fromJson(tareaJson);
      }).toList();

      _tareas.addAll(tareas);
      notifyListeners();
    }
  }

  void agregarTarea(Tarea tarea) {
    _tareas.add(tarea);
    guardarTareasStorage();
    notifyListeners();
  }

  void guardarTareasStorage() {
    List<Map<String, dynamic>> tareasJson = _tareas.map((tarea) {
      return tarea.toJson();
    }).toList();
    print(json.encode(tareasJson));
    _storage.write(key: 'tareas', value: json.encode(tareasJson));
  }

  void eliminarTarea(Tarea tarea) {
    final index = _tareas.indexOf(tarea);
    _tareas.removeAt(index);
    guardarTareasStorage();
    notifyListeners();
  }

  void editarTarea(String nuevoNombreTarea, Tarea tareaActual) {
    final index = _tareas.indexOf(tareaActual);
    _tareas[index] = _tareas[index].copyWith(titulo: nuevoNombreTarea);
    guardarTareasStorage();
    notifyListeners();
  }

  void cambiarTipoTareaSeleccionada(TipoTarea tipoTarea) {
    _tipoTareaSeleccionada = tipoTarea;
    notifyListeners();
  }

  void editarTipoTarea(TipoTarea nuevoTipoTarea, Tarea tareaActual) {
    final index = _tareas.indexOf(tareaActual);
    _tareas[index] = _tareas[index].copyWith(tipoTarea: nuevoTipoTarea);
    guardarTareasStorage();
    notifyListeners();
  }
}
