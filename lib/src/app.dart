
import 'package:flutter/material.dart';
import 'package:projectroots/pages.dart';
import 'package:projectroots/src/activities/phone_recall/phone_recall.dart';
import 'package:projectroots/src/activities/picture_quiz/picture_quiz.dart';
import 'package:projectroots/src/activities/reverse_spell.dart';
import 'package:projectroots/src/patient_screen/patient_screen.dart';
import 'package:projectroots/src/reminders_activity/todo.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color.fromRGBO(238, 238, 238, 1),
          border: OutlineInputBorder(),
        ),
      ),
      routes: {
        '/': (context) => HomePage(),
        '/reverse_spell': (context) => ReverseSpellActivity(targetWord: 'targetWord')
      },
    );
  }
}
