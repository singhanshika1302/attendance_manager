


import 'package:edumarshals/Screens/Document.dart';
import 'package:edumarshals/Screens/Homepage.dart';
import 'package:edumarshals/Screens/OverAllAttendance.dart';
import 'package:edumarshals/Screens/Postdemo.dart';
import 'package:edumarshals/Screens/profile_info.dart';
import 'package:edumarshals/Screens/splash.dart';
import 'package:edumarshals/screens/contact_details.dart';
// >>>>>>> Development
import 'package:flutter/material.dart';
// import 'package:t/homePage.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:PersonalInfoDisplayWidget(),
    );
  }
}

