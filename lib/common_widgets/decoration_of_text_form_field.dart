import 'package:flutter/material.dart';
import 'colors.dart';

final decorationForTextFormFields = InputDecoration(
  labelText: "***",
  hintText: "***",
  icon: Icon(Icons.close, color: ColorsF().escoger("gris")),

  // color de texto pista (placerholder)
  hintStyle: TextStyle(color: ColorsF().escoger("gris")),
  // color de texto de error
  errorStyle: TextStyle(color: ColorsF().escoger("primario")),
  // color de nombre de textField
  labelStyle: TextStyle(color: ColorsF().escoger("gris")),
  // texto flotante arriba a la izquierda
  floatingLabelStyle: TextStyle(color: ColorsF().escoger("gris")),

  // color por defecto sin enfoque
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorsF().escoger("blanco"), width: 1.0),
      borderRadius: BorderRadius.circular(10.0)),
  // color estando enfocado
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorsF().escoger("primario"), width: 1.0),
      borderRadius: BorderRadius.circular(10.0)),
  // color de error
  errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorsF().escoger("blanco"), width: 1.0),
      borderRadius: BorderRadius.circular(10.0)),
  // color de error al estar enfocado
  focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorsF().escoger("blanco"), width: 1.0),
      borderRadius: BorderRadius.circular(10.0)),
);
