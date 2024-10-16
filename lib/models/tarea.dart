class Tarea {
  final String titulo;
  final DateTime fechaCreacion;

  Tarea({
    required this.titulo,
    required this.fechaCreacion,
  });

  Tarea copyWith({String? titulo, DateTime? fechaCreacion}) {
    return Tarea(
      titulo: titulo ?? this.titulo,
      fechaCreacion: fechaCreacion ?? this.fechaCreacion,
    );
  }
}
