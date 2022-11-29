import 'package:flutter/material.dart';
import 'package:calendario_escolar/pages/sign_in/email_sign_in_form.dart';

import '../common_widgets/colors.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Horario F",
          style: TextStyle(color: ColorsF().escoger("blanco")),
        ),
        centerTitle: true,
        elevation: 2.0,
        backgroundColor: ColorsF().escoger("negro"),
      ),
      body: EmailSignInForm.create(context),
    );
  }
}
