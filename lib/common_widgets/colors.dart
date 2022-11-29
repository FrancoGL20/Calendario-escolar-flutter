import 'package:flutter/material.dart';

class ColorsF {
  Color escoger(String color){
    switch (color) {
      case "negro":
        {
          return Color.fromARGB(255, 19, 19, 19);
        }

      case "naranja":
        {
          return Color.fromARGB(255, 255, 128, 3);
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
