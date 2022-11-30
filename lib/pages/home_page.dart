import 'package:flutter/material.dart';
import 'package:calendario_escolar/services/auth.dart';
import 'package:provider/provider.dart';
import 'classes/class.dart';
import 'classes/class_list.dart';
import '../services/operations.dart';
import '../pages/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget _buildListOfHomeworks(UserModel user, BuildContext context) {
    Future<List<Homework>> homeworks=fetchHomework();
    Key k = Key("");
    return Center(
      child: FutureBuilder<List<Homework>>(
        future: homeworks,
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? HomeworkList(items: snapshot.data!, key: k)
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // variable para controlar al usario con sesión iniciada
    final user = Provider.of<UserModel>(context, listen: false);
    return Scaffold(
      // barra superior de la aplicación
      appBar: AppBarF.crearAppBar(context),
      body: _buildListOfHomeworks(user, context),
    );
  }
}
