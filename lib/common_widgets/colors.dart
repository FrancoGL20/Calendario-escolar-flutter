import 'package:flutter/material.dart';

class ColorsF {
  Color escoger(String color) {
    switch (color) {
      case "negro":
        {
          return const Color.fromARGB(255, 19, 19, 19);
        }

      case "primario":
        {
          return Colors.blueAccent;
          // return  Color.fromARGB(255, 255, 128, 3);
        }

      case "blanco":
        {
          return const Color.fromARGB(255, 232, 232, 232);
        }

      case "gris":
        {
          return const Color.fromARGB(255, 164, 164, 164);
        }

      default:
        {
          return const Color.fromARGB(255, 74, 147, 84);
        }
    }
  }
}
