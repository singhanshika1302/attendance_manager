import 'package:edumarshals/screens/contact_details.dart';
import 'package:edumarshals/screens/guardian_info.dart';
import 'package:edumarshals/screens/splash.dart';
import 'package:flutter/material.dart';
// import 'package:t/homePage.dart';
import 'package:edumarshals/screens/login.dart';
import 'package:edumarshals/screens/profile_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: contactInfo(),
    );
  }
}
