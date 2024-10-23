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
