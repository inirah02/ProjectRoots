import 'package:flutter/material.dart';

class Hints extends StatelessWidget {
  const Hints({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Hints")),
        body: Column(children: [
          ListTile(
            leading: Text("Your son's name"),
            tileColor: Color.fromARGB(255, 146, 215, 235),
          ),
          ListTile(
            leading: Text("Your spouse's name"),
            tileColor: Color.fromARGB(255, 235, 177, 226),
          ),
          ListTile(
            leading: Text("The colour of your house"),
            tileColor: Color.fromARGB(255, 246, 199, 44),
          ),
          ListTile(
            leading: Text("Your city's name"),
            tileColor: Color.fromARGB(255, 239, 162, 216),
          ),
          ListTile(
            leading: Text("What are you allergic to"),
            tileColor: Color.fromARGB(255, 163, 227, 202),
          ),
        ]));
  }
}
