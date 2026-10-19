import 'dart:io';

import 'reserva.dart';

List<Reserva> reservas = [];

Set<String> codigosReservas = {};

Map<String, int> cantidadPorTipoHabitacion = {};

void registrarReserva() {
  print('\n--- REGISTRAR RESERVA ---');

  stdout.write('Código de la reserva: ');
  String codigoIngresado = (stdin.readLineSync() ?? '').trim();
  String codigo = codigoIngresado.toUpperCase();

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
  String tipoIngresado = (stdin.readLineSync() ?? '').trim();

  String tipo = tipoIngresado.toLowerCase();
  tipo = tipo.isEmpty ? '' : '${tipo[0].toUpperCase()}${tipo.substring(1)}';

  List<String> tiposPermitidos = ['Sencilla', 'Doble', 'Suite', 'Familiar'];

  if (!tiposPermitidos.contains(tipo)) {
    print('Error: tipo de habitación no válido');
    print('Tipos permitidos: ${tiposPermitidos.join(',')}');
    return;
  }

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

void buscarReservaPorNombre() {
  print('\n--BUSCAR RESERVA POR HUESPED ---');

  stdout.write('Ingrese el nombre del huesped: ');
  String nombreBuscado = (stdin.readLineSync() ?? '').trim().toLowerCase();

  if (nombreBuscado.isEmpty) {
    print('Error: debe ingresar un nombre para buscar');
    return;
  }

  bool encontrada = false;

  for (Reserva reserva in reservas) {
    if (reserva.nombreHuesped.toLowerCase().contains(nombreBuscado)) {
      print('\nReserva encontrada:');
      reserva.mostrarInformacion();
      encontrada = true;
    }
  }

  if (!encontrada) {
    print('\nNo se encontraron reservas para ese huésped.');
  }
}

void buscarReservaPorCodigo() {
  print('\n--BUSCAR RESERVA ---');

  stdout.write('Ingrese el código de la reserva: ');
  String codigo = (stdin.readLineSync() ?? '').trim();

  bool encontrada = false;

  for (Reserva reserva in reservas) {
    if (reserva.codigo == codigo) {
      print('\nReserva encontrada:');
      reserva.mostrarInformacion();
      encontrada = true;
      break;
    }
  }

  if (!encontrada) {
    print('\nNo existe una reserva con ese código.');
  }
}

void modificarReserva() {
  print('\n--- MODIFICAR RESERVA ---');

  stdout.write('Ingrese el código de la reserva: ');
  String codigo = (stdin.readLineSync() ?? '').trim();

  Reserva? reservaEncontrada;

  for (Reserva reserva in reservas) {
    if (reserva.codigo == codigo) {
      reservaEncontrada = reserva;
      break;
    }
  }

  if (reservaEncontrada == null) {
    print('No existe una reserva con ese código');
    return;
  }

  print('\nDatos actuales');
  reservaEncontrada.mostrarInformacion();

  stdout.write('\nNuevo nombre del huésped: ');
  String nombre = (stdin.readLineSync() ?? '').trim();

  stdout.write('\nNuevo tipo de habitación: ');
  String tipo = (stdin.readLineSync() ?? '').trim();

  stdout.write('\nNueva cantidad de noches: ');
  int? noches = int.tryParse(stdin.readLineSync() ?? '');

  stdout.write('\nNuevo precio por noche: ');
  double? precio = double.tryParse(stdin.readLineSync() ?? '');

  if (nombre.isEmpty || tipo.isEmpty) {
    print('Error: el nombre y la habitación son obligatorios');
    return;
  }

  if (noches == null || noches <= 0) {
    print('Error: las noches deben ser mayores que cero');
    return;
  }

  if (precio == null || noches <= 0) {
    print('Error: el precio debe ser mayor que cero.');
    return;
  }

  String tipoAnterior = reservaEncontrada.tipoHabitacion;

  reservaEncontrada.nombreHuesped = nombre;
  reservaEncontrada.tipoHabitacion = tipo;
  reservaEncontrada.noches = noches;
  reservaEncontrada.precioPorNoche = precio;

  cantidadPorTipoHabitacion[tipoAnterior] =
      cantidadPorTipoHabitacion[tipoAnterior]! - 1;

  if (cantidadPorTipoHabitacion[tipoAnterior] == 0) {
    cantidadPorTipoHabitacion.remove(tipoAnterior);
  }

  if (cantidadPorTipoHabitacion.containsKey(tipo)) {
    cantidadPorTipoHabitacion[tipo] = cantidadPorTipoHabitacion[tipo]! + 1;
  } else {
    cantidadPorTipoHabitacion[tipo] = 1;
  }

  print('\nReserva modificada correctamente.');
  reservaEncontrada.mostrarInformacion();
}

void eliminarReserva() {
  print('\n--- ELIMINAR RESERVA ---');

  stdout.write('Ingrese el código de la reserva: ');
  String codigo = (stdin.readLineSync() ?? '').trim();

  Reserva? reservaEncontrada;

  for (Reserva reserva in reservas) {
    if (reserva.codigo == codigo) {
      reservaEncontrada = reserva;
      break;
    }
  }

  if (reservaEncontrada == null) {
    print('No existe una reserva con ese código');
    return;
  }

  print('\nReserva que se eliminará');
  reservaEncontrada.mostrarInformacion();

  stdout.write('\n¿Desea eliminar esta reserva? (s/n)');
  String confirmacion = (stdin.readLineSync() ?? '').trim().toLowerCase();

  if (confirmacion != 's') {
    print('Eliminación cancelada.');
    return;
  }

  reservas.remove(reservaEncontrada);
  codigosReservas.remove(reservaEncontrada.codigo);

  String tipo = reservaEncontrada.tipoHabitacion;

  cantidadPorTipoHabitacion[tipo] = cantidadPorTipoHabitacion[tipo]! - 1;

  if (cantidadPorTipoHabitacion[tipo] == 0) {
    cantidadPorTipoHabitacion.remove(tipo);
  }

  print('\nReserva eliminada correctamente');
}

void mostrarResumen() {
  print('\n--- RESUMEN GENERAL DEL HOTEL ---');

  if (reservas.isEmpty) {
    print('No hay reservas registradas para generar el reporte');
    return;
  }

  int totalReservas = reservas.length;
  int totalNoches = 0;
  double ingresosTotales = 0;

  for (Reserva reserva in reservas) {
    totalNoches += reserva.noches;
    ingresosTotales += reserva.calcularTotal();
  }

  print('\nTotal de reservas: $totalReservas');
  print('Total de noches reservadas: $totalNoches');
  print('Ingresos potenciales: \$${ingresosTotales.toStringAsFixed(2)}');

  print('\n--- RESERVAS POR TIPO DE HABITACIÓN ---');

  for (String tipo in cantidadPorTipoHabitacion.keys) {
    print('$tipo: ${cantidadPorTipoHabitacion[tipo]} reserva(s)');
  }
}
