import 'dart:io';
// import 'package:edumarshals/Screens/Attendance/OverAllAttendance.dart';
import 'package:edumarshals/Screens/Login/login.dart';
import 'package:edumarshals/Screens/User_Info/Personal_Info/profile_info.dart';
import 'package:edumarshals/Screens/User_Info/Profile.dart';
import 'package:edumarshals/Screens/splash.dart';
import 'package:edumarshals/screens/time_table.dart';
import 'package:flutter/material.dart';
import 'Screens/HomePage/Homepage.dart';
import 'package:edumarshals/Screens/User_Info/Personal_Info/Personal_Info_Data.dart';
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
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
       initialRoute: 'login',  
      routes: {
        'splashscreen': (context) =>SplashScreen(),
        'homepage': (context) => const Homepage(),
        'login': (context) => Login(),
        // 'overallattendance':(context)=>OverAllAttd(),
        'timetable':(context) => ExamTimetableScreen(),
        'profile':(context) => Profile(),
        //  'profileinfo':(context) => profileInfo(),

        'personalinfo':(context) => PersonalInfoScreen(),


      },
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
  String get studentPhoto => _prefs.getString('studentPhoto') ?? '';
  set studentPhoto(String value) => _prefs.setString('studentPhoto', value);
  String get studentNumber => _prefs.getString('studentNumber') ?? '';
  set studentNumber(String value) => _prefs.setString('studentNumber', value);
  String get universityRollNumber => _prefs.getString('universityRollNumber') ?? '';
  set universityRollNumber(String value) => _prefs.setString('universityRollNumber', value);
  String get dob => _prefs.getString('dob') ?? '';
  set dob(String value) => _prefs.setString('dob', value);

  // add more methods as needed
}
