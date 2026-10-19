import 'package:test/test.dart';
import 'package:momento_1/reserva.dart';

void main() {
  group('Pruebas de la clase Reserva', () {
    test('calcula correctamente el total de la estadía', () {
      Reserva reserva = Reserva('R001', 'Carlos Pérez', 'Doble', 2, 100000);

      expect(reserva.calcularTotal(), 200000);
    });
  });
}
