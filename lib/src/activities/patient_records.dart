// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, non_constant_identifier_names, sort_child_properties_last

import 'package:flutter/material.dart';

final Color darkGreen = Color.fromARGB(255, 171, 216, 162);

class PatientRecords extends StatelessWidget {
  get patient_picture => null;
  static const path = '/PatientRecords';
  @override
  Widget build(BuildContext context) {
    var center = Center(
      child: FadeInImage.memoryNetwork(
        placeholder: patient_picture,
        image: 'patient_record.jpg',
      ),
    );

    var parent = Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 100.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              buttonWidget("Patient History"),
              buttonWidget("Medication List"),
            ]),
      ),
    );

    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkGreen),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Patient Records',
            style: TextStyle(color: Color.fromARGB(255, 104, 221, 184)),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            center,
            parent,
          ]),
        ),
      ),
    );
  }

  Widget buttonWidget(String label) {
    return ButtonTheme(
      minWidth: 200.0,
      height: 80.0,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(label),
      ),
    );
  }
}
