import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_maker/view/screens/homescreen.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacementNamed('/home'));
    return Scaffold(
      backgroundColor: const Color(0xffFF936F),
      body: Center(
        child: Text("ResumeX",
            style: GoogleFonts.pacifico(color: Colors.white, fontSize: 35)),
      ),
    );
  }
}
