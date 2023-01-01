import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectroots/pages.dart';
import 'package:projectroots/src/app.dart';

class QueryFormPage extends StatefulWidget {
  static var path = 'projectroots/src/pages/signup_page.dart';

  @override
  State<StatefulWidget> createState() => new _QueryFormPageState();
}

class _QueryFormPageState extends State<QueryFormPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  // _LoginData _data = new _LoginData();
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

//   void submit() {
//     // First validate form.
//     if (this._formKey.currentState!.validate()) {
//       _formKey.currentState?.save(); // Save our form now.

//       print('Printing the login data.');
//       print('name: ${_data.name}');
//     }
//   }

//   void getCurrentUser() async {
//     try {
//       final user = _auth.currentUser;
//       if (user != null) {
//         loggedInUser = user;
//         print(loggedInUser.email);
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Size screenSize = MediaQuery.of(context).size;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Query form'),
//       ),
//       body: Container(
//           padding: EdgeInsets.all(20.0),
//           child: Form(
//             key: this._formKey,
//             child: ListView(
//               children: <Widget>[
//                 TextFormField(
//                     decoration:
//                         InputDecoration(hintText: 'What is your first name?'),
//                     onSaved: (String? value) {
//                       this._data.first_name = value!;
//                     }),
//                 TextFormField(
//                     decoration: InputDecoration(
//                         hintText: 'What is your spouse\'s name?'),
//                     onSaved: (String? value) {
//                       this._data.spouse_name = value!;
//                     }),
//                 TextFormField(
//                     decoration: InputDecoration(
//                         labelText: 'Which city do you live in?'),
//                     onSaved: (String? value) {
//                       this._data.city = value!;
//                     }),
//                 TextFormField(
//                     // Use secure text for passwords.
//                     decoration: InputDecoration(
//                         labelText: 'name your locality / apartment?'),
//                     onSaved: (String? value) {
//                       this._data.locality_name = value!;
//                     }),
//                 TextFormField(
//                     // Use secure text for passwords.
//                     decoration:
//                         InputDecoration(labelText: 'Name your favourite food?'),
//                     onSaved: (String? value) {
//                       this._data.fav_food = value!;
//                     }),
//                 TextFormField(
//                     // Use secure text for passwords.
//                     decoration: InputDecoration(
//                         labelText: 'Do you have any allergies?'),
//                     onSaved: (String? value) {
//                       this._data.allergies = value!;
//                     }),
//                 Container(
//                   width: screenSize.width,
//                   child: ElevatedButton(
//                     child: Text(
//                       'Login',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     onPressed: () async {
//                       _fireStore.collection('test').add({
//                         'created': Timestamp.now(),
// });},
//                       Navigator.pop());

//                     // Only if the input form is valid (the user has entered text)
//                   ),
//                   margin: EdgeInsets.only(top: 20.0),
//                 )
//               ],
//             ),
//           )),
//     );
//   }
// }
  late String day = '';
  late TextEditingController dayTextController;
  late String first_name;
  late TextEditingController first_nameTextController;
  late String ph_num;
  late TextEditingController ph_numTextController;
  late int no_of_children;
  late String spouse_name;
  late TextEditingController spouse_nameTextController;
  String daughter_name = '';
  late String son_name = '';
  late String city = '';
  late TextEditingController cityTextController;
  late String fav_food = '';
  late TextEditingController house_colourTextController;
  String house_colour = '';
  String locality_name = '';
  late TextEditingController locality_nameTextController;
  late String allergies;
  late TextEditingController allergiesTextController;

// class _LoginData {
//   late String first_name = 'asd';
//   String ph_num = '';
//   int no_of_children = 0;
//   String spouse_name = '';
//   String daughter_name = '';
//   late String son_name = '';
//   late String city = '';
//   String fav_food = '';
//   String fav_color = '';
//   String locality_name = '';
//   String allergies = '';
// }

  void submit() {
    // First validate form.
    if (this._formKey.currentState!.validate()) {
      _formKey.currentState?.save(); // Save our form now.

      print('Printing the login data.');
      //print('name: ${_data.first_name}');
    }
  }

  _navigateToScreen(context, path) {
    Navigator.of(context).pushNamed(path);
  }

  @override
  void dispose() {
    dayTextController.dispose();
    first_nameTextController.dispose();
    cityTextController.dispose();
    spouse_nameTextController.dispose();
    locality_nameTextController.dispose();
    allergiesTextController.dispose();
    house_colourTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    dayTextController = TextEditingController();
    first_nameTextController = TextEditingController();
    cityTextController = TextEditingController();
    spouse_nameTextController = TextEditingController();
    locality_nameTextController = TextEditingController();
    allergiesTextController = TextEditingController();
    house_colourTextController = TextEditingController();
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
                TextField(
                  controller: first_nameTextController,
                  onChanged: (value) {
                    first_name = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'First name',
                    alignLabelWithHint: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                TextField(
                  controller: spouse_nameTextController,
                  onChanged: (value) {
                    spouse_name = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Spouse\'s name',
                    alignLabelWithHint: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                TextField(
                  controller: cityTextController,
                  onChanged: (value) {
                    city = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Name your city',
                    alignLabelWithHint: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                TextField(
                  controller: locality_nameTextController,
                  onChanged: (value) {
                    locality_name = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Name your apartment / locality ',
                    alignLabelWithHint: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                TextField(
                  controller: house_colourTextController,
                  onChanged: (value) {
                    fav_food = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'What colour is your house',
                    alignLabelWithHint: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                TextField(
                  controller: allergiesTextController,
                  onChanged: (value) {
                    allergies = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Name any allergies you have',
                    alignLabelWithHint: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                // TextFormField(
                //     decoration:
                //         InputDecoration(hintText: 'What is your first name?'),
                //     onSaved: (String? value) {
                //       this._data.first_name = value!;
                //     }),
                // TextFormField(
                //     decoration: InputDecoration(
                //         hintText: 'What is your spouse\'s name?'),
                //     onSaved: (String? value) {
                //       this._data.spouse_name = value!;
                //     }),
                // TextFormField(
                //     decoration: InputDecoration(
                //         labelText: 'Which city do you live in?'),
                //     onSaved: (String? value) {
                //       this._data.city = value!;
                //     }),
                // TextFormField(
                //     // Use secure text for passwords.
                //     decoration: InputDecoration(
                //         labelText: 'name your locality / apartment?'),
                //     onSaved: (String? value) {
                //       this._data.locality_name = value!;
                //     }),
                // TextFormField(
                //     // Use secure text for passwords.
                //     decoration:
                //         InputDecoration(labelText: 'Name your favourite food?'),
                //     onSaved: (String? value) {
                //       this._data.fav_food = value!;
                //     }),
                // TextFormField(
                //     // Use secure text for passwords.
                //     decoration: InputDecoration(
                //         labelText: 'Do you have any allergies?'),
                //     onSaved: (String? value) {
                //       this._data.allergies = value!;
                //     }),
                Container(
                  width: screenSize.width,
                  child: ElevatedButton(
                      child: Text(
                        'Get Started',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        try {
                          await _fireStore
                              .collection('users')
                              .doc(_auth.currentUser!.uid)
                              .update({
                            'created': Timestamp.now(),
                            'first_name': first_name,
                            'spouse_name': spouse_name,
                            'city': city,
                            'locality_name': locality_name,
                            'house_colour': house_colour,
                            'allergy': allergies,
                            'profile_type': 0
                            //'registered':
                          });
                        } catch (e) {
                          Navigator.of(context).pushNamed(PatientScreen.path);
                          print(e);
                        }
                        ;

                        Navigator.of(context).pushNamed(PatientScreen.path);
                      }

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
