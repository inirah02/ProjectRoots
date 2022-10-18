import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectroots/src/activities/phone_recall/phone_recall.dart';
import 'package:projectroots/src/activities/picture_quiz/picture_quiz.dart';
import 'package:projectroots/src/activities/reverse_spell.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
      home: Scaffold(
        body: PhoneRecallActivity(),
      ),
    );
  }
}
