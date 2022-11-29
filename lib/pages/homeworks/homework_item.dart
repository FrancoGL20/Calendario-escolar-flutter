import 'package:flutter/material.dart';
import 'homework.dart';

class HomeworkItem extends StatelessWidget {
  final Homework item;
  const HomeworkItem({super.key, required this.item});

  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(2),
        height: 140,
        child: Card(
          elevation: 5,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.network(
                  item.classImage,
                  width: 200,
                ),
                Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(item.name,
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                            Text("horario: ${item.schedule}"),
                            Text("salón: ${item.classroom}"),
                            Text("dias:${item.days}"),
                          ],
                        )
                    )
                )
              ]),
        )
    );
  }
}
