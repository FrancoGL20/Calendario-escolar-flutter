import 'package:flutter/material.dart';
import 'package:calendario_escolar/pages/sign_in_page.dart';
import 'package:calendario_escolar/services/auth.dart';
import 'package:provider/provider.dart';
import 'navigation.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<UserModel?>(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          UserModel? user = snapshot.data;
          // si el usuario no está dado de alta se manda a 
          // la página de inicio de sesión
          if (user == null) {
            return SignInPage();
          }
          // si el usuario existe, se manda al home
          return Provider<UserModel>.value(value: user, child: Navigation());
        } else {
          // mientras está cargando muestra la barra de carga
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
