import 'package:flutter/material.dart';
import 'home_page.dart';
import './homeworks/create.dart';
import './other_pages/contact.dart';
import '../common_widgets/colors.dart';

class Navigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Navigation();
  }
}

class _Navigation extends State<Navigation> {

  // indice para controlar en que ventana se está mostrando
  int indexTap = 0;

  // lista de clases con las vistas necesarias
  final List<Widget> widgetsChildren = [
    // pantalla de home
    HomePage(),
    // pantalla de busqueda
    CreateHw(),
    // pantalla de perfil
    Contact()
  ];

  // función a ejecutar al cambiar el estado
  void onTapTapped(int index) {
    // llama de nuevo a todo el Stateful, pero
    // con los datos cambiados
    setState(() {
      // el indice que recibe, envialo a indextab
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsChildren[indexTap],
      // barra de navegación, va dentro del scaffold
      bottomNavigationBar: Theme(
          // caracteristicas de la barra de navegación
          data: Theme.of(context).copyWith(
              // color de barra
              canvasColor: ColorsF().escoger("negro"),
              // color de elementos
              primaryColor: Color.fromARGB(255, 55, 39, 176)
              ),
          // barra en sí junto con sus items y comportamieto
          child: BottomNavigationBar(
            // cuando se presione una ventana que va a pasar
            onTap: onTapTapped,
            // indice de la pestaña que se está mostrando
            currentIndex: indexTap,
            // no mostrar las etiquetas seleccionadas
            showSelectedLabels: false,
            // no mostrar las etiquetas deseleccionadas
            showUnselectedLabels: false,
            items: const [
              // item de home
              BottomNavigationBarItem(
                  // icono
                  icon: Icon(Icons.home),
                  // etiqueta
                  label: "Home"),
              // item de search
              BottomNavigationBarItem(
                  // icono
                  icon: Icon(Icons.note_add),
                  // etiqueta
                  label: "Add HW"),
              // item de person
              BottomNavigationBarItem(
                  // icono
                  icon: Icon(Icons.person),
                  // etiqueta
                  label: "Contact"),
            ],
          )),
    );
  }
}
