import 'package:flutter/material.dart';
import 'package:calendario_escolar/pages/sign_in/email_sign_in_form.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Práctica 4",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 2.0,
        backgroundColor: Color.fromARGB(255, 218, 38, 38),
      ),
      body: EmailSignInForm.create(context),
    );
  }
}
