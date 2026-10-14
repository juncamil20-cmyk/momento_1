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

      case 0:
        print('\nSaliendo del sistema...');
        break;

      default:
        print('\nOpción inválida. Intente nuevamente');
    }
  }
}
