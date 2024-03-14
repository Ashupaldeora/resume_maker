import 'package:flutter/material.dart';
import 'package:resume_maker/view/screens/homescreen.dart';
import 'package:resume_maker/view/screens/resumescreen.dart';
import 'package:resume_maker/view/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => splashscreen(),
        '/home': (context) => homescreen(),
        '/resume': (context) => resume(),
      },
    );
  }
}
