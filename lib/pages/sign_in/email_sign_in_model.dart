import 'package:flutter/material.dart';
import 'package:calendario_escolar/services/auth.dart';
import 'package:calendario_escolar/utils/validators.dart';

enum EmailSignInFormType { signIn, register }

class EmailSignInModel with EmailAndPasswordValidators, ChangeNotifier {
  EmailSignInModel(
      {this.email = "",
      this.password = "",
      this.formType = EmailSignInFormType.signIn,
      this.isLoading = false,
      this.submitted = false,
      required this.auth});

  String email;
  String password;
  EmailSignInFormType formType;
  bool isLoading;
  bool submitted;
  final AuthBase auth;

  void updateWith(
      {String? email,
      String? password,
      EmailSignInFormType? formType,
      bool? isLoading,
      bool? submitted}) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.formType = formType ?? this.formType;
    this.isLoading = isLoading ?? this.isLoading;
    this.submitted = submitted ?? this.submitted;
    notifyListeners();
  }

  Future<void> submit() async {
    updateWith(submitted: true, isLoading: true);
    try {
      if (formType == EmailSignInFormType.signIn) {
        await auth.signInWithEmailAndPassword(email, password);
      } else {
        await auth.createUserWithEmailAndPassword(email, password);
      }
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    }
  }

  String get headerText {
    return formType == EmailSignInFormType.signIn
        ? "Iniciar sesión"
        : "Registro";
  }

  String get primaryButtonText {
    return formType == EmailSignInFormType.signIn
        ? "Iniciar sesión"
        : "Crear cuenta";
  }

  String get secondaryButtonText {
    return formType == EmailSignInFormType.signIn
        ? "¿Aún no tienes cuenta? Registrate"
        : "¿Yá tienes una cuenta? Inicia sesión";
  }

  bool get canSubmit {
    return emailValidator.isValid(email) &&
        passwordValidator.isValid(password) &&
        !isLoading;
  }

  String? get passwordErrorText {
    bool showErrorText = submitted && !passwordValidator.isValid(password);
    return showErrorText ? invalidPasswordErrorText : null;
  }

  String? get emailErrorText {
    bool showErrorText = submitted && !emailValidator.isValid(email);
    return showErrorText ? invalidEmailErrorText : null;
  }

  void updateEmail(String email) => updateWith(email: email);
  void updatePassword(String password) => updateWith(password: password);

  void toggleFormType() {
    final formType = this.formType == EmailSignInFormType.signIn
        ? EmailSignInFormType.register
        : EmailSignInFormType.signIn;

    updateWith(
      email: "",
      password: "",
      formType: formType,
      submitted: false,
      isLoading: false,
    );
  }
}
