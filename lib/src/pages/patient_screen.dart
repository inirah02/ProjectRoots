import 'package:flutter/material.dart';
import 'package:projectroots/activities.dart';

final Color blue = Color.fromARGB(255, 24, 155, 116);

class PatientScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData.dark().copyWith(scaffoldBackgroundColor: blue),
        child: Scaffold(
          body: Container(
            constraints: const BoxConstraints(
                maxHeight: double.infinity,
                maxWidth: double.infinity,
                minHeight: double.infinity,
                minWidth: double.infinity),
            decoration: const BoxDecoration(
              color: Color(0xfffffde8),
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            height: 900.0,
            padding: const EdgeInsets.symmetric(vertical: 100.0),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Center(
                        child: Text("What would you like to do today",
                            style: TextStyle(fontSize: 60))),
                    ElevatedButton(
                      onPressed: () => TodoActivity(),
                      child: const Text("To-do Reminders"),
                    ),
                    ButtonTheme(
                        minWidth: 600.0,
                        height: 100.0,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Word Search"),
                        )),
                    ButtonTheme(
                        minWidth: 600.0,
                        height: 100.0,
                        child: ElevatedButton(
                          onPressed: () => ReverseSpellActivity(
                            targetWord: "Varuni",
                          ),
                          child: const Text("Reverse Spell"),
                        )),
                    ButtonTheme(
                        minWidth: 600.0,
                        height: 170.0,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Picture Quiz"),
                        )),
                  ]),
            ),
          ),
        ));
  }
}
