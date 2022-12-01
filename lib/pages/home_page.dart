import 'package:calendario_escolar/common_widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:calendario_escolar/services/auth.dart';
import 'package:provider/provider.dart';
import 'classes/class.dart';
import 'classes/class_list.dart';
import '../services/operations.dart';
import '../common_widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget _buildListOfClasss(UserModel user, BuildContext context) {
    Future<List<Class>> Classs = fetchClass();
    Key k = Key("");
    return Center(
      child: FutureBuilder<List<Class>>(
        future: Classs,
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ClassList(items: snapshot.data!, key: k)
              : Center(
                  child: CircularProgressIndicator(
                  color: ColorsF().escoger("primario"),
                ));
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
      appBar: AppBarF.crearAppBar(context, "Lista de materias"),
      body: _buildListOfClasss(user, context),
    );
  }
}
