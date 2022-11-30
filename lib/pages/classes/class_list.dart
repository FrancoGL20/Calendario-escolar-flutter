import 'package:flutter/material.dart';
import 'class.dart';
import 'class_item.dart';

class HomeworkList extends StatelessWidget {
  final List<Homework> items;
  // constructor que recibe la lista de objetos tipo Homework
  const HomeworkList({required Key key, required this.items});

  @override
  Widget build(BuildContext context) {
    // lista deslizable de elementos tipo tarea a visualizar
    return Container(
        margin: const EdgeInsets.only(top: 12.0),
        child: ListView.builder(
          // recomendado: es una forma de indicar al ListView
          // la cantidad de elementos que va a contener y cargar
          itemCount: items.length,
          // regresa por cada unos de los elementos de la lista
          // un Widget que se va a mostrar
          itemBuilder: (context, index) {
            // widget con la forma visible de cada uno de los
            // elementos a mostrar dentro de la lista
            return HomeworkItem(item: items[index]);
          },
        ));
  }
}
