import 'package:flutter/material.dart';
import 'package:calendario_escolar/common_widgets/custom_alert_dialog.dart';
import 'package:calendario_escolar/services/auth.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // realización de cerrar la sesión
  Future<void> _signOut(context) async {
    final auth = Provider.of<AuthBase>(context, listen: false);
    try {
      auth.signOut();
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  // aviso flotante de pregunta de inicio de sesión
  Future<void> _confirmSignOut(BuildContext context) async {
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

  Widget _buildHomePageContent(UserModel user, BuildContext context) {
    return Container(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Color.fromARGB(255, 218, 38, 38),
                child: Text(
                  user.email.split("")[0].toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                user.uid,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                user.email,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // variable para controlar al usario con sesión iniciada
    final user = Provider.of<UserModel>(context, listen: false);
    return Scaffold(
      // barra superior de la aplicación
      appBar: AppBar(
        // titulo en la barra superior
        title: const Text(
          "Página de inicio",
          style: TextStyle(color: Colors.black),
        ),
        // fondo de la barra
        backgroundColor: Color.fromARGB(255, 218, 38, 38),
        // acción de cerrar sesión
        actions: [
          TextButton(
              // cuando se presione, se va a cerrar sesión
              onPressed: () => _confirmSignOut(context),

              child: const Text(
                "Cerrar sesión",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ))
        ],
      ),
      body: _buildHomePageContent(user, context),
    );
  }
}
