import 'package:flutter/material.dart';
import 'package:projectroots/pages.dart';
import 'package:projectroots/activities.dart';
import 'package:projectroots/src/activities/medicine_list/table.dart';
import 'package:projectroots/src/activities/patient_records.dart';
import 'package:projectroots/theme.dart';
import 'dart:math';
import 'package:projectroots/src/pages/signup_form.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: projectRootsThemeData,
      routes: {
        HomePage.path: (context) => const HomePage(),
        PhoneRecallActivity.path: (context) => const PhoneRecallActivity(),
        PictureQuizActivity.path: (context) => PictureQuizActivity(),
        TodoActivity.path: (context) => TodoActivity(),
        ReverseSpellActivity.path: (context) =>
            ReverseSpellActivity(),
        WordSearchActivity.path: (context) => const WordSearchActivity(),
        MedicineList.path: (context) => const MedicineList(),
        PatientRecords.path: (context) => PatientRecords(),
        QueryFormPage.path: (context) => QueryFormPage(),
        PatientScreen.path:((context) => PatientScreen()),
      },
    );
  }
}
