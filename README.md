Sistema de gestión de reservas de hotel

1. Descripción del proyecto

Este proyecto consiste en desarrollar un sistema de consola en Dart para gestionar las reservas de un hotel. Permite registrar y administrar información de los huéspedes, los tipos de habitación, las noches reservadas y los precios por noche.

El objetivo es aplicar los fundamentos de programación aprendidos en Dart, utilizando variables, condicionales, ciclos, funciones y estructuras de datos.

2. Funcionalidades

El sistema permite realizar las siguientes operaciones:

- Registrar reservas con su código, nombre del huésped, tipo de habitación, cantidad de noches y precio por noche.
- Consultar todas las reservas registradas.
- Buscar reservas por código.
- Buscar reservas por nombre del huésped.
- Modificar los datos de una reserva existente.
- Eliminar reservas registradas.
- Generar un resumen general con la cantidad de reservas, las noches reservadas, los ingresos potenciales y las reservas por tipo de habitación.
- Validar los datos ingresados para evitar información incorrecta y códigos duplicados.

3. Tecnologías utilizadas

- **Dart:** lenguaje de programación utilizado para desarrollar el sistema.
- **Visual Studio Code:** editor de código utilizado durante el desarrollo.
- **Git:** herramienta de control de versiones para registrar los cambios realizados en el proyecto.


4. Investigación sobre programación orientada a objetos

¿Qué es una clase?

Una clase es una estructura que define las características y los comportamientos que tendrán los objetos de un determinado tipo. En este proyecto, la clase `Reserva` define la información y las operaciones relacionadas con una reserva de hotel.

¿Qué es un objeto?

Un objeto es una instancia creada a partir de una clase. En el sistema, cada reserva registrada puede representarse mediante un objeto de la clase `Reserva`, con sus propios datos.

¿Cuál es la diferencia entre una clase y un objeto?

La clase funciona como una definición o plantilla, mientras que el objeto es una instancia concreta creada a partir de ella. Por ejemplo, `Reserva` es la clase y una reserva con código `R001`, perteneciente a un huésped y con determinadas noches y precio, es un objeto de esa clase.

¿Qué es un atributo?

Un atributo es una variable que pertenece a una clase y almacena información sobre sus objetos. En la clase `Reserva`, algunos atributos son `codigo`, `nombreHuesped`, `tipoHabitacion`, `noches` y `precioPorNoche`.

¿Qué es un método?

Un método es una función definida dentro de una clase que representa una operación o comportamiento. En la clase `Reserva`, el método `calcularTotal()` multiplica la cantidad de noches por el precio por noche para obtener el valor de la estadía.

¿Para qué sirve un constructor?

Un constructor permite inicializar un objeto cuando se crea. En la clase `Reserva`, el constructor recibe los datos necesarios para crear una reserva y asignarlos a sus atributos.

El constructor utilizado en el proyecto es:

`Reserva(this.codigo, this.nombreHuesped, this.tipoHabitacion, this.noches, this.precioPorNoche);`

La palabra `this` hace referencia al objeto que se está creando y permite asignar los valores recibidos a sus atributos.