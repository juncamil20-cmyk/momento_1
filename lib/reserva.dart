class Reserva {
  String codigo;
  String nombreHuesped;
  String tipoHabitacion;
  int noches;
  double precioPorNoche;

  Reserva(
    this.codigo,
    this.nombreHuesped,
    this.tipoHabitacion,
    this.noches,
    this.precioPorNoche,
  );

  double calcularTotal() {
    return noches * precioPorNoche;
  }

  void mostrarInformacion() {
    print('Código : $codigo');
    print('Huésped: $nombreHuesped');
    print('Habitación: $tipoHabitacion');
    print('Noches: $noches');
    print('Total: \$${calcularTotal().toStringAsFixed(2)}');
  }
}
