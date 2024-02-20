import 'dart:io';

import 'package:edumarshals/screens/time_table.dart';

import 'Screens/Homepage.dart';

import 'package:edumarshals/Screens/OverAllAttendance.dart';
import 'package:edumarshals/Screens/Profile.dart';
import 'package:edumarshals/Screens/Subject_Assignment.dart';

import 'package:edumarshals/screens/contact_details.dart';
import 'package:edumarshals/screens/guardian_info.dart';
// >>>>>>> Development
import 'package:edumarshals/screens/splash.dart';
import 'package:flutter/material.dart';
// import 'package:t/homePage.dart';
import 'package:edumarshals/screens/login.dart';

import 'package:edumarshals/screens/profile_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PreferencesManager.init(); //
  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class PreferencesManager {
  static late PreferencesManager _instance;
  late SharedPreferences _prefs;

  // private constructor
  PreferencesManager._();

  // factory method to access the singleton instance
  factory PreferencesManager() {
    return _instance;
  }

  // initialize the singleton instance
  static Future<void> init() async {
    _instance = PreferencesManager._();
    _instance._prefs = await SharedPreferences.getInstance();
  }

  // add methods for storing and retrieving data
  String get email => _prefs.getString('email') ?? '';
  set email(String value) => _prefs.setString('email', value);

  String get name => _prefs.getString('name') ?? '';
  set name(String value) => _prefs.setString('name', value);
  String get token => _prefs.getString('token') ?? '';
  set token(String value) => _prefs.setString('token', value);
  String get ack => _prefs.getString('ack') ?? '';
  set ack(String value) => _prefs.setString('ack', value);

  // add more methods as needed
}
