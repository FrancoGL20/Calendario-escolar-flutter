import 'package:calendario_escolar/common_widgets/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:calendario_escolar/common_widgets/custom_alert_dialog.dart';
import 'package:calendario_escolar/pages/sign_in/email_sign_in_model.dart';
import 'package:calendario_escolar/services/auth.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/decoration_of_text_form_field.dart';

class EmailSignInForm extends StatefulWidget {
  EmailSignInForm({Key? key, required this.model}) : super(key: key);
  final EmailSignInModel model;

  static Widget create(BuildContext context) {
    final AuthBase auth = Provider.of<AuthBase>(context);
    return ChangeNotifierProvider<EmailSignInModel>(
      create: (context) => EmailSignInModel(auth: auth),
      child: Consumer<EmailSignInModel>(
        builder: (context, model, _) => EmailSignInForm(
          model: model,
        ),
      ),
    );
  }

  @override
  State<EmailSignInForm> createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final TextEditingController? _emailController = TextEditingController();
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final TextEditingController? _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  EmailSignInModel get model => widget.model;

  Future<void> _submit() async {
    try {
      await model.submit();
    } on FirebaseException catch (e) {
      CustomAlertDialog(
        title: "Inicio o registro incorrecto",
        content: e.message!,
        defaultActionText: "OK",
      ).show(context);
    }
  }

  void _toogleFormType() {
    model.toggleFormType();
    _emailController!.clear();
    _passwordController!.clear();
  }

  void _emailEditingComplete() {
    final newFocus = model.emailValidator.isValid(model.email)
        ? _passwordFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  List<Widget> _buildChildren() {
    return [
      _buildHeader(),
      const SizedBox(
        height: 35.0,
      ),
      _buildEmailTextField(),
      const SizedBox(
        height: 25.0,
      ),
      _buildPasswordTextField(),
      const SizedBox(
        height: 45.0,
      ),
      _buildFormActions(),
    ];
  }

  Widget _buildHeader() {
    return Text(
      model.headerText,
      style: TextStyle(
        fontSize: 65.0,
        color: ColorsF().escoger("gris_claro"),
        fontFamily: 'Lato'
      ),
    );
  }

  Widget _buildEmailTextField() {
    return TextField(
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      controller: _emailController,
      decoration: decorationForTextFormFields.copyWith(
        labelText: "Correo",
        hintText: "correo@dominio.com",
        icon: Icon(Icons.mail,
            color: ColorsF().escoger("gris_claro")),
      ),
      focusNode: _emailFocusNode,
      onEditingComplete: () => _emailEditingComplete(),
      onChanged: model.updateEmail,
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      controller: _passwordController,
      obscureText: true,
      decoration: decorationForTextFormFields.copyWith(
        labelText: "Contraseña",
        hintText: "******",
        icon: Icon(Icons.lock,
            color: ColorsF().escoger("gris_claro")),
      ),
      textInputAction: TextInputAction.done,
      focusNode: _passwordFocusNode,
      onEditingComplete: _submit,
      onChanged: model.updatePassword,
    );
  }

  Widget _buildFormActions() {
    if (model.isLoading) {
      return const CircularProgressIndicator();
    }
    return Column(
      children: [
        SizedBox(
          width: 220.0,
          height: 45.0,
          child: ElevatedButton(
            onPressed: model.canSubmit ? _submit:null,
            style: ColorsF().colorElevatedButton("gris_oscuro", "negro"),
            child: Text(
              model.primaryButtonText,
              style: TextStyle(fontSize: 21.0, fontFamily: 'Lato',fontWeight: FontWeight.bold,color: ColorsF().escoger("negro")),
            ),
          )
        ),
        TextButton(
            onPressed: !model.isLoading ? _toogleFormType : null,
            child: Text(
              model.secondaryButtonText,
              style: TextStyle(
                color: ColorsF().escoger("primario")
              ),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: _buildChildren(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController!.dispose();
    _passwordController!.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}
