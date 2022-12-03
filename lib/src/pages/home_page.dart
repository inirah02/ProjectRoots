import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectroots/pages.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final firestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

// 2
final authStateChangesProvider = StreamProvider<User?>(
    (ref) => ref.watch(firebaseAuthProvider).authStateChanges());

// ignore: todo - quick fix acc
// TODO:  Check if user is logged-in
// if user is logged-in show main-menu
// if user is not logged-in show login screen
//Once logged in show respective main menus wrt to the profile type
// patient main menu:
//1)Todo
//2)Reverse Spell
//3)Word Search
//* hints page for wordsearch
//4)Picture Quiz
//5)Phone Recall
// caregiver main menu:
// 1)add todo reminders
// 2) modify medicine list
// 3) check vitals of patient ?
// Doctor main menu
// 1) medications
// 2)game stats?
// patient history

class HomePage extends ConsumerWidget {
  static const path = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateChangesProvider);
    final db = ref.read(firestoreProvider);
    return Scaffold(
      body: Center(
          child: user.when(
              data: (data) {
                if (data == null) {
                  return LoginPage();
                }
                return FutureBuilder(
                    future: db.collection('users').doc(data.uid).get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        Map<String, dynamic> user_data =
                            snapshot.requireData.data()!;
                        if (user_data.containsKey("first_name")) {
                          return MainMenu(snapshot.data!.data()!);
                        } else {
                          return QueryFormPage();
                        }
                         
                      }
                      if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }
                      return const CircularProgressIndicator();
                    });
              },
              error: (error, _) => Text("Error: $error"),
              loading: () => const CircularProgressIndicator())),
    );
  }
}
