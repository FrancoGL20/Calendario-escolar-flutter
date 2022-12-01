import 'package:flutter/material.dart';
import 'colors.dart';
import '../utils/sign_out.dart';

class AppBarF {
  static AppBar crearAppBar(BuildContext context,String text) {
    return AppBar(
      // titulo en la barra superior
      title: Text(
        "$text",
        style: TextStyle(color: ColorsF().escoger("gris_claro")),
      ),
      // fondo de la barra
      backgroundColor: ColorsF().escoger("negro"),
      // acción de cerrar sesión
      actions: [
        TextButton(
            // cuando se presione, se va a cerrar sesión
            onPressed: () => confirmSignOut(context),
            child: Text(
              "Cerrar sesión  ",
              style: TextStyle(
                color: ColorsF().escoger("gris_claro"),
                fontSize: 18,
              ),
            ))
      ],
    );
  }
}
