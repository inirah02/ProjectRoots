import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projectroots/src/app.dart';
import 'firebase_options.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

 