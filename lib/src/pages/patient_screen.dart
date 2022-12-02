import 'package:flutter/material.dart';
import 'package:projectroots/activities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Color blue = Color.fromARGB(255, 24, 155, 116);

class PatientScreen extends StatelessWidget {
  String loggedInUsername = "Grandma Varuni";
  _navigateToScreen(context, path) {
    Navigator.of(context).pushNamed(path);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: Colors.greenAccent),
        child: Scaffold(
          //appBar: AppBar(backgroundColor: Color(0xFFA4C639)),
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
            height: 1000.0,
            padding: const EdgeInsets.symmetric(vertical: 100.0),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 60,
                      child: ClipOval(
                        child: Image.asset(
                          "/Users/anuragrao/git_repos/ProjectRoots/assets/images/patient_record.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Center(
                      heightFactor: 1.5,
                      child: Center(
                        heightFactor: 1.5,
                        child: Text(
                          "Hello, ${loggedInUsername}!",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 63, 57, 57),
                              fontSize: 26,
                              fontFamily: 'bold',
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                    ),
                    Center(
                        heightFactor: 1.5,
                        child: ButtonTheme(
                            minWidth: 600.0,
                            height: 100.0,
                            child: ElevatedButton(
                              onPressed: () =>
                                  _navigateToScreen(context, TodoActivity.path),
                              child: const Text(
                                "To-do Reminders",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(250, 60),
                                  primary: Color.fromARGB(255, 10, 10, 10),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 20)),
                            ))),
                    Center(
                        heightFactor: 1.5,
                        child: ButtonTheme(
                            minWidth: 600.0,
                            height: 100.0,
                            child: ElevatedButton(
                              onPressed: () => _navigateToScreen(
                                  context, WordSearchActivity.path),
                              child: const Text(
                                "Word Search",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(250, 60),
                                  primary: Color.fromARGB(255, 10, 10, 10),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 20)),
                            ))),
                    Center(
                        heightFactor: 1.5,
                        child: ButtonTheme(
                            minWidth: 600.0,
                            height: 100.0,
                            child: ElevatedButton(
                              onPressed: () => _navigateToScreen(
                                  context, ReverseSpellActivity.path),
                              child: const Text(
                                "Reverse Spell",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(250, 60),
                                  primary: Color.fromARGB(255, 10, 10, 10),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 20)),
                            ))),
                    Center(
                        heightFactor: 1.7,
                        child: ButtonTheme(
                            minWidth: 600.0,
                            height: 170.0,
                            child: ElevatedButton(
                                child: const Text(
                                  "Picture Quiz",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                onPressed: () => _navigateToScreen(
                                    context, PictureQuizActivity.path),
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(250, 60),
                                    primary: Color.fromARGB(255, 10, 10, 10),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 20))))),
                  ]),
            ),
          ),
        ));
  }
}
