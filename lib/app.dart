import 'package:firebase_sample/auth/auth.dart';
import 'package:firebase_sample/home.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      initialRoute: '/',
      routes: {
        // '/': (context) => const HomePage(),
        '/auth': (context) => const AuthPage(),
      },
    );
  }
}