import 'package:flutter/material.dart';
import 'package:projectroots/pages.dart';
import 'package:projectroots/activities.dart';
import 'package:projectroots/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: projectRootsThemeData,
      routes: {
        HomePage.path: (context) => HomePage(),
        PhoneRecallActivity.path: (context) => PhoneRecallActivity(),
        PictureQuizActivity.path: (context) => PictureQuizActivity(),
        TodoActivity.path: (context) => TodoActivity(),
        ReverseSpellActivity.path: (context) =>
            ReverseSpellActivity(targetWord: 'targetWord'),
        WordSearchActivity.path: (context) => WordSearchActivity(),
      },
    );
  }
}
