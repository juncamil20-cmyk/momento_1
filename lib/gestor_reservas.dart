import 'dart:io';

import 'reserva.dart';

List<Reserva> reservas = [];

Set<String> codigosReservas = {};

Map<String, int> cantidadPorTipoHabitacion = {};

void registrarReserva() {
  print('\n--- REGISTRAR RESERVA ---');

  stdout.write('Código de la reserva: ');
  String codigo = (stdin.readLineSync() ?? '').trim();

  if (codigo.isEmpty) {
    print('Error: el código no puede estar vacío.');
    return;
  }

  if (codigosReservas.contains(codigo)) {
    print('Error: ya existe una reserva con ese código.');
    return;
  }

  stdout.write('Nombre del huésped: ');
  String nombre = (stdin.readLineSync() ?? '').trim();

  stdout.write('Tipo de habitación: ');
  String tipo = (stdin.readLineSync() ?? '').trim();

  stdout.write('Cantidad de noches: ');
  int? nochesIngresadas = int.tryParse(stdin.readLineSync() ?? '');

  stdout.write('Precio por noche: ');
  double? precioIngresado = double.tryParse(stdin.readLineSync() ?? '');

  if (nombre.isEmpty || tipo.isEmpty) {
    print('Error: el nombre y el tipo  de habitación son obligatorios');
    return;
  }

  if (nochesIngresadas == null || nochesIngresadas <= 0) {
    print('Error: las noches deben ser un entero mayor que cero.');
    return;
  }

  if (precioIngresado == null || precioIngresado <= 0) {
    print('Error: el precio debe ser un número mayor que cero.');
    return;
  }

  Reserva nuevaReserva = Reserva(
    codigo,
    nombre,
    tipo,
    nochesIngresadas,
    precioIngresado,
  );

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
