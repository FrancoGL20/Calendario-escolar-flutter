  import 'package:calendario_escolar/common_widgets/custom_alert_dialog.dart';
  import 'package:provider/provider.dart';
  import 'package:calendario_escolar/services/auth.dart';
  import 'package:flutter/material.dart';

  // acción de cerrar la sesión
  Future<void> _signOut(context) async {
    final auth = Provider.of<AuthBase>(context, listen: false);
    try {
      auth.signOut();
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  // dialogo de alerta de pregunta de inicio de sesión
  Future<void> confirmSignOut(BuildContext context) async {
    final _didRequestSignOut = await CustomAlertDialog(
      title: "Cerrar sesión",
      content: "¿Estás seguro de querer cerrar sesión?",
      defaultActionText: "Salir",
      cancelActionText: "Cancelar",
    ).show(context);

    if (_didRequestSignOut == true) {
      _signOut(context);
    }
  }