enum TipoTarea { porHacer, haciendo, hecha }

class Tarea {
  final String titulo;
  final DateTime fechaCreacion;
  final TipoTarea tipoTarea;

  Tarea({
    required this.titulo,
    required this.fechaCreacion,
    this.tipoTarea = TipoTarea.porHacer,
  });

  // Método para convertir uuna Tarea a JSON
  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'fechaCreacion': fechaCreacion.millisecondsSinceEpoch,
      'tipoTarea': tipoTarea.index,
    };
  }

  // Método para crear una Tarea desde un JSON
  factory Tarea.fromJson(Map<String, dynamic> json) {
    return Tarea(
      titulo: json['titulo'],
      fechaCreacion: DateTime.fromMillisecondsSinceEpoch(json['fechaCreacion']),
      tipoTarea: TipoTarea.values[json['tipoTarea']],
    );
  }

  Tarea copyWith({
    String? titulo,
    DateTime? fechaCreacion,
    TipoTarea? tipoTarea,
  }) {
    return Tarea(
      titulo: titulo ?? this.titulo,
      fechaCreacion: fechaCreacion ?? this.fechaCreacion,
      tipoTarea: tipoTarea ?? this.tipoTarea,
    );
  }
}
