import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_sample/app.dart';
import 'package:firebase_sample/firebase_options.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
