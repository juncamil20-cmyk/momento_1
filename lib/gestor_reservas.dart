import 'dart:io';

import 'reserva.dart';

List<Reserva> reservas = [];

Set<String> codigosReservas = {};

Map<String, int> cantidadPorTipoHabitacion = {};

void registrarReserva() {
  print('\n--- Registrar Reserva ---');

  stdout.write('Código de la reserva: ');
  String codigo = stdin.readLineSync() ?? '';

  if (codigosReservas.contains(codigo)) {
    print('Ya existe una reserva con ese código.');
    return;
  }

  stdout.write('Nombre del huésped: ');
  String nombre = stdin.readLineSync() ?? '';

  stdout.write('Tipo de habitación: ');
  String tipo = stdin.readLineSync() ?? '';

  stdout.write('Cantidad de noches: ');
  int noches = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  stdout.write('Precio por noche: ');
  double precio = double.tryParse(stdin.readLineSync() ?? '') ?? 0;

  if (codigo.isEmpty ||
      nombre.isEmpty ||
      tipo.isEmpty ||
      noches <= 0 ||
      precio <= 0) {
    print('Datos inválidos. Revisa la información ingresada.');
    return;
  }

  Reserva nuevaReserva = Reserva(codigo, nombre, tipo, noches, precio);

  reservas.add(nuevaReserva);
  codigosReservas.add(codigo);

  if (cantidadPorTipoHabitacion.containsKey(tipo)) {
    cantidadPorTipoHabitacion[tipo] = cantidadPorTipoHabitacion[tipo]! + 1;
  } else {
    cantidadPorTipoHabitacion[tipo] = 1;
  }

  print('\nReserva registrada correctamente.');
  nuevaReserva.mostrarInformacion();
}

void mostrarReservas() {
  print('\n--- RESERVAS REGISTRADAS ---');

  if (reservas.isEmpty) {
    print('No hay reservas registradas.');
    return;
  }

  for (Reserva reserva in reservas) {
    print('---------------------------');
    reserva.mostrarInformacion();
  }
}
