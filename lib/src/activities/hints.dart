import 'package:flutter/material.dart';

class Hints extends StatelessWidget {
  const Hints({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Hints")),
        body: Container(
            constraints: const BoxConstraints(
                maxHeight: double.infinity,
                maxWidth: double.infinity,
                minHeight: double.infinity,
                minWidth: double.infinity),
            decoration: BoxDecoration(
              color: Color(0xfffffde8),
              image: DecorationImage(
                image: AssetImage("assets/images/patient_main_menu_bg.jpg"),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.dstATop),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
                child: Column(children: [
              Center(
                  heightFactor: 1,
                  child: ListTile(
                    leading: Text(
                        textAlign: TextAlign.center,
                        "Your name",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                    tileColor: Color.fromARGB(255, 146, 215, 235),
                  )),
              Center(
                  heightFactor: 1,
                  child: ListTile(
                    leading: Text(
                        textAlign: TextAlign.center,
                        "Your spouse's name",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                    tileColor: Color.fromARGB(255, 235, 177, 226),
                  )),
              Center(
                  heightFactor: 1,
                  child: ListTile(
                    leading: Text(
                        textAlign: TextAlign.center,
                        "The colour of your house",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                    tileColor: Color.fromARGB(255, 209, 208, 207),
                  )),
              Center(
                  heightFactor: 1,
                  child: ListTile(
                    leading: Text(
                        textAlign: TextAlign.center,
                        "Your city's name",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                    tileColor: Color.fromARGB(255, 215, 228, 74),
                  )),
              Center(
                  heightFactor: 1,
                  child: ListTile(
                    leading: Text(
                        textAlign: TextAlign.center,
                        "What are you allergic to",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                    tileColor: Color.fromARGB(255, 163, 227, 202),
                  )),
              Center(
                  heightFactor: 1,
                  child: ListTile(
                    leading: Text(
                        textAlign: TextAlign.center,
                        "The name of your city",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                    tileColor: Color.fromARGB(255, 163, 227, 202),
                  )),
            ]))));
  }
}
