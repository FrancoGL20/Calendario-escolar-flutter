import 'package:flutter/material.dart';

class ColorsF {
  Color escoger(String color) {
    switch (color) {
      case "negro":
        {
          return Color.fromARGB(255, 0, 0, 0);
        }

      case "primario":
        {
          return const Color.fromARGB(255, 193, 62, 23);
          // return  Color.fromARGB(255, 255, 128, 3);
        }

      case "blanco":
        {
          return const Color.fromARGB(255, 232, 232, 232);
        }

      case "gris":
        {
          return Color.fromARGB(255, 165, 165, 165);
        }

      case "gris_oscuro":
        {
          return Color.fromARGB(255, 66, 66, 66);
        }

      case "gris_claro":
        {
          return Color.fromARGB(255, 204, 204, 204);
        }

      default:
        {
          return const Color.fromARGB(255, 74, 147, 84);
        }
    }
  }
  ButtonStyle colorElevatedButton(String fondo,String texto) {
    return ElevatedButton.styleFrom(
        backgroundColor: ColorsF().escoger(fondo),
        foregroundColor: ColorsF().escoger(texto));
  }
}
