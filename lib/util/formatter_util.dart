import 'package:intl/intl.dart';

class FormatterUtil {
  static String fechaConHora(DateTime fecha) {
    return DateFormat('dd/MM/yyyy HH:mm').format(fecha);
  }
}
