import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectroots/src/activities/picture_quiz/picture_quiz.dart';
import 'package:projectroots/src/activities/reverse_spell.dart';
import 'package:projectroots/src/activities/caregiver_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Roots',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        body: Caregiver(),
      ),
    );
  }
}
