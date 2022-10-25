import 'package:flutter/material.dart';
import 'package:projectroots/activities.dart';

final Color blue = Color.fromARGB(255, 97, 199, 227);

class PatientScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData.dark().copyWith(scaffoldBackgroundColor: blue),
        child: Scaffold(
          body: Center(
            child: Container(
              height: 900.0,
              padding: const EdgeInsets.symmetric(vertical: 100.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Center(
                        child: const Text("What would you like to do today")),
                    ElevatedButton(
                      onPressed: () => TodoActivity(),
                      child: const Text("To-do Reminders"),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Word Search"),
                    ),
                    ElevatedButton(
                      onPressed: () => ReverseSpellActivity(
                        targetWord: "Varuni",
                      ),
                      child: const Text("Reverse Spell"),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Picture Quiz"),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
