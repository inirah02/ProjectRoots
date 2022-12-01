import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectroots/src/app.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginData {
  String first_name = '';

  String name = '';
  String ph_num = '';
  int no_of_children = 0;
  String spouse_name = '';
  String daughter_name = '';
  String son_name = '';
  String city = '';
  String fav_food = '';
  String fav_color = '';
  String locality_name = '';
  String allergies = '';
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  _LoginData _data = new _LoginData();
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  void submit() {
    // First validate form.
    if (this._formKey.currentState!.validate()) {
      _formKey.currentState?.save(); // Save our form now.

      print('Printing the login data.');
      print('name: ${_data.name}');
    }
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Query form'),
      ),
      body: Container(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: this._formKey,
            child: ListView(
              children: <Widget>[
                TextFormField(
                    decoration:
                        InputDecoration(hintText: 'What is your first name?'),
                    onSaved: (String? value) {
                      this._data.first_name = value!;
                    }),
                TextFormField(
                    decoration: InputDecoration(
                        hintText: 'What is your spouse\'s name?'),
                    onSaved: (String? value) {
                      this._data.spouse_name = value!;
                    }),
                TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Which city do you live in?'),
                    onSaved: (String? value) {
                      this._data.city = value!;
                    }),
                TextFormField(
                    // Use secure text for passwords.
                    decoration: InputDecoration(
                        labelText: 'name your locality / apartment?'),
                    onSaved: (String? value) {
                      this._data.locality_name = value!;
                    }),
                TextFormField(
                    // Use secure text for passwords.
                    decoration:
                        InputDecoration(labelText: 'Name your favourite food?'),
                    onSaved: (String? value) {
                      this._data.fav_food = value!;
                    }),
                TextFormField(
                    // Use secure text for passwords.
                    decoration: InputDecoration(
                        labelText: 'Do you have any allergies?'),
                    onSaved: (String? value) {
                      this._data.allergies = value!;
                    }),
                Container(
                  width: screenSize.width,
                  child: ElevatedButton(
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      _fireStore.collection('test').add({
                        'created': Timestamp.now(),
                      });
                    },

                    // Only if the input form is valid (the user has entered text)
                  ),
                  margin: EdgeInsets.only(top: 20.0),
                )
              ],
            ),
          )),
    );
  }
}
