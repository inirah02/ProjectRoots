import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectroots/activities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Color blue = Color.fromARGB(255, 24, 155, 116);

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});
  static var path = "projectroots/src/pages/patient_screen.dart";
  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  String? user_name;
  _navigateToScreen(context, path) {
    Navigator.of(context).pushNamed(path);
  }

  Future<String> getCurrentUser() async {
    final user = _auth.currentUser;
    if (user == null) {
      return Future.value("User");
    } else {
      Map<String, dynamic> user_deets =
          (await _fireStore.collection('users').doc(user.uid).get()).data()!;
      return user_deets["first_name"];
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser().then((value) {
      setState(() {
        user_name = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Project Roots",
            textAlign: TextAlign.center,
            ),
          backgroundColor: Color.fromRGBO(106, 153, 78, 1),
        ),
        body: Theme(
            data: ThemeData.dark()
                .copyWith(scaffoldBackgroundColor: Colors.greenAccent),
            child: Scaffold(
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
                        // CircleAvatar(
                        //   radius: 60,
                        //   child: ClipOval(
                        //     child: Image.asset(
                        //       "/Users/anuragrao/git_repos/ProjectRoots/assets/images/patient_record.jpg",
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        // ),
                        Center(
                          heightFactor: 1.5,
                          child: Center(
                            heightFactor: 1.5,
                            child: Text(
                              user_name == null
                                  ? "Hello, User!"
                                  : "Hello, ${user_name}",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 63, 57, 57),
                                  fontSize: 26,
                                  fontFamily: 'bold',
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        Center(
                            heightFactor: 1.5,
                            child: ButtonTheme(
                                minWidth: 600.0,
                                height: 100.0,
                                child: ElevatedButton(
                                  onPressed: () => _navigateToScreen(
                                      context, TodoActivity.path),
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
                                        primary:
                                            Color.fromARGB(255, 10, 10, 10),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 50, vertical: 20))))),
                      ]),
                ),
              ),
            )));
  }
}
