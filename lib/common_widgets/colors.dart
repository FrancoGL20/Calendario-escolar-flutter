import 'package:flutter/material.dart';

class ColorsF {
  Color escoger(String color){
    switch (color) {
      case "negro":
        {
          return Color.fromARGB(255, 19, 19, 19);
        }

      case "azul":
        {
          return Color.fromARGB(255, 0, 42, 255);
        }

      case "blanco":
        {
          return Color.fromARGB(255, 232, 232, 232);
        }

      default:
        {
          return Color.fromARGB(255, 74, 147, 84);
        }
    }
  }
}
