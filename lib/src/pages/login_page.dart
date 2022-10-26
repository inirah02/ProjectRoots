import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return Container(
      constraints: BoxConstraints(
          maxHeight: double.infinity,
          maxWidth: double.infinity,
          minHeight: double.infinity,
          minWidth: double.infinity),
      decoration: BoxDecoration(
        //color: Color(0xfffffde8),
        image: DecorationImage(
          image: AssetImage("assets/images/background.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(children: [
        Center(
          heightFactor: 18,
          child: ElevatedButton(
            onPressed: () async {
              final credential = await signInWithGoogle();
              print(credential.user?.uid);
              print(credential.user?.email);
            },
            child: Text(
              "Login",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        Center(
          heightFactor: 1.5,
          child: Text('Connected to you and your\'s',
              style: TextStyle(color: Colors.white)),
        ),
      ]),
    );
  }
}
