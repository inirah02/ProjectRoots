import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectroots/src/pages/patient_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Future<UserCredential> signInWithGoogle() async {
    // Create a new provider
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);

    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(

          // alignment: Alignment.cente
          // padding: const EdgeInsets.all(10),
          child: Image.asset(
              'assets/images/roots_icon.jpeg',
              height: 250,

          ),
        ),
            )),
        SizedBox(height: 150),

        Container(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Text("Helping Those Tho Help Us The Most",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromARGB(255, 65, 141, 104),
                    fontSize: 20))),

        SizedBox(height: 40),
        Container(
            child: Center(
                // heightFactor: 1.5,
                child: ElevatedButton(
                  child: Text(
                    "Login",
                    style: TextStyle(fontStyle: FontStyle.normal),
                  ),
                  onPressed: () async {
                    final credential = await signInWithGoogle();
                    print(credential.user?.uid);
                    print(credential.user?.email);
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 69),
                      backgroundColor: Color.fromARGB(255, 10, 10, 10),
                      // padding: EdgeInsets.symmetric(
                      //     horizontal: 50, vertical: 20),
                      textStyle: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                ))),
        // Container(
        //     child: Row(
        //   children: <Widget>[
        //     const Text('Does not have account?'),
        //     TextButton(
        //       child: const Text(
        //         'Sign in',
        //         style: TextStyle(fontSize: 20),
        //       ),
        //       onPressed: () {
        //         //signup screen
        //       },
        //     )
        //   ],
        //   mainAxisAlignment: MainAxisAlignment.center,
        // )),
        Container(
            child: Center(
                heightFactor: 1.5,
                child: ElevatedButton(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontStyle: FontStyle.normal),
                  ),
                  onPressed: () async {},
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 69),
                      backgroundColor: Color.fromARGB(255, 10, 10, 10),
                      // padding: EdgeInsets.symmetric(
                      //     horizontal: 50, vertical: 20),
                      textStyle: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                ))),
      ],
    );
  }
}
