// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

final Color darkGreen = Color.fromARGB(255, 214, 128, 241);

class Caregiver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkGreen),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            height: 900.0,
            padding: const EdgeInsets.symmetric(vertical: 100.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  buttonWidget("Add To-Do Reminders"),
                  buttonWidget("Modify Medicine List"),
                  buttonWidget("Check Vitals"),
                ]),
          ),
        ),
      ),
    );
  }

  Widget buttonWidget(String label) {
    return ButtonTheme(
      minWidth: 200.0,
      height: 80.0,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(label),
      ),
    );
  }
}
