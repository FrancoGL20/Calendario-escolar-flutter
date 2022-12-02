import 'package:flutter/material.dart';
import 'home_page.dart';
import 'classes/class_create.dart';
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
  int _selectedIndex = 0;

  // lista de clases con las vistas necesarias
  final List<Widget> widgetsChildren = [
    // pantalla de home
    HomePage(),
    // pantalla de busqueda
    CreateCl(),
    // pantalla de perfil
    Contact()
  ];

  // función a ejecutar al cambiar el estado
  void _onItemTapped(int index) {
    // llama de nuevo a todo el Stateful, pero
    // con los datos cambiados
    setState(() {
      // el indice que recibe, envialo a indextab
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsChildren[_selectedIndex],
      // barra de navegación, va dentro del scaffold
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorsF().escoger("negro"),
        // no mostrar las etiquetas seleccionadas
        showSelectedLabels: false,
        // no mostrar las etiquetas deseleccionadas
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
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
        currentIndex: _selectedIndex,
        selectedItemColor: ColorsF().escoger("primario"),
        onTap: _onItemTapped,
        unselectedItemColor: ColorsF().escoger("gris_claro"),
      ),
    );
  }
}
