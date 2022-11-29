import 'package:flutter/material.dart';

class Hints extends StatelessWidget {
  const Hints({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Hints")),
        body: Column(children: [
          Center(
              heightFactor: 1,
              child: ListTile(
                leading: Text("Your son's name"),
                tileColor: Color.fromARGB(255, 146, 215, 235),
              )),
          Center(
              heightFactor: 1,
              child: ListTile(
                leading: Text("Your spouse's name"),
                tileColor: Color.fromARGB(255, 235, 177, 226),
              )),
          Center(
              heightFactor: 1,
              child: ListTile(
                leading: Text("The colour of your house"),
                tileColor: Color.fromARGB(255, 169, 132, 13),
              )),
          Center(
              heightFactor: 1,
              child: ListTile(
                leading: Text("Your city's name"),
                tileColor: Color.fromARGB(255, 215, 228, 74),
              )),
          Center(
              heightFactor: 1,
              child: ListTile(
                leading: Text("What are you allergic to"),
                tileColor: Color.fromARGB(255, 163, 227, 202),
              )),
        ]));
  }
}
