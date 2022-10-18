import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectroots/pages.dart';


final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final firestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

// 2
final authStateChangesProvider = StreamProvider<User?>(
    (ref) => ref.watch(firebaseAuthProvider).authStateChanges());


  // TODO: Check if user is logged-in,
  // if user is logged-in show main-menu
  // if user is not logged-in show login screen
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // return LoginPage();
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
                  // return Text(snapshot.data!.data().toString());
                  return MainMenu(snapshot.data!.data()!);
                }
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return const CircularProgressIndicator(); 
              });
          },
          error: (error, _) => Text("Error: $error"),
          loading: () => const CircularProgressIndicator() 
        )
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Home Page'),
    //   ),
    //   body: Center(
    //     child: Container(
    //       height: 80,
    //       width: 150,
    //       decoration: BoxDecoration(
    //         color: Colors.blue,
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //       child: ElevatedButton(
    //         onPressed: () {
    //           Navigator.pop(context);
    //         },
    //         child: Text(
    //           'Welcome',
    //           style: TextStyle(color: Colors.white, fontSize: 25),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
