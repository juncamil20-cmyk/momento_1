import 'dart:io';

import 'package:momento_1/gestor_reservas.dart';

void main(List<String> arguments) {
  int opcion = -1;

  while (opcion != 0) {
    print('\n============');
    print('\n============');
    print('==============');

    print('1. Registrar reserva');
    print('2. Consultar reservas');
    print('3. Buscar reserva por código');
    print('4. Buscar reserva por nombre');
    print('5. Modificar reserva');
    print('6. Eliminar reserva');
    print('0. Salir');

    stdout.write('\nSeleccione una opcion');
    String entrada = stdin.readLineSync() ?? '';

    opcion = int.tryParse(entrada) ?? -1;

    switch (opcion) {
      case 1:
        registrarReserva();
        break;

      case 2:
        mostrarReservas();
        break;

      case 3:
        buscarReservaPorCodigo();
        break;

      case 4:
        buscarReservaPorNombre();
        break;

      case 5:
        modificarReserva();
        break;

      case 6:
        eliminarReserva();
        break;

      case 0:
        print('\nSaliendo del sistema...');
        break;

      default:
        print('\nOpción inválida. Intente nuevamente');
    }
  }
}
