import 'package:flutter/material.dart';
import 'class.dart';

class ClassItem extends StatelessWidget {
  final Class item;
  const ClassItem({super.key, required this.item});

  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 8.0),
        height: 140,
        child: Card(
          elevation: 5,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                      top: 12.0, bottom: 12.0, left: 35.0),
                  child: Image.network(
                    item.classImage,
                    width: 100,
                  ),
                ),
                Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(item.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0)),
                            Text("horario: ${item.schedule}",
                                style: const TextStyle(fontSize: 13.0)),
                            Text("salón: ${item.classroom}",
                                style: const TextStyle(fontSize: 13.0)),
                            Text("días: ${item.days}",
                                style: const TextStyle(fontSize: 13.0)),
                          ],
                        )))
              ]),
        ));
  }
}
